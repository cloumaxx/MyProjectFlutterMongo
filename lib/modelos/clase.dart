import 'package:mongo_dart/mongo_dart.dart';

class Clase{
  final Object id;
  final String nombre;
  final String profesor;
  final int horaIni;
  final int minIni;
  final int horaFin;
  final int minFin;
  final int dia;
  final String salon;

  const Clase({ required this.id, required this.nombre, required this.profesor, required this.horaIni, required this.minIni,
              required this.horaFin, required this.minFin, required this.dia, required this.salon});


  Map<String,dynamic> toMap(){
    return{
      '_id':id,
      'nombre':nombre,
      'profesor':profesor,
      'horaIni':horaIni,
      'minIni':minIni,
      'horaFin':horaFin,
      'minFin':minFin,
      'dia':dia,
      'salon':salon
    };
  }

  Clase.fromMap(Map<String,dynamic> map)
    : nombre = map['nombre'],
  id = map['_id'],
  profesor = map['profesor'],
  horaIni= map['horaIni'],
  minIni= map['minIni'],
  horaFin= map['horaFin'],
  minFin= map['minFin'],
  dia= map['dia'],
  salon= map['salon'];














}
