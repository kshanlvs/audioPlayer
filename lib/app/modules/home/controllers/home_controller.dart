

import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {

// audio plyaer by kishan kumar sharma


FlutterSound flutterSound  = FlutterSound();

late FlutterSoundRecorder flutterSoundRecorder;
FlutterSoundPlayer flutterSoundPlayer = FlutterSoundPlayer();
bool IsRecorderInitialized = false;
RxBool isRecording = false.obs;

Future record() async{
  if(!IsRecorderInitialized) return;
     await flutterSoundRecorder.startRecorder(toFile: "recording.aac");
     isRecording.value = true;

}


Future stop() async{
  if(!IsRecorderInitialized) return;
  await flutterSoundRecorder.stopRecorder();
  isRecording.value = false;
}

Future toggleRecording() async {
  if(flutterSoundRecorder.isStopped){
    await record();
  }
  else{
    if(flutterSoundRecorder.isRecording)
    await stop();
  }
}

 Future playAudio() async {
 
   if(flutterSoundPlayer.isOpen())
   await flutterSoundPlayer.startPlayer(fromURI:"recording.aac",whenFinished: finished );
 }

 finished(){
   Get.snackbar("finished", "finished");
 }
   
  final count = 0.obs;
  @override
  void onInit() async {
    flutterSoundRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if(status !=PermissionStatus.granted){
      throw RecordingPermissionException("Microphone Permission Required");
    }
    await flutterSoundRecorder.openAudioSession();
    await flutterSoundPlayer.openAudioSession();
    IsRecorderInitialized = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    flutterSoundRecorder.closeAudioSession();
       flutterSoundPlayer.openAudioSession();
   
    IsRecorderInitialized = true;
  }
  void increment() => count.value++;
}
