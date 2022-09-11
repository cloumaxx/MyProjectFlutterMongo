import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:ejemplo/baseDatos/baseDatosMongoDB.dart';
import 'package:ejemplo/modelos/clase.dart';


class EditarClase extends StatelessWidget {
  const EditarClase({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editar Clase ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Mi horario'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const EDICION = 1;
  static const INSERCION = 2;

  TextEditingController nombreController = TextEditingController();
  TextEditingController profesorController = TextEditingController();
  TextEditingController salonController = TextEditingController();
  TextEditingController horaIniController=TextEditingController();
  TextEditingController minIniController=TextEditingController();
  TextEditingController horaFinController=TextEditingController();
  TextEditingController minFinController=TextEditingController();
  TextEditingController diaController=TextEditingController();

  @override
  Widget build(BuildContext context){
    var textoWidget = "Añadir clase";
    int operacion = INSERCION;
    Clase? clase;
    if (ModalRoute.of(context)?.settings.arguments != null){
      operacion =  EDICION;
      clase = ModalRoute.of(context)?.settings.arguments as Clase;
      nombreController.text = clase.nombre;
      profesorController.text = clase.profesor;
      salonController.text=clase.salon;
      horaIniController.text=clase.horaIni.toString();
      minIniController.text=clase.minIni.toString();
      horaFinController.text=clase.horaFin.toString();
      minFinController.text=clase.minFin.toString();
      diaController.text=clase.dia.toString();

    textoWidget ="Editar Clase";

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(textoWidget),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nombreController,
                      decoration: InputDecoration(labelText: "Nombre"),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: profesorController,
                    decoration: InputDecoration(labelText: "Profesor"),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: salonController,
                    decoration: InputDecoration(labelText: "Salon"),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: ElevatedButton(
                child: Text(textoWidget),
                onPressed: (){
                  if(operacion == EDICION){

                  }else{

                  }
                 },
              ),
            ),
          )
        ],
      ),
    );

  }
  _insertarClase() async{
    final clase = Clase(
        id: M.ObjectId,
        nombre: nombreController.text,
        profesor: profesorController.text,
        salon: salonController.text,
        horaIni:int.parse(horaIniController.text),
        minIni:int.parse(minIniController.text),
        horaFin:int.parse(horaFinController.text),
        minFin:int.parse(minFinController.text),
        dia:int.parse(diaController.text)
    );
    await MongoDB.agregarClase(clase);
    Navigator.pop(context);
    }

    _actualizarClase(Clase clase) async{
      final j = Clase(
          id: clase.id,
          nombre: nombreController.text,
          profesor: profesorController.text,
          salon: salonController.text,
          horaIni:int.parse(horaIniController.text),
          minIni:int.parse(minIniController.text),
          horaFin:int.parse(horaFinController.text),
          minFin:int.parse(minFinController.text),
          dia:int.parse(diaController.text)
      );
      await MongoDB.actualizarClase(j);
    }

    @override
    void dispose(){
      super.dispose();
      nombreController.dispose();
      profesorController.dispose();
      salonController.dispose();
      horaIniController.dispose();
      minIniController.dispose();
      horaFinController.dispose();
      minFinController.dispose();
      diaController.dispose();
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
