import 'package:ejemplo/carpetaHorarioClase/HorarioClases.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'carpetaHorarioClase/HorarioClases.dart';
import 'package:ejemplo/baseDatos/baseDatosMongoDB.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp( PantallaPrincipal());
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String ahora = dateFormat.format(DateTime.now()); //Converting DateTime object to String

    return Scaffold(
      appBar: AppBar(
       title: Text(widget.title),
      ),
      body: ListView(
        children: [
        Text(
          ahora,
          style: TextStyle(
              fontSize: 30,
            ),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 70),
          Container(
            margin: EdgeInsets.only(left: 50.0,right: 50.0),
            child: RaisedButton.icon(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return new HorarioClasesyo();
                  }));
                },
                icon: Icon(Icons.calendar_today_sharp),
                label: Text('Horario de clase',
                      style: TextStyle(fontSize: 30, color: Colors.black)
                ),
                splashColor: Colors.lightGreen,
                color: Colors.green,
            )
          ),
        ],
      ),
    );
  }
}
