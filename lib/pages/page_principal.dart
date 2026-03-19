import 'dart:io';

import 'package:controles/efectos/explosion_ink_well.dart';
import 'package:controles/pages/page_controles.dart';
import 'package:controles/pages/page_listas.dart';
import 'package:flutter/material.dart';

class PagePrincipal extends StatelessWidget {
  const PagePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return ExplosionInkWell(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => PopScope(
                    canPop: false,
                    child: SimpleDialog(
                      alignment: .centerEnd,
                      titleTextStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      title: Text('Finalizar', textAlign: .center),
                      contentPadding: .all(10),
                      children: [
                        Column(
                          children: [
                            Divider(),
                            SizedBox(height: 10),
                            Text("¿Finalizar app?"),
                            Row(
                              mainAxisAlignment: .center,
                              children: [
                                IconButton(
                                  onPressed: () => exit(0),
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(Icons.cancel, color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
          backgroundColor: Colors.grey.shade300,
          leading: Icon(Icons.add_chart_outlined),
          title: Text("Controles en Flutter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                style: TextStyle(
                  color: Colors.blueAccent.shade400,
                  fontWeight: .bold,
                  fontSize: 18,
                ),
                textAlign: .center,
                "Ejemplos y pruebas de varios controles de usuario en Flutter",
              ),
              Expanded(
                child: ListView(
                  children: [
                    Divider(),
                    ListTile(
                      splashColor: Colors.blue.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      title: Text("Navegación (Navigator)"),
                      leading: Icon(Icons.navigation),
                      // Llamar a Navigator mediante un nombre de ruta
                      onTap: () => Navigator.pushNamed(context, "/navegacion"),
                    ),
                    ListTile(
                      splashColor: Colors.blue.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      title: Text("Diálogos"),
                      leading: Icon(Icons.speaker_notes_outlined),
                      // Llamar a Navigator mediante un nombre de ruta
                      onTap: () => Navigator.pushNamed(context, "/dialogos"),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      title: Text("Controles"),
                      leading: Icon(Icons.control_camera_sharp),
                      onTap: () {
                        Navigator.push(
                          context,
                          // Llamar a Navigator mediante una clase de enrutado
                          // Requiere como argumento un BuildContext que es el contexto y
                          // devuelve un Widget en este caso la página de controles
                          MaterialPageRoute(
                            builder: (context) => const PageControles(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      title: Text("Listas"),
                      leading: Icon(Icons.list),
                      onTap: () {
                        Navigator.push(
                          context,
                          // Llamar a Navigator mediante una clase de enrutado
                          // Requiere como argumento un BuildContext que es el contexto y
                          // devuelve un Widget en este caso la página de controles
                          MaterialPageRoute(
                            builder: (context) => const PageListas(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
