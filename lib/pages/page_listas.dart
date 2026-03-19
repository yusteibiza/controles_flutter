import 'dart:collection';
import 'package:flutter/material.dart';

enum tipoLista { Reordenable, Fija }

class PageListas extends StatefulWidget {
  const PageListas({super.key});

  @override
  State<PageListas> createState() => _PageListasState();
}

class _PageListasState extends State<PageListas> {
  tipoLista _tipoLista = tipoLista.Reordenable;
  late LinkedHashMap<String, String> _nombres;
  bool _ordenando = false;
  int _indiceOrdenando = 0;
  Map<String, bool> _checks = {};

  @override
  void initState() {
    super.initState();
    _nombres = LinkedHashMap.from({
      'Antonio': '👨🏻',
      'Pepe': '🧑🏻‍🦰',
      'Sonia': '👱🏻‍♀️',
      'Carlos': '👦🏻',
      'María': '👩🏻',
    });
    for (var key in _nombres.keys) {
      _checks[key] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget rol = ReorderableListView.builder(
      key: ValueKey('listaOrdenable'),
      proxyDecorator: (child, index, animation) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: child,
        );
      },
      itemBuilder: (context, index) {
        String key = _nombres.keys.elementAt(index);
        String value = _nombres.values.elementAt(index);

        return Card(
          key: ValueKey(key),
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _checks[key] = !_checks[key]!;
              });
            },
            child: ListTile(
              leading: Text(value, style: TextStyle(fontSize: 24)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(key, style: TextStyle(fontSize: 18)),
                  Checkbox(
                    value: _checks[key],
                    activeColor: Colors.amber,
                    fillColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 138, 143, 148),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _checks[key] = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: _nombres.length,
      onReorderStart: (index) {
        setState(() {
          _ordenando = true;
          _indiceOrdenando = index;
        });
      },
      onReorderEnd: (index) {
        setState(() {
          _ordenando = false;
        });
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final key = _nombres.keys.elementAt(oldIndex);
          final value = _nombres[key]!;
          _nombres.remove(key);
          final newMap = <String, String>{};
          int i = 0;
          for (var k in _nombres.keys) {
            if (i == newIndex) {
              newMap[key] = value;
            }
            newMap[k] = _nombres[k]!;
            i++;
          }
          if (newIndex >= _nombres.length) {
            newMap[key] = value;
          }
          _nombres = LinkedHashMap.from(newMap);
        });
      },
    );

    Widget nrol = ListView.builder(
      key: ValueKey('listaFija'),
      itemBuilder: (context, index) {
        String key = _nombres.keys.elementAt(index);
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(title: Text(key)),
        );
      },
      itemCount: _nombres.length,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_ordenando)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text(
                  "Ordenando... ${_nombres.keys.elementAt(_indiceOrdenando)}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          IconButton(
            tooltip: "Lista reordenable",
            onPressed: () {
              setState(() {
                _tipoLista = tipoLista.Reordenable;
              });
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            tooltip: "Lista fija",
            onPressed: () {
              setState(() {
                _tipoLista = tipoLista.Fija;
              });
            },
            icon: Icon(Icons.list_alt_sharp),
          ),
          IconButton(
            tooltip: "Orden ascendente",
            onPressed: () {
              setState(() {
                final sorted = _nombres.entries.toList()
                  ..sort((a, b) => a.key.compareTo(b.key));
                _nombres = LinkedHashMap.fromEntries(sorted);
              });
            },
            icon: Icon(Icons.arrow_upward),
          ),
          IconButton(
            tooltip: "Orden descendente",
            onPressed: () {
              setState(() {
                final sorted = _nombres.entries.toList()
                  ..sort((a, b) => b.key.compareTo(a.key));
                _nombres = LinkedHashMap.fromEntries(sorted);
              });
            },
            icon: Icon(Icons.arrow_downward),
          ),
        ],
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF166C1B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Listas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _tipoLista == tipoLista.Fija ? nrol : rol,
      ),
    );
  }
}
