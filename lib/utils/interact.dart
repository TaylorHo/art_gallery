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
  'interactFlorzinhas',
  'interactPrincipalObra',
  'interactMotivoEspecial',
  'interactPequenosDesenhos',
  'interactPegarSuquinho',
  'interactDobraduras',
  'maquiagemArtistica'
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
int totalInteracted = 0;
bool loadedGame = false;

Future<void> getInteractedItems() async {
  var box = await Hive.openBox('interactions');

  var resultados = interactNames
      .map((item) => alterValue(item, box, interactNames.indexOf(item)))
      .toList();
  interactValues = resultados;
  totalInteracted = resultados.where((element) => element).toList().length;
  if (totalInteracted > 0) {
    loadedGame = true;
  }
}

bool alterValue(item, box, index) {
  var itemValue = box.get(item);
  if (itemValue == null || !itemValue) {
    return false;
  } else {
    return true;
  }
}

void saveInteractedItem(item) {
  var box = Hive.box('interactions');
  box.put(item, true);
  interactValues[interactNames.indexOf(item)] = true;
  totalInteracted = interactValues.where((element) => element).toList().length;
}

Future<bool> returnInteractedItem(item) async {
  return interactValues[interactNames.indexOf(item)];
}

void resetInteractedItems() {
  var box = Hive.box('interactions');

  var resultados = interactNames
      .map((item) => resetInteractedItemByItem(item, box))
      .toList();
  interactValues = resultados;
  totalInteracted = 0;
  loadedGame = false;
}

bool resetInteractedItemByItem(item, box) {
  box.put(item, null);
  return false;
}
