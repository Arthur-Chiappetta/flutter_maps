import 'package:flutter/material.dart';
import 'package:flutter_maps/pages/postos_pages.dart';
import 'package:flutter_maps/repositories/postos_repository.dart';
import 'package:flutter_maps/widgets/posto_detalhes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostosController extends ChangeNotifier{
  double lat = 0.0;
  double long = 0.0;
  String erro = "";
  Set<Marker> markers = new Set<Marker>();
  GoogleMapController _mapController;

  get mapsController => _mapController;

  onMapCreated(GoogleMapController gmc) async {
    _mapController = gmc;
    getPosicao();
    loadPostos();
  }

  loadPostos() {
    final postos = PostosRepository().postos;
    postos.forEach((posto) {
      markers.add(
          Marker(
              markerId: MarkerId(posto.nome),
              position: LatLng(posto.latitude, posto.longitude),
              onTap: () => {
                showModalBottomSheet(
                    context: appKey.currentState.context,
                    builder: (context) => PostoDetalhes(posto: posto)
                )
              },
              ),
      );
    });
  }

  getPosicao() async{
    try{
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch(e){
      erro = e.toString();
    }
    notifyListeners();
  }
  Future<Position> _posicaoAtual() async{
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if(!ativado){
      return Future.error("Por favor, habilite a localização no smartphone");
    }

    permissao = await Geolocator.checkPermission();
    if(permissao == LocationPermission.denied){
      permissao = await Geolocator.requestPermission();
      if(permissao == LocationPermission.denied){
        return Future.error("Você precisa atualizar o acesso a localização");
      }
    }

    if(permissao == LocationPermission.deniedForever){
      return Future.error("Você precisa autorizar o acesso à localização");
    }

    return await Geolocator.getCurrentPosition();
  }


}