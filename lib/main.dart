import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/CategoriaRepositorio.dart';
import 'package:xlo_mobx/repositorios/CepRepositorio.dart';
import 'package:xlo_mobx/repositorios/IbgeRepositorio.dart';
import 'package:xlo_mobx/stores/CategoriaStore.dart';
import 'package:xlo_mobx/stores/GerenciadorUsuarioStore.dart';
import 'package:xlo_mobx/stores/PageStore.dart';
import 'package:xlo_mobx/telas/base/TelaBase.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  //obter página atual de qualquer lugar do app
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(GerenciadorUsuarioStore());
  GetIt.I.registerSingleton(CategoriaStore());
}

Future<void> initializeParse() async{

  await Parse().initialize(
      'xYoaABjPiul2tMrAOSah8hT4vg5rMUWihdee5WSs',
      'https://parseapi.back4app.com/',
      clientKey: 'yfD3ODshVf5w08Ms2SjahaAxoSqu8AlBPfYWBcdH',
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        cursorColor: Colors.orange
      ),
      home: TelaBase(),
      debugShowCheckedModeBanner: false,
    );
  }
}

