import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _saldoActualController = TextEditingController();
  final TextEditingController _min1Controller = TextEditingController();
  final TextEditingController _min2a10Controller = TextEditingController();
  final TextEditingController _min11Controller = TextEditingController();
  String _recarga = '';
  String _result = '';

  void _calculateMinutes() {
    double saldoActual = double.parse(_saldoActualController.text);
    double recarga = double.tryParse(_recarga) ?? 0.0;
    double min1 = double.parse(_min1Controller.text);
    double min2a10 = double.parse(_min2a10Controller.text);
    double min11 = double.parse(_min11Controller.text);

    double totalSaldo = saldoActual + recarga;
    int minutos1 = 0;
    int minutos2a10 = 0;
    int minutos11 = 0;

    if (totalSaldo >= min1) {
      minutos1 = 1;
      totalSaldo -= min1;
    }

    if (totalSaldo > 0) {
      minutos2a10 = (totalSaldo / min2a10).clamp(0, 9).toInt();
      totalSaldo -= minutos2a10 * min2a10;
    }

    if (totalSaldo > 0) {
      minutos11 = (totalSaldo / min11).toInt();
    }

    setState(() {
      _result =
          'Minutos en rango 1: $minutos1\nMinutos en rango 2 a 10: $minutos2a10\nMinutos en rango 11+: $minutos11';
    });
  }

  void _updateRecarga(String value) {
    setState(() {
      _recarga = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 217, 0),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('lib/img/ciudad.jpg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Color.fromARGB(24, 0, 0, 0)
                  .withOpacity(0.5), // Aplicar transparencia
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildTextField(_saldoActualController,
                          'Saldo actual', _updateRecarga),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          'Recarga: $_recarga',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildTextField(_min1Controller, 'Valor Min 1'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                          _min2a10Controller, 'Valor Min 2 a 10'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(_min11Controller, 'Valor Min 11+'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateMinutes,
                  child: Text('Calcular'),
                ),
                SizedBox(height: 20),
                Text(
                  'Resultado:\n$_result',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 225, 231, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      [void Function(String)? onChanged]) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(),
      ),
    );
  }
}
