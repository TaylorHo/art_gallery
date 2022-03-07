import 'package:hive/hive.dart';

List interactNames = <String>[
  'interactSapinhoAmarelo',
  'interactSapinhoVerde',
  'interactBorboleta',
  'interactRecepcionista',
  'interactAreaDeCriancas',
  'interactBrinquedos',
  'interactMesinhaDePintura',
  'interactMaterialDePintura',
  'interactExplicacaoPlantinhas',
  'interactPlantinhas',
  'interactIntroMuseu',
  'interactPinturas1',
  'interactPinturas2',
  'interactSapinhos',
  'interactBiblioteca',
  'interactFlorzinhas1',
  'interactFlorzinhas2',
  'interactPrincipalObra',
  'interactMotivoEspecial',
  'interactPequenosDesenhos',
  'interactPegarSuquinho',
  'interactDobraduras'
];
List interactValues = <bool>[
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

int totalInteract = interactNames.length;
int totalInteracted =
    interactValues.where((element) => element).toList().length;

Future<void> getInteractedItems() async {
  var box = await Hive.openBox('interactions');

  interactNames.map(
    (item) => alterValue(
      item,
      box,
      interactNames.indexOf(item),
    ),
  );
}

void alterValue(item, box, index) {
  bool itemValue = box.get(item);
  if (itemValue) {
    interactValues[index] = true;
  }
}

void saveInteractedItem(item) {
  var box = Hive.box('interactions');
  box.put(item, true);
  interactValues[interactNames.indexOf(item)] = true;
}

void resetInteractedItems() {
  var box = Hive.box('interactions');

  interactNames.map((item) => resetInteractedItemByItem(item, box));
}

void resetInteractedItemByItem(item, box) {
  box.put(item, null);
  interactValues[interactNames.indexOf(item)] = false;
}
