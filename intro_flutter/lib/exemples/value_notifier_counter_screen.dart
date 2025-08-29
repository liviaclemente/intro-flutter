import 'package:flutter/material.dart';

// Tela principal do contador usando ValueNotifier para gerenciar estado.
class CounterScreenValueNotifier extends StatefulWidget {
  const CounterScreenValueNotifier({super.key});
  

  @override
  State<CounterScreenValueNotifier> createState() => _CounterScreenValueNotifierState();
}

 // Armazena o valor atual
class _CounterScreenValueNotifierState extends State<CounterScreenValueNotifier> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  // Armazena a mensagem exibida
  final ValueNotifier<String> _message = ValueNotifier<String>('Toque nos botões para incrementar ou decrementar o contador');

   // Armazena a cor do contador
  final ValueNotifier<Color> _counterColor = ValueNotifier<Color>(Colors.blue);

// Para de ouvir as mudanças
  @override
  void dispose() {
    _counter.dispose();
    _message.dispose();
    _counterColor.dispose();
    super.dispose();
  }

// Funções para incrementar, decrementar e resetar o contador
  void _incrementCounter() {
    _counter.value++;
    _updateMessageAndColor();
  }

  void _decrementCounter() {
    _counter.value--;
    _updateMessageAndColor();
  }

  void _resetCounter() {
    _counter.value = 0;
    _message.value = 'Contador Resetado';
    _counterColor.value = Colors.blue;
  }

  // Funções para atualizar a mensagem e a cor do contador

  void _updateMessageAndColor() {
    if (_counter.value == 0) {
      _message.value = 'Contador Zerado';
      _counterColor.value = Colors.blue;
    } else if (_counter.value > 0) {
      _message.value = 'Contador Positivo: ${_counter.value}';
      _counterColor.value = Colors.green;
    } else {
      _message.value = 'Contador Negativo: ${_counter.value}';
      _counterColor.value = Colors.red;
    }
  }

// Método build que constrói a interface do usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Interativo'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<Color>(
                valueListenable: _counterColor,
                builder: (context, color, _) {
                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: color.withAlpha(1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: color, width: 2)),
                    child: Column(
                      children: [
                        const Text(
                          'Valor do contador:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<int>(
                          valueListenable: _counter,
                          builder: (context, value, _) {
                            return Text(
                              '$value',
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: color),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<String>(
                valueListenable: _message,
                builder: (context, msg, _) {
                  return Text(
                    msg,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _decrementCounter,
                    label: Text('Decrementar', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                  ElevatedButton.icon(
                    onPressed: _incrementCounter,
                    label: Text('Incrementar', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  ElevatedButton.icon(
                    onPressed: _resetCounter,
                    label: Text('Resetar', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
