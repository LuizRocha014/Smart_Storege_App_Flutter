import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';

class BackgroundDefault extends StatelessWidget {
  final String? titulo;
  const BackgroundDefault({super.key, this.titulo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: Container(
          color: Colors.white,
          width: 250,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) =>
                const Center(child: TextWidget('Tste')),
          ),
        ),
        body: const Center(child: TextWidget("texto")),
        backgroundColor: Colors.blueGrey.shade200,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
