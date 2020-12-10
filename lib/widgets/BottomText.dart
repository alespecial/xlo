import 'package:flutter/material.dart';
import 'package:xlo_mobx/telas/cadastro/TelaCadastro.dart';

class BottomText extends StatelessWidget {

  String text1;
  String text2;
  VoidCallback onTap;

  BottomText({@required this.text1, @required this.text2, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
             Text(
              "$text1",
              style: TextStyle(fontSize: 16),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                text2,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.purple,
                    fontSize: 16
                ),
              ),
            )
          ],
        ),
      );
  }
}
