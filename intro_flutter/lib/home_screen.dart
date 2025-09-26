

import 'package:flutter/material.dart';
import 'package:intro_flutter/components/custom_card.dart';
import 'package:intro_flutter/exemples/questao_pratica.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                
              CustomCard(
              title: 'Formativa', 
              description: 'Este é um countador - avaliação formativa', 
              icon: Icons.add_circle_outline, 
              destination: CounterScreen()
              )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}