import 'package:controles/efectos/explosion_ink_well.dart';
import 'package:controles/pages/page_controles.dart';
import 'package:flutter/material.dart';

class PageNavegacion extends StatelessWidget {
  const PageNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.green.shade400,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Navegación"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                    leading: Icon(Icons.gps_not_fixed_outlined),
                    // Llamar a Navigator mediante un nombre de ruta
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
