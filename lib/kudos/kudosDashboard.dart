import 'package:flutter/material.dart';
import 'package:office_app/kudos/models/kudos.model.dart';

class KudosDetailsView extends StatelessWidget {
  final KudosModel kudo;

  KudosDetailsView({Key key, @required this.kudo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kudo details"),
        ),
        body: SizedBox(
          height: 400.0,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(this.kudo.creator,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(
                      "${kudo.createdAt.day}/${kudo.createdAt.month}/${kudo.createdAt.year}"),
                  leading: Icon(
                    Icons.announcement,
                    color: Colors.blue[500],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(kudo.reason,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  leading: Icon(
                    Icons.cloud,
                    color: Colors.blue[500],
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ));
  }
}

class KudosList extends StatefulWidget {
  KudosList({Key key, this.kudos}) : super(key: key);

  final List<KudosModel> kudos;

  @override
  _KudosView createState() => _KudosView();
}

class _KudosView extends State<KudosList> {
  List<KudosModel> kudos = <KudosModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.kudos.map((KudosModel kudo) {
          return ListTile(
            leading: Icon(Icons.done_outline, color: Colors.greenAccent),
            subtitle: Text("${kudo.creator}"),
            title: Text(
              "${kudo.reason} ",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: new Text(
                "${kudo.createdAt.day}/${kudo.createdAt.month}/${kudo.createdAt.year}"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KudosDetailsView(kudo: kudo)));
            },
          );
        }).toList(),
      ),
    );
  }
}

class Kudos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kudos'),
      ),
      body: Center(
        child: KudosList(kudos: <KudosModel>[
          KudosModel('dota', 'za fluttera1'),
          KudosModel('ola', 'za fluttera2'),
          KudosModel('radek', 'za fluttera3'),
          KudosModel('dota', 'za fluttera4'),
          KudosModel('dota', 'za fluttera5'),
          KudosModel('dota', 'za fluttera6'),
          KudosModel('dota', 'za fluttera7'),
          KudosModel('dota', 'za fluttera8'),
          KudosModel('dota', 'za fluttera9'),
          KudosModel('dota', 'za fluttera0'),
          KudosModel('dota', 'za fluttera1'),
          KudosModel('dota', 'za fluttera2'),
          KudosModel('dota', 'za fluttera3'),
          KudosModel('dota', 'za fluttera4'),
          KudosModel('dota', 'za fluttera5'),
        ]),
      ),
    );
  }
}
