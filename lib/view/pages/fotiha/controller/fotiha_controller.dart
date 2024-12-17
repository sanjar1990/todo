import 'dart:io';
import 'package:al_fatiha/controller/base/base_controller.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FotihaController extends BaseController{
  bool isLoading=false;
  final String videoUrl="https://youtu.be/PLHddf-1MHY";
  final String videoTitle="Fotiha surasida yo‘l qo‘yilishi mumkin bo‘lgan xatolar ";
  final String readRuleOne="Qiroatni yozib yuborish uchun quyidagi tugmani 1 marta bosing";
  final String readRuleTwo="Qiroatni 10dan 120 sekundgacha yuboring";
  bool isRecorderReady=false;
  bool isRecordingStarted=false;
  late final recorder=FlutterSoundRecorder();
  File? recordedAudio;
  String twoDigitMinutes='';
  String twoDigitSecond='';
  String recordedAudioPath='';
  bool isPlayingAudio=false;

  // late AudioPlayer audioPlayer;
  //play audio
  late final PlayerController audioPlayerController;
  late YoutubePlayerController playerController;
  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }
  @override
  void onInit() {
    audioPlayerController = PlayerController();
    final videoId=YoutubePlayer.convertUrlToId(videoUrl);
    playerController=YoutubePlayerController(
      initialVideoId: videoId!,
    flags: YoutubePlayerFlags(autoPlay: false),
    );
    initRecorder();
    super.onInit();
  }

  Future<void>startPlayer()async{
    print('PATHHH:::$recordedAudioPath');
    audioPlayerController.preparePlayer(path: recordedAudioPath);
    isPlayingAudio=true;
    audioPlayerController.startPlayer();
    print('PLAYINGGGG');
    update();
  }
  Future<void>stopPlayer()async{
    isPlayingAudio=false;
    audioPlayerController.stopPlayer();
    print('STOPPED');
    update();
  }

  Future<void>deleteAudio()async{
    recordedAudio=null;
    isRecordingStarted=false;
    twoDigitMinutes='';
    twoDigitSecond='';
    recorder.deleteRecord(fileName: recordedAudioPath);
    update();

  }
  Future<void> initRecorder ()async{
    final status=await Permission.microphone.request();
    if(status!=PermissionStatus.granted){
      initRecorder();
    }
    await recorder.openRecorder();
    isRecorderReady=true;
    recorder.setSubscriptionDuration(Duration(milliseconds: 500));
  }
  Future<void>startRecord()async{
    if(!isRecorderReady) return;
  await recorder.startRecorder(toFile:'audio');
    isRecordingStarted=true;
  update();
  }
  Future<void>stop()async{
    if(!isRecorderReady) return;

    final path=await recorder.stopRecorder();
    if(path!=null){
      recordedAudioPath=path;
      recordedAudio=File(path);
      // print('RECORD FILE PATH:::$audioFile');
    }

    update();
  }
}