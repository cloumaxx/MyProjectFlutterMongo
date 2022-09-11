import 'package:flutter/material.dart';
import 'package:ejemplo/baseDatos/baseDatosMongoDB.dart';
import 'package:ejemplo/modelos/clase.dart';
import 'package:ejemplo/carpetaHorarioClase/FichaClase.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ejemplo/baseDatos/baseDatosMongoDB.dart';

import 'editar_Clase.dart';

class AgregarClaseNueva extends StatelessWidget {
  const AgregarClaseNueva({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar Clase Nueva',
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
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: MongoDB.getClases(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Container(
            color: Colors.white,
            child:  const LinearProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }else if (snapshot.hasError){
          return Container(
              color: Colors.white,
              child: Center(
                  child: Text("Ocurrio un error vuelvelo a intentar",
                    style: Theme.of(context).textTheme.headline6,)
              )
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              title: Text('Clases  Registrados'),
            ),
            body: ListView.builder(
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  FichaClase(
                      clase: Clase.fromMap(snapshot.data[index]),
                      onTapDelete: () async{
                        _eliminarClase(Clase.fromMap(snapshot.data[index]));
                      },
                      onTapEdit:() async{
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context){
                              return EditarClase();
                            },
                            settings: RouteSettings(
                              arguments: Clase.fromMap(snapshot.data[index]),

                            )
                            )
                        );
                      }
                  ),
                );
              },
              itemCount: snapshot.data.length,

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return EditarClase();
                })).then((value) => setState( () {}));
              },
              child: Icon(Icons.add) ,
            ),
          );
        }
      },

    );
  }
  _eliminarClase( Clase clase) async{
    await MongoDB.eliminarClase(clase);
    setState((){ });
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
