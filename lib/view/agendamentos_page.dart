import 'package:date_format/date_format.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/database/app_database.dart';
import 'package:studiomallia/database/dao/agendamentos_dao.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/agendamentos.dart';
import 'package:studiomallia/view/agendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studiomallia/view/menuprincipal.dart';
import 'package:studiomallia/view/ordenar_page.dart';

class Consultar extends StatefulWidget {
  @override
  _ConsultarListState createState() => _ConsultarListState();
}

class _ConsultarListState extends State<Consultar> {
  final AgendamentosDao _dao = AgendamentosDao();
  String agendamento_label = 'Data de Agendamento';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamentos'),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
          child: FutureBuilder<List<Agendamentos>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Agendamentos> agendamento = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  Agendamentos agendamentos = agendamento[index];
                  return index == 0
                      ? Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Ordenar por data', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
                                IconButton(
                                  icon: Icon(Icons.filter_list),
                                  color: Colors.pink,
                                  onPressed: () {
                                    agendamento.sort(
                                        (a, b) => a.dataAg.compareTo(b.dataAg));
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdernarPage(agendamentos: agendamento,)));

                                    print(agendamento.toString());
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
                itemCount: agendamento.length,
              );
              break;
          }
          return Container();
        },
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
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Consultar()));
      },
    );
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
        _dao.delete(id).then((id) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => menuprincipal())));

        print(newAgendamento);
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Deseja finalizar este atendimento ?"),
      actions: [
        cancelaButton,
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
