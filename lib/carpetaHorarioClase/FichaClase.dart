import 'package:flutter/material.dart';
import 'package:ejemplo/modelos/clase.dart';

class FichaClase extends StatelessWidget{
  FichaClase({required this.clase, required this.onTapDelete, required this.onTapEdit});
  final Clase clase;
  final VoidCallback onTapEdit,onTapDelete;

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Text('${clase.nombre}',style: Theme.of(context).textTheme.headline6),
        title: Text(clase.nombre),
        trailing: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Icon(Icons.edit),
              onTap: onTapEdit
            ),
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: onTapDelete,
            )
          ],
        ),
      ),
    );
  }

}