// import 'package:flutter/material.dart';
// import 'package:audio_waveforms/audio_waveforms.dart';
//
// class AudioWaveformWidget extends StatelessWidget {
//   final String audioPath;
//   final Duration duration;
//   final Duration position;
//   final ValueChanged<Duration> onPositionChanged;
//
//   const AudioWaveformWidget({
//     required this.audioPath,
//     required this.duration,
//     required this.position,
//     required this.onPositionChanged,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Waveform visualization
//         AudioWaveform(
//           audioFilePath: audioPath,
//           duration: duration,
//           position: position,
//           height: 100.0,
//           waveColor: Colors.blue,
//           activeWaveColor: Colors.red,
//           onSeek: (milliseconds) {
//             onPositionChanged(Duration(milliseconds: milliseconds));
//           },
//         ),
//         SizedBox(height: 10),
//         Text(
//           "${formatDuration(position)} / ${formatDuration(duration)}",
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     );
//   }