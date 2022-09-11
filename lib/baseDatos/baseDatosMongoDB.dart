import 'package:mongo_dart/mongo_dart.dart';
import 'package:ejemplo/modelos/clase.dart';
import 'package:ejemplo/utilidades/constantes.dart';

class MongoDB{
  static var bd,coleccionClases;

  static conectar() async{
    bd = await Db.create(CONEXION);
    await bd.open();
    coleccionClases = bd.collection(COLECCION);
  }

  // Traera todos los elementos de la base de datos de las clases
  static Future<List<Map<String, dynamic>>> getClases()async{
    try{
       final clases = await coleccionClases.find().toList();
       return clases;
    }catch (e){
      print(e);
      return Future.value();
    }
  }

  //crearClase
  static agregarClase(Clase clase) async{
    await coleccionClases.insertAll([clase.toMap()]);
  }
  //actualizar Clase
  static actualizarClase(Clase clase) async{
    var m = await coleccionClases.findOne({"_id":clase.id});
    m['nombre'] =clase.nombre;
    m['profesor']=clase.profesor;
    m['horaIni']=clase.horaIni;
    m['minIni']=clase.minIni;
    m['horaFin']=clase.horaFin;
    m['minFin']=clase.minFin;
    m['dia']=clase.dia;
    m['salon']=clase.salon;
    await coleccionClases.save(m);
  }

  //eliminar Clase
  static eliminarClase(Clase clases) async{
    //await coleccionClases.remove(where.id(clases.id));
  }
}