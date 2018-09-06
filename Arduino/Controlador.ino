#include <DHT.h>
#include <DHT_U.h>


#include <SPI.h>
#include <Ethernet.h>

#define DHTPIN A1 // pino que estamos conectado
#define DHTTYPE DHT11 // DHT 11
DHT dht(DHTPIN, DHTTYPE);



byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte server[] = {192,168,1,101};

char res[100];
int i = 0;
int j =0;
int state_ar = 0;
int portao = 0;
int last_p = 0;
int vp;
int sl1 = 0;
int sl2 = 0;
int sl3 = 0;
int lampred1 = 0;
int lampgreen1 = 0;
int lampblue1 = 0;


String nome = "";
String value = "";
bool readn = false;
bool readv = false;

String back = "";
String data = "";

String url_a = "";



IPAddress ip(192,168,1,120);
EthernetClient client;

void setup() {
dht.begin();
pinMode(13,OUTPUT);//r
pinMode(12,OUTPUT);//g
pinMode(11,OUTPUT);//b

pinMode(4,OUTPUT);//m
pinMode(53,OUTPUT);
pinMode(52,OUTPUT);

Serial.begin(9600);
Ethernet.begin(mac, ip);
Serial.println("connecting...");
delay(1000);  

}

void loop() {

  float h = dht.readHumidity();
  float t = dht.readTemperature();
if (isnan(t) || isnan(h)) 
  {
    Serial.println("Failed to read from DHT");
    h = 0; t=0;
  } 
  Serial.print("T=");
  Serial.println(t);
data = "";
data += "?temp=";
data += String(t);
data += "&umid=";
data+= String(h);
url_a = "GET http://192.168.1.101/AtomBit/arduino.php";
url_a += data;

if(client.connect(server,80)){
  Serial.println("conectado");
  client.println(url_a);
  Serial.println("enviado");
  
  
  }else{Serial.println("conexão falhou");}

back = "";

 while(client.available()){
   char c = client.read();
   res[i] = c;
   back+=c;
   i++;
 //  Serial.println(c);  
  }
  
 // Serial.println(res[0]);
 // Serial.println(res[1]);
  if(!client.connected()){
    //Serial.println("disconnecting");
    client.stop();
    }

  //
for(j=0;j<i;j++)
{
if(res[j] == '?'){ readn = true; readv = false; j++;}
if(res[j] == '='){readn = false; readv = true; j++;}
if(res[j] == '&'){readn = true; readv = false;j++;

        if(nome == "s1"){sl1 = value.toInt(); Serial.print(value); Serial.println("<");}
         if(nome == "s2"){sl2 = value.toInt();}
          if(nome == "s3"){sl3 = value.toInt(); Serial.println("not");}
         if(nome == "r1"){lampred1 = value.toInt(); }
         if(nome == "g1"){lampgreen1 = value.toInt(); }
          if(nome == "b1"){lampblue1 = value.toInt(); }
          if(nome == "sar"){state_ar = value.toInt();}
          if(nome == "p"){vp = value.toInt();}

          
          nome = "";
          value = "";
}  


if(readn){nome += res[j];}
if(readv){value += res[j];}
  
  
  }

  

Serial.println(sl1);
Serial.println(sl2);
Serial.println(lampred1);
Serial.println(i);
Serial.println(back);

if(sl1 == 1){analogWrite(13,255 - lampred1); analogWrite(12,255 - lampblue1); analogWrite(11,255 - lampgreen1); }
if(sl1 == 0){digitalWrite(13,HIGH); digitalWrite(12,HIGH); digitalWrite(11,HIGH);}


if(state_ar == 1){digitalWrite(4,HIGH);}
if(state_ar == 0){digitalWrite(4,LOW);}

if(vp == 0 || vp == 1){portao = vp;}

if(portao == 1 && portao != last_p) 
{
digitalWrite(53,HIGH);digitalWrite(52,LOW);
delay(300);
digitalWrite(53,LOW);  
}

if(portao == 0 && portao != last_p) 
{
digitalWrite(52,HIGH);digitalWrite(53,LOW);
delay(300);
digitalWrite(52,LOW);  
}





last_p = portao;
  i=0;
  delay(50);

}
