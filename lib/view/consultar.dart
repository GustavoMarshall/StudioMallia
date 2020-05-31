import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/database/dao/agendamento_dao.dart';
import 'package:studiomallia/models/agendamento.dart';

class Consultar extends StatefulWidget {
  @override
  _ConsultarState createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {

  TextEditingController _dataConsultar = TextEditingController();

  String data_label = 'Selecione a data';

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar"),
        backgroundColor: Colors.pink,
      ),

      body: Center(

        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(

              children: <Widget>[

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
                            child: Text(data_label, style: TextStyle(
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
                        final dtPick = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1980), lastDate: DateTime(2100));
                        print(dtPick);
                        String data_formatada = formatDate(dtPick, [dd, '/', mm, '/', yyyy]);
                        print(data_formatada);

                        setState(() {
                          data_label = data_formatada;
                        });

                        _dataConsultar.text = data_formatada;
                      },
                    )
                ),


                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 8, right: 180, left: 180),
                  child: ButtonTheme(
                    minWidth: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "Buscar",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((40))
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    "Clientes agendado",
                    style: style,
                  ),
                ),


              ]
          ),
        ),

      ),


    );
  }
}

  class ConsultarAg extends StatefulWidget{
    @override
    _ConsultarAgState createState() => _ConsultarAgState();
  }

  class _ConsultarAgState extends State<ConsultarAg>{
    final AgendamentoDao _dao = AgendamentoDao();

  @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<List<Agendamento>>(
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
                  final List<Agendamento> agendamento = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Agendamento agendamentos = agendamento[index];
                      return _AgendamentoItem(agendamentos: agendamentos);
                    },
                    itemCount: agendamento.length,
                  );
                  break;
              }

              return Container();
            },
          )
      )
    );

  }
  }

class _AgendamentoItem extends StatefulWidget {
  final Agendamento agendamentos;

  const _AgendamentoItem({Key key, this.agendamentos}) : super(key: key);

  @override
  _AgendamentoItemState createState() => _AgendamentoItemState();
}

class _AgendamentoItemState extends State<_AgendamentoItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(

      title: Text(
        widget.agendamentos.clienteAg,
        style: GoogleFonts.ptSans(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Data: ${widget.agendamentos.dataAg} \n''Data: ${widget.agendamentos.horaAg} \n' 'Data: ${widget.agendamentos.servicoAg}'),

    );
  }
}

  















