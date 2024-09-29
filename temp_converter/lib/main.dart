import 'package:flutter/material.dart';

// Main function to run the app
void main() {
  runApp(TempConverterApp());
}

// Root widget of the app
class TempConverterApp extends StatelessWidget {
  const TempConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title of the app
      title: 'Temperature Converter',
      // Home page of the app
      home: TempConverterHomePage(),
    );
  }
}

// The main home page widget, which contains the conversion logic and UI
class TempConverterHomePage extends StatefulWidget {
  const TempConverterHomePage({super.key});

  @override
  _TempConverterHomePageState createState() => _TempConverterHomePageState();
}

// The state class where the logic and state management for the UI occur
class _TempConverterHomePageState extends State<TempConverterHomePage> {
  // Controller for the input text field to handle temperature input
  final TextEditingController _controller = TextEditingController();
  
  // Variable to track the selected conversion type (Fahrenheit to Celsius or vice versa)
  String _conversionType = 'FtoC';

  // Variable to store the result of the conversion
  String _result = '';

  // List to store the history of conversions
  final List<String> _history = [];

  // Method to perform the conversion based on the selected type
  void _convert() {
    // Parse the input value as a double, defaulting to 0 if the input is invalid
    double input = double.tryParse(_controller.text) ?? 0;
    double output;

    // Convert Fahrenheit to Celsius
    if (_conversionType == 'FtoC') {
      output = (input - 32) * 5 / 9;
      // Add conversion details to history
      _history.add('F to C: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(2)}');
    } 
    // Convert Celsius to Fahrenheit
    else {
      output = (input * 9 / 5) + 32;
      // Add conversion details to history
      _history.add('C to F: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(2)}');
    }

    // Update the result and the UI
    setState(() {
      _result = output.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a title
      appBar: AppBar(
        title: const Text('My Temperature Converter'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      // Main content of the page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field for temperature
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: const OutlineInputBorder(),
                suffixIcon: Text(
                  // Display °F or °C based on the selected conversion type
                  _conversionType == 'FtoC' ? '°F' : '°C',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Text label for conversion type selection
            const Text(
              'Select conversion type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Row of radio buttons for selecting conversion type
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Radio button for Fahrenheit to Celsius
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
                // Radio button for Celsius to Fahrenheit
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
            // Convert button to trigger the conversion
            ElevatedButton(
              onPressed: _convert,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Button text color
                backgroundColor: Colors.brown, // Button background color
              ),
              child: const Text('Convert'),
            ),
            // Display the converted result
            Text(
              'Converted Temperature: $_result',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Text label for conversion history
            const Text(
              'Conversion History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // List of past conversions
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  // Display each history entry in a list tile
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
