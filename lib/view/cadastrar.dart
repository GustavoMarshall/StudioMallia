import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:studiomallia/database/dao/clientes_dao.dart';

import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/clientes.dart';
import 'package:studiomallia/view/menuprincipal.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Cadastrar extends StatefulWidget {
  @override
  _ClientesFormState createState() => _ClientesFormState();
}

class _ClientesFormState extends State<Cadastrar> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.w500);
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _datanascimentoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController __estadoController = TextEditingController();
  String birth_label = 'Data de Nascimento';
  var teleFormated = new MaskedTextController(mask: '(00)00000-0000');
  var cpfFormated = new MaskedTextController(mask: '000.000.000-00');
  final ClientesDao _dao = ClientesDao();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Cliente'),
          backgroundColor: Colors.pink,
        ),

        body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Dados Pessoais",
                    style: style,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextFormField(
                    controller: _nomeController,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Nome",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),

                  ),

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: cpfFormated,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "CPF",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    child:  Row (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 16),
                          child: Text(birth_label, style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600]
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 16),
                          child: Icon(Icons.calendar_today, color: Colors.grey[600],),
                        )
                      ],
                    ),
                    onPressed: () async {
                      final dtPick = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2100));
                      print(dtPick);
                      String data_formatada = formatDate(dtPick, [dd, '/', mm, '/', yyyy]);
                      print(data_formatada);

                      setState(() {
                        birth_label = data_formatada;
                      });

                      _datanascimentoController.text = data_formatada;


                    },
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: teleFormated,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Telefone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    "Endereço",
                    style: style,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: _ruaController,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Rua/Av.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: _cidadeController,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Cidade",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    controller: __estadoController,
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Estado",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular((80))),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),

        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: ( ) {

            final String name = _nomeController.text;
            final String cpf = cpfFormated.text;
            final String datanascimento = _datanascimentoController.text;
            final String telefone = teleFormated.text;
            final String rua = _ruaController.text;
            final String cidade = _cidadeController.text;
            final String estado = __estadoController.text;

            final Clientes newClientes = Clientes(
                0,
                name,
                cpf,
                datanascimento,
                telefone,
                rua,
                cidade,
                estado);
            _dao.save(newClientes).then((id) => Navigator.pop(context));


        },
    child: Icon(Icons.save),

    ),

    );
  }
}


