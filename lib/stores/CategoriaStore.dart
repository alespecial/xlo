import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/Categoria.dart';
import 'package:xlo_mobx/repositorios/CategoriaRepositorio.dart';

part 'CategoriaStore.g.dart';

class CategoriaStore = _CategoriaStore with _$CategoriaStore;

abstract class _CategoriaStore with Store {

  _CategoriaStore(){
    _carregarCategorias();
  }

  ObservableList<Categoria> listaCategoria = ObservableList<Categoria>();

  // listaTodasCategorias serve somente para os filtros
  @computed
  List<Categoria> get listaTodasCategorias => List.from(listaCategoria)
      ..insert(0, Categoria(idCategoria: "*", descricao: "Todas"));

  @action
  void setCategorias(List<Categoria> categorias){
    listaCategoria.clear();
    listaCategoria.addAll(categorias);
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  Future<void> _carregarCategorias() async {

   try{
     final categorias = await CategoriaRepositorio().getList();
     setCategorias(categorias);
   }catch (e){
     setError(e);
   }

  }

}