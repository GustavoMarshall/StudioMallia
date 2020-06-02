import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/database/app_database.dart';
import 'package:studiomallia/database/dao/agendamentos_dao.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/agendamentos.dart';
import 'package:studiomallia/view/agendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consultar extends StatefulWidget {
  @override
  _ConsultarListState createState() => _ConsultarListState();
}

class _ConsultarListState extends State<Consultar> {
  final AgendamentosDao _dao = AgendamentosDao();

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
                  final List<Agendamentos> agendamento = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Agendamentos agendamentos = agendamento[index];
                      return _AgendaItem(agendamentos: agendamentos);
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
    // TODO: implement build
    return ExpansionTile(

      title: Text(
        widget.agendamentos.clienteAg,
        style: GoogleFonts.ptSans(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Data agendada: ${widget.agendamentos.dataAg} \n'
          'Horario: ${widget.agendamentos.horaAg} \n'
          'Serviço: ${widget.agendamentos.servicoAg} \n'),

    );
  }
}












