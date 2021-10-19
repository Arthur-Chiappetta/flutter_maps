import 'package:flutter/material.dart';
import 'package:flutter_maps/controllers/postos_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


final appKey = GlobalKey();

class PostoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: ChangeNotifierProvider<PostosController>(
        create: (context) => PostosController(),
        child: Builder(builder: (context){
          final local = context.watch<PostosController>();

          return GoogleMap(
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 11.0,
            ),
          );
        }),
      ),
    );


  }

}