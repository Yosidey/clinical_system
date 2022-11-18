import 'package:clinical_system/screens/tipo_cita/tipo_cita.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text("AuronMedical"),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Auronmedical',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi Agenda '),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Agendar cita'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TipoCitaPage()));
              },
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi Agenda '),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi Agenda '),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi Agenda '),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi Agenda '),
            ),

          ],
        ),
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
