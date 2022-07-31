// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Divide Conta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  double total = 0;
  double perGarcom = 0;
  double pessoas = 0;
  String mensagem = "";
  double msgGeral = 0;
  double msgGarcom = 0;
  double msgPessoas = 0;
  double calcPerc = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tfTotal = TextEditingController();
  final _tfGarcom = TextEditingController();
  final _tfPessoas = TextEditingController();

  void calcularCusto() {
    setState(() {
      widget.total = double.parse(_tfTotal.text);
      widget.pessoas = double.parse(_tfPessoas.text);
      widget.perGarcom = double.parse(_tfGarcom.text);

      widget.calcPerc = (widget.perGarcom / 100) * widget.total;
      widget.msgGeral = widget.total + widget.calcPerc;
      widget.msgPessoas = widget.msgGeral / widget.pessoas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
                "Para fazer o cálculo, complete os dados e clique no botão calcular."),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              children: <Widget>[
                TextField(
                    controller: _tfTotal,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "informe o valor total da conta.",
                      labelText: "Valor Total",
                    )),
                TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _tfPessoas,
                    decoration: InputDecoration(
                      hintText: "informe a quantidade de pessoas",
                      labelText: "Pessoas",
                    )),
                TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _tfGarcom,
                    decoration: InputDecoration(
                      hintText: "informe a porcentagem para o garçom.",
                      labelText: "% do garçom",
                    )),
                Text(""),
                Text(
                  "Parte do garçom: R\$ " + widget.calcPerc.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text("Valor total a pagar: R\$ " + widget.msgGeral.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                    "Total para cada pessoa: R\$ " +
                        widget.msgPessoas.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(""),
                RaisedButton(
                  color: Color.fromARGB(255, 51, 117, 230),
                  onPressed: calcularCusto,
                  child: Text(
                    "CALCULAR",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
