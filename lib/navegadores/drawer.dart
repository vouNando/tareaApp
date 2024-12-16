

import 'package:flutter/material.dart';
import 'package:tarea_app/main.dart';
import 'package:tarea_app/screen1.dart';
import 'package:tarea_app/screens2.dart';
import 'package:tarea_app/screens3.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Inicio"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screens1())),
          ),
          ListTile(
            title: Text("registro"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen2())),
          ),
          ListTile(
            title: Text("nada"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screens3())),
          ),
        
         
        ],
      ),
    );
  }
}
