import 'package:flutter/material.dart';

class PageControles extends StatelessWidget {
  const PageControles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        elevation: 2,
        foregroundColor: Colors.white,
        leading: IconButton(
          tooltip: "Atrás",
          iconSize: 24,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Controles"),
        actions: [
          IconButton(
            onPressed: () =>
                // Ir a la página inicial sin pasar de página en página en lugar de pop usar
                // popUntil y pasarle un ModalRoute a la raiz
                Navigator.popUntil(context, ModalRoute.withName("/")),
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
              leading: Icon(Icons.text_fields),
              title: Text("TextField"),
              onTap: () {},
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.text_fields),
              title: Text("TextField y controlador"),
              onTap: () {},
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.text_fields),
              title: Text("CheckBox"),
              onTap: () {},
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.text_fields),
              title: Text("Switch"),
              onTap: () {},
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.text_fields),
              title: Text("RadioButton"),
              onTap: () {},
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(50),
              ),
              leading: Icon(Icons.text_fields),
              title: Text("Slider"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
