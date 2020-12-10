import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/Endereco.dart';
import 'package:xlo_mobx/repositorios/CepRepositorio.dart';

part 'CepStore.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {

  _CepStore() {
    autorun( (_) {
      if(clearCep.length != 8){
        _reset();

      } else{
        _pesquisarCep();
      }
    });
  }

  @observable
  String cep = "";

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp("[^0-9]"), "");

  @observable
  Endereco endereco;

  @observable
  String error;

  @observable
  bool carregando = false;

  @action
  Future<void> _pesquisarCep() async{
    carregando = true;
    try{
      endereco = await CepRepositorio().getAddressFromApi(clearCep);
      error = null;
    }catch (e) {
      error = e;
      endereco = null;
    }
    carregando = false;
  }

  @action
  void _reset(){
    endereco = null;
    error = null;
  }

}