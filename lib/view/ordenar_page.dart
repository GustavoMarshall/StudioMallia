import 'package:date_format/date_format.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/database/app_database.dart';
import 'package:studiomallia/database/dao/agendamentos_dao.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/agendamentos.dart';
import 'package:studiomallia/view/agendamentos_page.dart';
import 'package:studiomallia/view/agendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/agendamentos.dart';
import 'menuprincipal.dart';

class OrdernarPage extends StatefulWidget {
  final List<Agendamentos> agendamentos;

  const OrdernarPage({Key key, this.agendamentos}) : super(key: key);

  @override
  _OrdenarPageState createState() => _OrdenarPageState();
}

class _OrdenarPageState extends State<OrdernarPage> {
  final AgendamentosDao _dao = AgendamentosDao();
  String agendamento_label = 'Data de Agendamento';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamentos'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => menuprincipal())),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          Agendamentos agendamentos = this.widget.agendamentos[index];
          return index == 0
              ? Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Ordenar por data',
                          style: TextStyle(
                              color: Colors.pink, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.pink,
                          onPressed: () {
                            this
                                .widget
                                .agendamentos
                                .sort((a, b) => a.dataAg.compareTo(b.dataAg));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrdernarPage(
                                          agendamentos:
                                              this.widget.agendamentos,
                                        )));

                            print(this.widget.agendamentos.toString());
                            setState(() {
                              return Agendamentos;
                            });
                          },
                        )
                      ],
                    ),
                    _AgendaItem(agendamentos: agendamentos)
                  ],
                )
              : _AgendaItem(agendamentos: agendamentos);
        },
        itemCount: this.widget.agendamentos.length,
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Agendar()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _AgendaItem extends StatefulWidget {
  final Agendamentos agendamentos;

  const _AgendaItem({Key key, this.agendamentos}) : super(key: key);

  @override
  __AgendaItemState createState() => __AgendaItemState();
}

class __AgendaItemState extends State<_AgendaItem> {
  @override
  Widget build(BuildContext context) {
    final AgendamentosDao _dao = AgendamentosDao();

    // TODO: implement build
    return ExpansionTile(
        title: Text(
          widget.agendamentos.clienteAg,
          style: GoogleFonts.ptSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Data agendada: ${widget.agendamentos.dataAg} \n'
            'Horario: ${widget.agendamentos.horaAg} \n'
            'Serviço: ${widget.agendamentos.servicoAg} \n'),
        children: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {
                 showAlertDialog2(context);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.pink,
                ),
              ),
              Text('Finalizar atendimento')
            ],
          ),
        ]);
  }
  final AgendamentosDao _dao = AgendamentosDao();
  showAlertDialog2(BuildContext context) {

    Widget continuaButton = FlatButton(
      child: Text("Finalizar"),
      onPressed:  () {
        final int id = widget.agendamentos.id;
        final String cliente = widget.agendamentos.clienteAg;
        final String data = widget.agendamentos.dataAg;
        final String horario = widget.agendamentos.horaAg;
        final String servico = widget.agendamentos.servicoAg;

        final Agendamentos newAgendamento =
        Agendamentos(id, cliente, data, horario, servico);
        _dao.delete(id).then((id) => Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (BuildContext context) => menuprincipal())));

        print(newAgendamento);

      },

    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Atenção!"),
      content: Text("Deseja finalizar este atendimento ?"),
      actions: [
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
