import 'package:flutter/material.dart';
import 'package:flutter_maps/models/posto.dart';

class PostosRepository extends ChangeNotifier{
  final List<Posto> postos = [
    Posto(
      nome: "Posto Ipiranga - Pão de Açúcar",
      endereco: "Av. Presidente Wilson, 136/176 - SP, São Vicente - SP, 11320-000",
      foto: "https://noticiasconcursos.com.br/wp-content/uploads/2019/05/postos-ipiranga.jpg",
      latitude: -23.9705888,
      longitude: -46.3711959
    ),
    Posto(
      nome: "Academia Smart Fit - Presidente Wilson",
      endereco: "Av. Presidente Wilson, 1333 - Itararé, São Vicente - SP, 11320-001",
      foto: "https://lh5.googleusercontent.com/p/AF1QipMe0IaSbztuGeA3-QMSmuJ5PUHm6ylmOjdGRLGi=w600-h321-p-k-no",
      latitude: -23.9660117,
      longitude: -46.3805085
    ),
    Posto(
      nome: "Estádio Urbano Caldeira - Vila Belmiro",
      endereco: "Rua Princesa Isabel, S/N, Vila Belmiro, Santos - SP, 11075-501",
      foto: "https://lh5.googleusercontent.com/p/AF1QipMJD9Ev3igIXCVfeKmsZq8m3jn5R9FKvIIPLaI-=w426-h240-k-no",
      latitude: -23.9510745,
      longitude: -46.3410436
    )
  ];
}