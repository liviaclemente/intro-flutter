// Modelo do contador usando ChangeNotifier
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  String _message = 'Toque nos botões para alterar o contador';

  // COMPLETE AQUI: Crie os getters para acessar os valores
  int get counter => _counter;
  String get message => _message;

  void increment() {
    _counter++;
    _updateMessage();
    // COMPLETE AQUI: Notifique os listeners
    notifyListeners();
  }

  void decrement() {
    _counter--;
    _updateMessage();
    // COMPLETE AQUI: Notifique os listeners
    notifyListeners();
  }

  // COMPLETE AQUI: Crie um método que multiplica o contador por 2
  void duplicate() {
    _counter = _counter * 2;
    _updateMessage();
    notifyListeners();
  }

  // COMPLETE AQUI: Crie um método que adiciona o quíntuplo do valor atual
  void addQuintuple() {
    _counter = _counter + _counter + _counter + _counter + _counter;
    _updateMessage();
    notifyListeners();
  }

  // COMPLETE AQUI: Crie um método que define um valor específico
  void setValue(int newValue) {
    _counter = 20;
    _updateMessage();
    notifyListeners();
  }

  void reset() {
    // COMPLETE AQUI: Resete o contador para 0
    _counter = 0;
    _message = 'Contador resetado!';
    notifyListeners();
  }

  // COMPLETE AQUI: Crie um getter que retorna se o número é par
  bool get isEven => _counter % 2 == 0 ? true : false;

  void _updateMessage() {
    if (_counter == 0) {
      _message = 'Contador zerado';
    } else if (_counter > 0) {
      // COMPLETE AQUI: Mensagem para contador positivo
      _message = 'Contador positivo: $_counter';
    } else {
      _message = 'Contador negativo: $_counter';
    }
  }


}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // COMPLETE AQUI: Crie uma instância do CounterModel
  final CounterModel _counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter - ChangeNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // COMPLETE AQUI: Use ListenableBuilder para escutar mudanças
            ListenableBuilder(
              listenable: _counterModel,
              builder: (context, child) {
                return Column(
                  children: [
                    // COMPLETE AQUI: Mostre o valor do contador
                    Text(
                      'Valor do Contador: ${_counterModel.counter}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            // COMPLETE AQUI: Use ListenableBuilder para a mensagem
            SizedBox(height: 20),
            // COMPLETE AQUI: Mostre se o número é par ou ímpar
            ListenableBuilder(
              listenable: _counterModel,
              builder: (context, child) {
                return Text(
                  'Número é: ${_counterModel.isEven ? 'par' : 'impar'}',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // COMPLETE AQUI: Conecte o método decrement e layout
                  onPressed: _counterModel.decrement,
                  child: Text('Decrementar'),
                ),
                ElevatedButton(
                  // COMPLETE AQUI: Conecte o método increment e layout
                  onPressed: _counterModel.increment,
                  child: Text('Incrementar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // COMPLETE AQUI: Conecte o método duplicate e layout
                  onPressed: _counterModel.duplicate,
                  child: Text('Duplicar'),
                ),
                ElevatedButton(
                  // COMPLETE AQUI: Conecte o método addQuintuple e layout
                  onPressed: _counterModel.addQuintuple,
                  child: Text('Quintuplo'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController controller =
                            TextEditingController();
                        return AlertDialog(
                          title: Text('Definir Valor'),
                          content: TextField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Digite um número',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                int? value = int.tryParse(controller.text);
                                if (value != null) {
                                  _counterModel.setValue(value);
                                }
                                Navigator.pop(context);
                              },
                              child: Text('Definir'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Definir Valor'),
                ),
                OutlinedButton(
                  // COMPLETE AQUI: Conecte o método reset
                  onPressed: _counterModel.reset,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // COMPLETE AQUI: Faça dispose do modelo
    _counterModel.dispose();
    super.dispose();
  }
}
