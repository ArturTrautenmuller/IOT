from urllib import request
from datetime import datetime

st = ""
last_ar_work = 0
last_ar_stage = 0

last_minute = 0

while(1):
    f = request.urlopen('http://[::1]/AtomBit/engine_ar.php')
    s = []
    a = ""
    i = 0
    x = 0
    st = ""
    while(a != "b'@'"):
        a = str(f.read(1))
        s.append(list(a)[2])
        i += 1


    for x in range(0,i):
        st += s[x]

    print(st)
    print(x)
    print(len(s))
    ls = []
    lh = []
    lm = []
    ds = []
    dh = []
    dm = []
    sensor_temp = 0
    temp = 0
    ar_work = 0
    ar_stage = 0

    lampada_stage = []
    lpls = []
    lplh = []
    lplm = []
    lpds = []
    lpdh = []
    lpdm = []
    for i2 in range(3):
        lpls.append([])
        lplh.append([])
        lplm.append([])
        lpds.append([])
        lpdh.append([])
        lpdm.append([])

    
        
    lastlm = 0
    lastdm = 0

    readn = 0
    readv = 0
    nome = ""
    value = ""

    y = 0
    while(y < i):
        if(s[y] == "?"):
            readn = 1
            readv = 0
            y += 1
        if(s[y] == "="):
            readn = 0
            readv = 1
            y += 1
        if(s[y] == "&"):
            readn = 1
            readv = 0
            y += 1
            if(nome == "ls1"):
                lpls[0].append(int(value))
            if(nome == "lh1"):
                lplh[0].append(int(value))
            if(nome == "lm1"):
                lplm[0].append(int(value))
            if(nome == "ds1"):
                lpds[0].append(int(value))
            if(nome == "dh1"):
                lpdh[0].append(int(value))
            if(nome == "dm1"):
                lpdm[0].append(int(value))

            if(nome == "ls2"):
                lpls[1].append(int(value))
            if(nome == "lh2"):
                lplh[1].append(int(value))
            if(nome == "lm2"):
                lplm[1].append(int(value))
            if(nome == "ds2"):
                lpds[1].append(int(value))
            if(nome == "dh2"):
                lpdh[1].append(int(value))
            if(nome == "dm2"):
                lpdm[1].append(int(value))

            if(nome == "ls3"):
                lpls[2].append(int(value))
            if(nome == "lh3"):
                lplh[2].append(int(value))
            if(nome == "lm3"):
                lplm[2].append(int(value))
            if(nome == "ds3"):
                lpds[2].append(int(value))
            if(nome == "dh3"):
                lpdh[2].append(int(value))
            if(nome == "dm3"):
                lpdm[2].append(int(value))
                
            
            if(nome == "lmps"):
                lampada_stage.append(int(value))
            if(nome == "stg"):
                ar_stage = int(value)
            if(nome == "tps"):
                sensor_temp = float(value)
            if(nome == "wk1"):
                ar_work = int(value)
            if(nome == "tp1"):
                temp = int(value)
            if(nome == "ls"):
                ls.append(int(value))
            if(nome == "lh"):
                lh.append(int(value))
            if(nome == "lm"):
                lm.append(int(value))
            if(nome == "ds"):
                ds.append(int(value))
            if(nome == "dh"):
                dh.append(int(value))
            if(nome == "dm"):
                dm.append(int(value))
            nome = ""
            value = ""
        if(readn == 1):
            nome += s[y]
        if(readv == 1):
            value += s[y]
        y += 1

    print(temp)
    print(ar_work)
    print(lh[1])

    if(ar_work == 0):
        ar_stage = 0
    
    if(ar_work == 1):
        if(sensor_temp >= temp + 1 and ar_stage == 0):
            ar_stage = 1
        if(sensor_temp <= temp - 1 and ar_stage == 1):
            ar_stage = 0
    now = datetime.today()
    weekday = now.weekday()
    hour = now.hour
    minute = now.minute

    for x1 in range(0,len(ls)):
        if(ls[x1] == weekday and lh[x1] == hour and lm[x1] == minute and lm[x1] != last_minute):
            ar_work = 1
        if(ds[x1] == weekday and dh[x1] == hour and dm[x1] == minute and dm[x1] != last_minute):
            ar_work = 0

    last_lampada_stage = []
    for i3 in range(0,len(lampada_stage)):
        last_lampada_stage.append(lampada_stage[i3])
    
    ok = 0
    for x2 in range(0,len(lpls)):
        for x3 in range(0,len(lpls[x2])):
            if(lpls[x2][x3] == weekday and lplh[x2][x3] == hour and lplm[x2][x3] == minute and lplm[x2][x3] != last_minute):
                lampada_stage[x2] = 1
                ok = 1
            if(lpds[x2][x3] == weekday and lpdh[x2][x3] == hour and lpdm[x2][x3] == minute and lpdm[x2][x3] != last_minute):
                lampada_stage[x2] = 0
            
                        
                    
    
    
    
    last_minite = minute
    print(lplm[0])
    print(lampada_stage[0])
    print(lpdm[1][1])
    

    url = "http://[::1]/AtomBit/engine_ar_input.php"
    data = ""
    data += "?s="
    data += str(ar_stage)
    data += "&w="
    data += str(ar_work)
    data += "&l1="
    data += str(lampada_stage[0])
    data += "&l2="
    data += str(lampada_stage[1])
    data += "&l3="
    data += str(lampada_stage[2])
    
    url += data
    print(url)
    lamp_dif = 0
    for i4 in range(0,len(lampada_stage)):
        if(lampada_stage[i4] != last_lampada_stage[i4]):
            lamp_dif = 1
    
    if(ar_stage != last_ar_stage or ar_work != last_ar_work or lamp_dif == 1):
        f1 = request.urlopen(url)
       
    last_ar_stage = ar_stage
    last_ar_work = ar_work

    
    
    

        
    

    
    

        







        
    
    
    
    

