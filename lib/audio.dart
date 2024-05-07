import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotify_clone/data.dart';
import 'package:spotify_clone/utils/notify.dart';

class AudioPlayerPro extends StatefulWidget {
  const AudioPlayerPro(
      {super.key,
        required this.id,
      required this.audioURL,
      required this.image,
      required this.name
      });
  final int id;
  final String audioURL;
  final String image;
  final String name;
  @override
  _AudioPlayerProState createState() => _AudioPlayerProState();
}

class _AudioPlayerProState extends State<AudioPlayerPro> {
  Notify notify = Get.find();
  Duration _duration = new Duration();
  Duration _position = new Duration();

  static AudioPlayer advancedPlayer = AudioPlayer();
  final Data data = Data();
  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    advancedPlayer.onDurationChanged.listen((dur) {
      setState(() {
        _duration = dur;
      });
    });

    advancedPlayer.onPositionChanged.listen((pos) {
      setState(() {
        _position = pos;
      });
    });
  }
  void toggleFavorite(){
    setState(() {
     // notify.isHeartPressed.value = !notify.isHeartPressed.value;
    });
  }

  void seekToSecond(second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 45),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.brown,
                Colors.black87,
              ])),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      LineIcons.angleDown,
                      color: Colors.white,
                      size: 24,
                    ),
                    Column(
                      children: [
                        const Text(
                          'PLAYING FROM ALBUM',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 11,
                              color: Colors.white),
                        ),
                        Text(
                          widget.name,
                          style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Icon(
                      LineIcons.verticalEllipsis,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.image)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                wordSpacing: 0.2,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Classic',
                            style: TextStyle(
                                letterSpacing: 0.2,
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          toggleFavorite;
                          // notify.isHeartPressed.value =
                          //     notify.isHeartPressed.value ? false : true;
        
                        },
                        icon: Obx(
                          () => (notify.isHeartPressed.value)
                              ? const Icon(
                                  LineIcons.heartAlt,
                                  color: Colors.red,
                                  size: 24,
                                )
                              : const Icon(
                                  LineIcons.heart,
                                  color: Colors.white,
                                  size: 24,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.grey.shade600,
                            activeTickMarkColor: Colors.white,
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6)),
                        child: Slider(
                          value: (_position.inSeconds.toDouble() !=
                                  _duration.inSeconds.toDouble())
                              ? _position.inSeconds.toDouble()
                              : setChanged(),
                          onChanged: (value) {
                            setState(() {
                              seekToSecond(value.toInt());
                              value = value;
                            });
                          },
                          max: _duration.inSeconds.toDouble(),
                          min: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        LineIcons.random,
                        color: Colors.grey,
                        size: 30,
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 40,
                          )),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            notify.isIconPlay.value =
                                notify.isIconPlay.value ? false : true;
                            if (notify.isIconPlay.value) {
                              advancedPlayer.play(UrlSource(widget.audioURL));
                            } else {
                              advancedPlayer.pause();
                            }
        
                          },
                          iconSize: 70,
                          alignment: Alignment.center,
                          icon: Obx(
                            () => (notify.isIconPlay.value)
                                ? const Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,
                                    size: 50,
                                  )
                                : const Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.repeat,
                          color: Colors.grey.shade400,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.speaker_group_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      InkWell(
                          onTap: () {
                            Share.share("https://spotify/songid-32165104");
                          },
                          child: const Icon(
                            Icons.share_outlined,
                            color: Colors.grey,
                          )),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.line_weight_sharp,
                          color: Colors.grey.shade400,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
