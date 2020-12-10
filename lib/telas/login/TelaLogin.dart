import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/LogarStore.dart';
import 'package:xlo_mobx/telas/cadastro/TelaCadastro.dart';
import 'package:xlo_mobx/widgets/Botao.dart';
import 'package:xlo_mobx/widgets/BottomText.dart';
import 'package:xlo_mobx/widgets/ErrorBox.dart';

class TelaLogin extends StatelessWidget {

  final LogarStore logarStore = LogarStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16) //borda card
            ),
            elevation: 8, //elevação do card
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //==========TEXTO ACESSAR COM EMAIL==========
                  Text(
                    "Acessar com E-mail:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900]
                    ),
                  ),
                  //========== MENSAGEM DE ERRO ==========
                  Observer(builder: (_){
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ErrorBox(
                        menssagem: logarStore.error,
                      ),
                    );
                  }),
                  //==========TEXTO INFORMATIVO EMAIL==========
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  //========== CAMPO DE TEXTO (EMAIL)==========
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !logarStore.carregando,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: logarStore.emailError
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: logarStore.setEmail,
                    );
                  }),
                  //========== ESPAÇAMENTO ==========
                  const SizedBox(height: 16,),
                  //========== ROW / TEXTO SENHA ==========
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senha",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        //========== TEXTO ESQUECEU SUA SENHA ==========
                        GestureDetector(
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple
                            ),
                          ),
                          onTap: (){

                          },
                        )
                      ],
                    ),
                  ),
                  //========== CAMPO DE TEXTO (SENHA)==========
                  Observer(builder: (_) {
                    return TextField(
                        enabled: !logarStore.carregando,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: logarStore.senhaError
                        ),
                        obscureText: true,
                        onChanged: logarStore.setSenha
                    );
                  }),
                  //========== ESPAÇAMENTO ==========
                  //const SizedBox(height: 16,),
                  //========== BOTÃO ENTRAR ==========
                  Observer(builder: (_) {
                    return Botao(
                      carregando: logarStore.carregando,
                      text: "ENTRAR",
                      onPressed: logarStore.btnLogarPressionado,
                    );
                  }),
                  //========== DIVISOR ==========
                  Divider(color: Colors.grey,),
                  //========== PARTE DE CADASTRO ==========
                  BottomText(
                    text1: "Não tem uma conta? ",
                    text2: "Cadastre-se",
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TelaCadastro())
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
