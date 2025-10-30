import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


// ────────────────────────────────────────────────────────────────
//  EXPANDED VLC-STYLE TILE (progress + seek)
// ────────────────────────────────────────────────────────────────
class AudioTileExpanded extends StatefulWidget {
  final String title;
  final String assetPath;
  final String leading;

  const AudioTileExpanded({Key? key, required this.title, required this.assetPath, required this.leading})
      : super(key: key);

  @override
  State<AudioTileExpanded> createState() => _AudioTileExpandedState();
}

class _AudioTileExpandedState extends State<AudioTileExpanded> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setAsset(widget.assetPath);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggle() async => _player.playing ? _player.pause() : _player.play();

  String _fmt(Duration? d) => d == null
      ? '0:00'
      : '${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
      '${d.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    const vlcOrange = Colors.green;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: _toggle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Header (icon + title + button) -----------------------
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.leading,style: TextStyle(color: vlcOrange),),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StreamBuilder<PlayerState>(
                    stream: _player.playerStateStream,
                    builder: (_, snap) {
                      final playing = snap.data?.playing ?? false;
                      return IconButton(
                        iconSize: 36,
                        splashRadius: 22,
                        color: vlcOrange,
                        icon: Icon(playing ? Icons.pause_circle : Icons.play_circle),
                        onPressed: _toggle,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // ---- Progress + time ---------------------------------------
              StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (_, posSnap) {
                  final pos = posSnap.data ?? Duration.zero;
                  return StreamBuilder<Duration?>(
                    stream: _player.durationStream,
                    builder: (_, durSnap) {
                      final dur = durSnap.data ?? Duration.zero;
                      final progress = dur.inMilliseconds == 0
                          ? 0.0
                          : pos.inMilliseconds / dur.inMilliseconds;

                      return Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: vlcOrange,
                              inactiveTrackColor: Colors.grey[700],
                              thumbColor: vlcOrange,
                              overlayColor: vlcOrange.withOpacity(0.2),
                              thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 7),
                              overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 14),
                            ),
                            child: Slider(
                              value: progress.clamp(0.0, 1.0),
                              onChanged: (v) {
                                final seekPos = Duration(
                                    milliseconds: (v * dur.inMilliseconds).round());
                                _player.seek(seekPos);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_fmt(pos),
                                    style: const TextStyle(
                                         fontSize: 12)),
                                Text(_fmt(dur),
                                    style: const TextStyle(
                                         fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}