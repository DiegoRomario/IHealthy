import 'package:flutter/material.dart';
import 'package:ihealthy/components/input-field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'components/result.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        accentColor: Colors.red[300],
        scaffoldBackgroundColor: Colors.blue[50],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo[800],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: new Icon(MdiIcons.calculator)),
                Tab(icon: Icon(Icons.hourglass_empty)),
                Tab(icon: Icon(Icons.hourglass_empty)),
              ],
            ),
            title: Text('🏋️‍♀  Taxa de metabolismo basal (TMB)'),
          ),
          body: TabBarView(
            children: [
              TMBForm(),
              new Container(
                color: Colors.purple[200],
                child: new Center(
                  child: new Text(
                    "Work in progress",
                    style: TextStyle(),
                  ),
                ),
              ),
              new Container(
                color: Colors.teal[200],
                child: new Center(
                  child: new Text(
                    "Work in progress",
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TMBForm extends StatefulWidget {
  String result = "";
  @override
  _TMBFormState createState() => _TMBFormState();
}

class _TMBFormState extends State<TMBForm> {
  final TextEditingController _pesoController = new TextEditingController();

  final TextEditingController _alturaController = new TextEditingController();

  final TextEditingController _idadeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputField(
              plabel: "Peso",
              phint: "00 (kg)",
              picon: MdiIcons.weightKilogram,
              pcontroller: _pesoController,
              ptype: TextInputType.number,
            ),
            InputField(
              plabel: "Altura",
              phint: "000 (cm)",
              picon: MdiIcons.humanMaleHeight,
              pcontroller: _alturaController,
              ptype: TextInputType.number,
            ),
            InputField(
              plabel: "Idade",
              phint: "00",
              picon: MdiIcons.calendarQuestion,
              pcontroller: _idadeController,
              ptype: TextInputType.number,
            ),
            widget.result != null
                ? Result(
                    result: widget.result,
                  )
                : Text("Resultado"),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  calcular();
                },
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calcular() {
    final double altura = double.tryParse(_alturaController.text);
    final double peso = double.tryParse(_pesoController.text);
    final int idade = int.tryParse(_idadeController.text);
    final double resultado = 66 + (13.8 * peso) + (5 * altura) - (6.8 * idade);
    setState(() {
      widget.result = "TMB: $resultado";
    });

    print(widget.result);
  }
}
