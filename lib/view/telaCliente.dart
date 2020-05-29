import 'package:studiomallia/database/app_database.dart';
import 'package:studiomallia/database/dao/clientes_dao.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/models/clientes.dart';
import 'package:studiomallia/view/cadastrar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteListState createState() => _TelaClienteListState();
}

class _TelaClienteListState extends State<TelaCliente> {

  final ClientesDao _dao = ClientesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: SafeArea(
          child: FutureBuilder<List<Clientes>>(
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
                  final List<Clientes> cliente = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Clientes clientes = cliente[index];
                      return _ClientesItem(clientes: clientes);
                    },
                    itemCount: cliente.length,
                  );
                  break;
              }

              return Container();
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Cadastrar()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ClientesItem extends StatefulWidget {
  final Clientes clientes;

  const _ClientesItem({Key key, this.clientes}) : super(key: key);

  @override
  __ClientesItemState createState() => __ClientesItemState();
}

class __ClientesItemState extends State<_ClientesItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          widget.clientes.nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          'CPF:${widget.clientes.cpf} | ''Data de Nascimento:${widget.clientes.datanascimento} | ''Telefone:${widget.clientes.telefone} | \n''Rua/Av:${widget.clientes.rua} | ''Cidade:${widget.clientes.cidade} | ''Estado:${widget.clientes.estado} | ',
          style: TextStyle(fontSize: 15),
        ),
//       subtitle: Text(
//     '${widget.clientes.datanascimento}',
//        style: TextStyle(fontSize: 15),
//        ),
//        subtitle: Text(
//         '${widget.clientes.telefone}',
//         style: TextStyle(fontSize: 15),
//       ),
//       subtitle: Text(
//          '${widget.clientes.rua}',
//         style: TextStyle(fontSize: 15),
//        ),
//        subtitle: Text(
//          '${widget.clientes.cidade}',
//         style: TextStyle(fontSize: 15),
//       ),
//        subtitle: Text(
//         '${widget.clientes.estado}',
//         style: TextStyle(fontSize: 15),
//        ),
      ),
    );
  }
}
