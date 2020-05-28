import 'package:flutter/material.dart';
import 'package:studiomallia/database/dao/clientes_dao.dart';


import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/clientes.dart';
import 'package:studiomallia/view/menuprincipal.dart';


class Cadastrar extends StatefulWidget {
  @override
  _ClientesFormState createState() => _ClientesFormState();

}

  class _ClientesFormState extends State<Cadastrar> {


    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);
    TextEditingController _nomeController = TextEditingController();
    TextEditingController _cpfController = TextEditingController();
    TextEditingController _datanascimentoController = TextEditingController();
    TextEditingController _telefoneController = TextEditingController();
    TextEditingController _ruaController = TextEditingController();
    TextEditingController _cidadeController = TextEditingController();
    TextEditingController __estadoController = TextEditingController();

    final ClientesDao _dao = ClientesDao();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Cadastrar Cliente'),
            backgroundColor: Colors.pink,
          ),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      controller: _cpfController,
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
                    child: TextField(
                      controller: _datanascimentoController,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      style: style,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Data de Nascimento",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular((80))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: TextField(
                      controller: _telefoneController,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                        width: double.maxFinite,
                        child: RaisedButton(
                          color: Color.fromRGBO(222, 72, 111, 1),
                          child: Text('Create'),
                          onPressed: () {
                            final String name = _nomeController.text;
                            final String cpf = _cpfController.text;
                            final String datanascimento = _datanascimentoController.text;
                            final String telefone = _telefoneController.text;
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


                        )


                    ),
                  )


                ],
              ),
            ),
          ));
    }
  }

//  void atendeAlerta(BuildContext context) {
//    var alertDialog = AlertDialog(
//      title: Text("Olá!"),
//      content: Text("Cliente ${_nomeController.text} cadastrada com sucesso."),
//    );
//    showDialog(
//        context: context, builder: (BuildContext context) => alertDialog);
//  }

