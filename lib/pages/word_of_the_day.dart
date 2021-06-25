import 'package:flutter/material.dart';

class WordOfTheDayPage extends StatefulWidget {
  @override
  createState() {
    return _WordOfTheDayPage();
  }
}

class _WordOfTheDayPage extends State<WordOfTheDayPage> {
  @override
  Widget build(BuildContext context) {
    final _estiloTexto = new TextStyle(fontSize: 25);
    //String _m;
    return Scaffold(
        appBar: AppBar(
          title: Text('WORD OF THE DAY'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('\nMortgage\n', style: _estiloTexto),
              Text(
                  "Meaning: a legal agreement by which a bank or other creditor lends money at interest in exchange for taking title of the debtor's property, with the condition that the conveyance of title becomes void upon the payment of the debt",
                  style: _estiloTexto),
              Text('\n\nHipoteca\n ', style: _estiloTexto),
              Text(
                  'Significado: Acuerdo legal por el cual un banco u acreedor presta dinero a interés a cambio de tomar el título de la propiedad del deudor, con la condición de que la transmisión del título quede sin efecto al pagar la deuda. ',
                  style: _estiloTexto),
            ],
          ),
        ));
  }
}
