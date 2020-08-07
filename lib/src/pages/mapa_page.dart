import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bolc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/util/utils.dart' as utils;

class MapaPages extends StatelessWidget {

  final scanBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {

    scanBloc.obtenerScans();

    return Scaffold(
      body: StreamBuilder(
        stream: scanBloc.scansStream,
        builder: (context, AsyncSnapshot<List<ScanModel>> snapshot) {

          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }

          final scans = snapshot.data;

          if(scans.length == 0){
            return Center(
              child: Text('No hay información'),
            );
          }

          return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction) => scanBloc.borrarScan(scans[index].id),
                child: ListTile(
                  leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
                  title: Text(scans[index].valor),
                  subtitle: Text(scans[index].id.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
                  onTap: () => utils.abrirScan(context,scans[index]),
                ),);
              },
          );

        },

      )
    );
  }
}
