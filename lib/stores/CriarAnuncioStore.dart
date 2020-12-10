import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/Categoria.dart';

part 'CriarAnuncioStore.g.dart';

class CriarAnuncioStore = _CriarAnuncioStore with _$CriarAnuncioStore;

abstract class _CriarAnuncioStore with Store {

  ObservableList imagens = ObservableList();

  @observable
  Categoria categoria;

  @action
  void setCategoria(Categoria value) => categoria = value;

}