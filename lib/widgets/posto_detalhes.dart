import 'package:flutter/material.dart';
import 'package:flutter_maps/models/posto.dart';

class PostoDetalhes extends StatelessWidget{
  Posto posto;
  PostoDetalhes({Key key, this.posto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Image.network(posto.foto,
          height: 250,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover),
          Padding(
              padding: EdgeInsets.only(top: 24.0, left: 24.0),
            child: Text(
              posto.nome,
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 60.0, left: 24.0),
            child: Text(
              posto.endereco
            ),
          )
        ],
      ),
    );
  }

}