using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using Windows.System.Diagnostics;
using System.Diagnostics;
using Windows.Media.SpeechRecognition;
using System.ComponentModel;
using Windows.Web.Http;
// O modelo de item de Página em Branco está documentado em https://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x416

namespace AtomBit
{
    /// <summary>
    /// Uma página vazia que pode ser usada isoladamente ou navegada dentro de um Quadro.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            this.InitializeComponent();
            stopWatch.Start();
            backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            backgroundWorker1.ProgressChanged += BackgroundWorker1_ProgressChanged; ;
            backgroundWorker1.DoWork += new DoWorkEventHandler(this.backgroundWorker1_DoWork);
            backgroundWorker1.WorkerReportsProgress = true;
            backgroundWorker1.WorkerSupportsCancellation = false;
            backgroundWorker1.RunWorkerAsync();
        }
        Stopwatch stopWatch = new Stopwatch();
        private BackgroundWorker backgroundWorker1;

        private void BackgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            update();

        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)

        {
            double maintimer = stopWatch.ElapsedMilliseconds;
            double maintimerupdt = stopWatch.ElapsedMilliseconds;
            BackgroundWorker worker = sender as BackgroundWorker;
            int i = 0;
            while (i < 10)
            {
                if (worker.CancellationPending)
                    break;

                if (maintimer + 100 < stopWatch.ElapsedMilliseconds)
                {
                    run();
                    i++;
                    if (maintimerupdt + 100 < stopWatch.ElapsedMilliseconds)
                    {
                        worker.ReportProgress(i);
                        maintimerupdt = stopWatch.ElapsedMilliseconds;
                    }
                    maintimer = stopWatch.ElapsedMilliseconds;
                }
                if (i == 9) { i = 0; }
            }
        }
        int number = 0;
        string res;
        char[] arr = new char[5];
        char[] last_arr = new char[5];
        public async void run()
        {
            Uri uri = new Uri("http://127.0.0.1/AtomBit/AI_output.php", UriKind.Absolute);
              var httpClient = new HttpClient();
             var result = await httpClient.GetStringAsync(uri);
            res = result;
            arr = res.ToCharArray(0, 3);
           

        }

        public void update()
        {
            button.Content = arr[2];
            if (arr[0] != last_arr[0] && arr[0] == '0') { falar("ar condicionado desligado"); }
            if (arr[0] != last_arr[0] && arr[0] == '1') { falar("ar condicionado ligado"); }

            if (arr[1] != last_arr[1] && arr[1] == '0') { falar("lampada desligada"); }
            if (arr[1] != last_arr[1] && arr[1] == '1') { falar("lampada ligada"); }

            if (arr[2] != last_arr[2] && arr[2] == '0') { falar("Fechando portão"); }
            if (arr[2] != last_arr[2] && arr[2] == '1') { falar("Abrindo portão"); }

           



            for (int i = 0; i < 3; i++)
            {
                last_arr[i] = arr[i];
            }
        }

        private async void button_Click(object sender, RoutedEventArgs e)
        {
            //  falar("Horário atual: 7 horas e 52 minutos");
            



        }
        public async void falar(string fala)
        {
            int i = 0;
            double last = stopWatch.ElapsedMilliseconds;
            while (i < 3)
            {
                if (stopWatch.ElapsedMilliseconds + 250 > last)
                {
                    MediaElement mediaElement = new MediaElement();
                    var synth = new Windows.Media.SpeechSynthesis.SpeechSynthesizer();
                    Windows.Media.SpeechSynthesis.SpeechSynthesisStream stream = await synth.SynthesizeTextToStreamAsync(fala);
                    mediaElement.SetSource(stream, stream.ContentType);
                    mediaElement.Play();
                    i++;
                    last = stopWatch.ElapsedMilliseconds;
                }
            }

        }
        public async void ouvir()
        {
            var speechRecognizer = new Windows.Media.SpeechRecognition.SpeechRecognizer();

            // Compile the dictation grammar by default.
            await speechRecognizer.CompileConstraintsAsync();

            // Start recognition.
            Windows.Media.SpeechRecognition.SpeechRecognitionResult speechRecognitionResult = await speechRecognizer.RecognizeWithUIAsync();

            // Do something with the recognition result.
            var messageDialog = new Windows.UI.Popups.MessageDialog(speechRecognitionResult.Text, "Text spoken");
            button.Content = speechRecognitionResult.Text;
            await messageDialog.ShowAsync();
        }
    }
}
