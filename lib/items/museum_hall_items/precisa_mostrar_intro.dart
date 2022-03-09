import 'package:art_gallery/characters/julia.dart';
import 'package:art_gallery/items/museum_hall_items/intro_museu.dart';
import 'package:art_gallery/main.dart';
import 'package:art_gallery/utils/interact.dart';
import 'package:bonfire/bonfire.dart';

bool haveShowedDialog = false;

class PrecisaMostrarIntro extends GameDecoration with Sensor {
  PrecisaMostrarIntro(Vector2 position)
      : super(position: position, size: Vector2(380, 12)) {
    setupSensorArea(
        areaSensor: [CollisionArea.rectangle(size: Vector2(380, 12))]);
  }

  @override
  Future<void> onLoad() async {
    bool alreadyInteracted = await returnInteractedItem(interactName);
    if (alreadyInteracted) {
      haveShowedDialog = true;
    }
    return super.onLoad();
  }

  @override
  void onContact(GameComponent component) {
    if (component is CharacterJulia &&
        !museumIntroShowed &&
        !haveShowedDialog) {
      haveShowedDialog = true;
      gameRef.player?.stopMoveAlongThePath();
      showMuseumIntroDialog(context);
    }
  }
}
