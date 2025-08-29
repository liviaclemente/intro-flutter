import 'package:flutter/material.dart';
import 'package:intro_flutter/components/custom_card.dart';
import 'package:intro_flutter/exemples/simple_change_notifier_example.dart';
import 'package:intro_flutter/exemples/value_notifier_counter_screen.dart';
import 'package:intro_flutter/pages/counter_screen_page.dart';

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
                children: [CustomCard(
                  title: 'Counter Screen', 
                  description: 'Este é uma tela de contador interativo.', 
                  icon: Icons.add_circle_outline, 
                  destination: CounterScreenValueNotifier()
                  ),
                  CustomCard(
                  title: 'ChangeNotifier Simples', 
                  description: 'Este é uma tela de exemplo.', 
                  icon: Icons.add_circle_outline, 
                  destination: SimpleChangeNotifierExample()
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