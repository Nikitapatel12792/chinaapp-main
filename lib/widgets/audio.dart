import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  String? url;
   HomePage({Key? key,this.url}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //setting the project url


  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration _duration = Duration();
  ValueNotifier<Duration> _position = ValueNotifier(Duration());
  PlayerState _audioPlayerState = PlayerState.stopped;
  void initPlayer() async {
    player.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _audioPlayerState = state;
      });
    });
    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    player.onPositionChanged.listen((Duration position) {
      _position.value = position;
    });

    await player.setSource(UrlSource(widget.url.toString()));
  }
  Future<void> _playPauseAudio() async {
    if (_audioPlayerState == PlayerState.playing) {
      await player.pause();
    } else {
      await player.play(UrlSource(widget.url.toString()));
    }

    }
  void _onSeek(double value) {
    Duration seekPosition = Duration(milliseconds: value.toInt());
    player.seek(seekPosition);
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
    player.dispose();
    _position.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider.adaptive(
              onChangeEnd: _onSeek,
              min: 0.0,
              value: value,
              max: _duration.inMilliseconds.toDouble(),
              onChanged: (value) {},
              activeColor: Colors.black,
              thumbColor: Colors.black,
            ),
            Text(
              '${_printDuration(_position.value)} / ${_printDuration(_duration)}',
              style: TextStyle(fontSize: 18),
            ),
            GestureDetector(
              onTap: _playPauseAudio,
              child: Icon(_audioPlayerState == PlayerState.playing? (Icons.pause) : (Icons.play_arrow) ),
            ),
          ],
        ),
      );

  }
}