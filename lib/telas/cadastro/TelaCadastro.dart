import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/CadastroStore.dart';
import 'package:xlo_mobx/telas/cadastro/componentes/TituloCampo.dart';
import 'package:xlo_mobx/telas/login/TelaLogin.dart';
import 'package:xlo_mobx/widgets/Botao.dart';
import 'package:xlo_mobx/widgets/BottomText.dart';
import 'package:xlo_mobx/widgets/ErrorBox.dart';

class TelaCadastro extends StatelessWidget {

  final CadastroStore cadastroStore = CadastroStore();

  String nomeDigitado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 32, top: 16),
        child: Container(
          alignment: Alignment.center,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(builder: (_){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ErrorBox(
                          menssagem: cadastroStore.error
                      ),
                    );
                  }),
                  TituloCampo(
                    titulo: "Apelido",
                    subTitulo: "Como aparecerá em seus anúncios.",
                  ),
                  //=========== CAMPO DE TEXTO (NOME) ===========
                  Observer(builder: (_) {
                        return TextField(
                          enabled: !cadastroStore.carregando,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Exemplo: Alex A.",
                              isDense: true,
                              errorText: cadastroStore.nomeError
                          ),
                          onChanged: cadastroStore.setName,
                          //onChanged: (nome){nomeDigitado = nome;},
                        );
                      }
                  ),
                  //=========== ESPAÇAMENTO ===========
                  const SizedBox(height: 16,),
                  //
                  TituloCampo(
                    titulo: "E-mail",
                    subTitulo: "Enviaremos um e-mail de confirmação.",
                  ),
                  //=========== CAMPO DE TEXTO (EMAIL) ===========
                  Observer(builder: (_){
                    return TextField(
                      enabled: !cadastroStore.carregando,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Exemplo: alex@gmail.com",
                          isDense: true,
                        errorText: cadastroStore.emailError
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: cadastroStore.setEmail,
                    );
                    },
                  ),
                  //=========== ESPAÇAMENTO ===========
                  const SizedBox(height: 16,),
                  TituloCampo(
                    titulo: "Celular",
                    subTitulo: "Proteja sua conta",
                  ),
                  //=========== CAMPO DE TEXTO (telefone) ===========
                  Observer(builder: (_){
                    return TextField(
                      enabled: !cadastroStore.carregando,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "(31) 98888-8888",
                          isDense: true,
                          errorText: cadastroStore.telefoneError
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      onChanged: cadastroStore.setTelefone,
                    );
                  }),
                  //=========== ESPAÇAMENTO ===========
                  const SizedBox(height: 16,),
                  TituloCampo(
                    titulo: "Senha",
                    subTitulo: "Use letras, números e caracteres especiais.",
                  ),
                  //========== CAMPO DE TEXTO (SENHA 1)==========
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !cadastroStore.carregando,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: cadastroStore.senha1Error
                      ),
                      obscureText: true,
                      onChanged: cadastroStore.setSenha1,
                    );
                  }),
                  //=========== ESPAÇAMENTO ===========
                  const SizedBox(height: 16,),
                  TituloCampo(
                    titulo: "Confirmar Senha",
                    subTitulo: "Repita a senha",
                  ),
                  //========== CAMPO DE TEXTO (SENHA 2)==========
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !cadastroStore.carregando,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: cadastroStore.senha2Error
                      ),
                      obscureText: true,
                      onChanged: cadastroStore.setSenha2,
                    );
                  }),
                  Observer(builder: (_){
                    return Botao(
                      carregando: cadastroStore.carregando,
                      text: "CADASTRAR",
                      onPressed: cadastroStore.btnCadastrarPressionado
                      //cadastroStore.formularioEValido
                         // ? cadastroStore.cadastrar
                          //: null
                        // cadastroStore.setName(nomeDigitado);
                        // caso eu queira validar quando clica no botão
                    );
                  }),
                  Divider(color: Colors.grey,),
                  BottomText(
                    text1: "Já tem uma conta? ",
                    text2: "Entrar",
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
