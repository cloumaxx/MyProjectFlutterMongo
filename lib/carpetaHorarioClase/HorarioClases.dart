import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ejemplo/baseDatos/baseDatosMongoDB.dart';

import 'RegistroNuevaClase.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp( HorarioClasesyo());
}

class HorarioClasesyo extends StatelessWidget {
  const HorarioClasesyo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi horario',
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            child: SfCalendar(
              view: CalendarView.week,
              firstDayOfWeek: 1,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 50.0,right: 50.0),
              child: RaisedButton.icon(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return new AgregarClaseNueva();
                  }));
                },
                icon: Icon(Icons.calendar_today_sharp),
                label: Text('Agregar Clase',
                    style: TextStyle(fontSize: 30, color: Colors.black)
                ),
                splashColor: Colors.lightGreen,
                color: Colors.green,
              )
          ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
