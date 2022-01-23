import 'package:libwinmedia/libwinmedia.dart';

class AudioProvider {
  static int _id = 0;
  static void playOneTick(String path) {
    var player = Player(id: _id);
    _id++;
    player.open([Media(uri: "file://$path")]);
    player.play();
    player.streams.isCompleted.listen((completed) {
      if (completed) {
        player.dispose();
      }
    });
  }
}
