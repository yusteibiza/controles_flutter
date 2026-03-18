import 'package:flutter/material.dart';

class PageDialogos extends StatelessWidget {
  const PageDialogos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        elevation: 2,
        foregroundColor: Colors.white,
        title: Text("Diálogos"),
        actions: [
          IconButton(
            onPressed: () =>
                // Ir a la página inicial retrocediendo una página en el caché
                // de navegación
                Navigator.pop(context),
            icon: Icon(Icons.home),
          ),
        ],
      ),
      // El listview debe de ir dentro de un scaffold
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.help),
              title: Text("Acerca de..."),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
