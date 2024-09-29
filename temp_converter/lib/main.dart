import 'package:flutter/material.dart';

void main() {
  runApp(TempConverterApp());
}

class TempConverterApp extends StatelessWidget {
  const TempConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      home: TempConverterHomePage(),
    );
  }
}

class TempConverterHomePage extends StatefulWidget {
  const TempConverterHomePage({super.key});

  @override
  _TempConverterHomePageState createState() => _TempConverterHomePageState();
}

class _TempConverterHomePageState extends State<TempConverterHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionType = 'FtoC';
  String _result = '';
  final List<String> _history = [];

  void _convert() {
    double input = double.tryParse(_controller.text) ?? 0;
    double output;

    if (_conversionType == 'FtoC') {
      output = (input - 32) * 5 / 9;
      _history.add('F to C: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(2)}');
    } else {
      output = (input * 9 / 5) + 32;
      _history.add('C to F: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(2)}');
    }

    setState(() {
      _result = output.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Temperature Converter'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: const OutlineInputBorder(),
                suffixIcon: Text(
                  _conversionType == 'FtoC' ? '°F' : '°C',
                  style: const TextStyle(fontSize: 18),
              ))  , 
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select conversion type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'FtoC',
                  groupValue: _conversionType,
                  fillColor: WidgetStateProperty.all<Color>(Colors.green),
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                const Text('Fahrenheit to Celsius'),
                Radio<String>(
                  value: 'CtoF',
                  groupValue: _conversionType,
                  fillColor: WidgetStateProperty.all<Color>(Colors.green),
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                const Text('Celsius to Fahrenheit'),
              ],
            ),
            ElevatedButton(
              onPressed: _convert,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1149638855.
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.brown,
            ),
              child: Text('Convert')
            ),
            Text(
              'Converted Temperature: $_result',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Conversion History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
