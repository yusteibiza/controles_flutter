import 'package:controles/core/rutas.dart';
import 'package:controles/core/tema.dart';
import 'package:controles/pages/page_controles.dart';
import 'package:controles/pages/page_dialogos.dart';
import 'package:controles/pages/page_listas.dart';
import 'package:controles/pages/page_navegacion.dart';
import 'package:controles/pages/page_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TemaApp.tema(),
      routes: {
        // "/": (context) => const PageControles(),
        Rutas.principal: (context) => const PagePrincipal(),
        Rutas.controles: (context) => const PageControles(),
        Rutas.dialogos: (context) => const PageDialogos(),
        Rutas.navegacion: (context) => const PageNavegacion(),
        Rutas.listas: (context) => const PageListas(),
      },
    );
  }
}
