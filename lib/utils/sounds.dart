import 'package:flame_audio/flame_audio.dart';
import 'package:hive/hive.dart';

bool canPlayMusic = true;

class Sounds {
  static Future initialize() async {
    var box = await Hive.openBox('interactions');
    var canPlay = box.get('audio');
    if (canPlay == null || !canPlay) {
      canPlayMusic = false;
    }
    FlameAudio.bgm.initialize();
  }

  static stopBackgroundSound() {
    return FlameAudio.bgm.stop();
  }

  static playBackgroundSound() async {
    await FlameAudio.bgm.stop();
    FlameAudio.bgm.play('sound_bg.mp3', volume: .15);
  }

  static dispose() {
    FlameAudio.bgm.dispose();
  }

  static void handlePlayMusic(bool state) async {
    var box = await Hive.openBox('interactions');
    box.put('audio', state);
    canPlayMusic = state;
  }
}
