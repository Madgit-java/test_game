import 'package:flame_audio/flame_audio.dart';

class Music {
  Music._privateConstructor();

  static final Music instance = Music._privateConstructor();

    void playMusic() {
      FlameAudio.bgm.play('background_music.mp3');
    }
  void stopMusic() {
    FlameAudio.bgm.stop();
  }

}