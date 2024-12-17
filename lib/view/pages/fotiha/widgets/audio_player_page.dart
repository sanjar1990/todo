// import 'package:al_fatiha/view/pages/fotiha/controller/fotiha_controller.dart';
// import 'package:al_fatiha/view/pages/fotiha/widgets/position_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:rxdart/rxdart.dart' as rx;
//
// class AudioPlayerPage extends StatefulWidget {
//   const AudioPlayerPage({super.key});
//
//   @override
//   State<AudioPlayerPage> createState() => _AudioPlayerPageState();
// }
//
// class _AudioPlayerPageState extends State<AudioPlayerPage> {
//       late AudioPlayer audioPlayer;
//       Duration _duration = Duration.zero;
//       Duration _position = Duration.zero;
//   Stream<PositionData> get positionDataStream =>
//       rx.Rx.combineLatest2<Duration, Duration?, PositionData>(
//             audioPlayer.positionStream,
//             audioPlayer.durationStream,
//                 (position, duration) => PositionData(position, duration ?? Duration.zero),
//       );
//       @override
//       void dispose() {
//             audioPlayer.dispose();
//             super.dispose();
//       }
//       @override
//   void initState() {
//             audioPlayer=AudioPlayer();
//             audioPlayer.positionStream.listen((position){
//                   _position=_position;
//             });
//             audioPlayer.durationStream.listen((duration){
//               print('DURATION${duration?.inSeconds}');
//       _duration=duration?? Duration.zero;
//             });
//             super.initState();
//   }
//       String formatDuration(Duration duration) {
//             String twoDigits(int n) => n.toString().padLeft(2, "0");
//             String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//             String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//             return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//       }
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<FotihaController>(
//         init: FotihaController(),
//         builder: (controller){
//           return  Scaffold(
//                 body: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                                   // StreamBuilder<PositionData>(
//                                   //       stream: positionDataStream,
//                                   //       builder: (context, snapshot) {
//                                   //             final positionData = snapshot.data;
//                                   //             return Column(
//                                   //                   children: [
//                                   //                     Slider(
//                                   //                       min: 0.0,
//                                   //                       max: positionData?.duration.inMilliseconds.toDouble() ?? 1.0,
//                                   //                       value: (positionData?.position.inMilliseconds.toDouble() ?? 0.0).clamp(
//                                   //                           0.0,
//                                   //                           positionData?.duration.inMilliseconds.toDouble() ?? 1.0),
//                                   //                       onChanged: (value) {
//                                   //                         final seekPosition = Duration(milliseconds: value.toInt());
//                                   //                         audioPlayer.seek(seekPosition);
//                                   //                       },
//                                   //                     ),
//                                   //                         Text(
//                                   //                               "${formatDuration(positionData?.position ?? Duration.zero)} / ${formatDuration(positionData?.duration ?? Duration.zero)}",
//                                   //                         ),
//                                   //                   ],
//                                   //             );
//                                   //       },
//                                   // ),
//                               AudioWaveformWidget(
//                                 audioPath: controller.recordedAudioPath,
//                                 duration: _duration,
//                                 position: _position,
//                                 onPositionChanged: (newPosition) {
//                                   audioPlayer.seek(newPosition);
//                                 },
//                               ),
//                                   SizedBox(height: 20),
//                                   Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                               IconButton(
//                                                     icon: Icon(Icons.play_arrow),
//                                                     onPressed: () async {
//                                                           await audioPlayer.setFilePath(controller.recordedAudioPath);
//                                                           audioPlayer.play();
//                                                     },
//                                               ),
//                                               IconButton(
//                                                     icon: Icon(Icons.pause),
//                                                     onPressed: () {
//                                                           audioPlayer.pause();
//                                                     },
//                                               ),
//                                               IconButton(
//                                                     icon: Icon(Icons.stop),
//                                                     onPressed: () {
//                                                          audioPlayer.stop();
//                                                     },
//                                               ),
//                                         ],
//                                   ),
//                             ],
//                       ),),
//           );
//         });
//   }
// }
