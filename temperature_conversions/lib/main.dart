import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TemperatureConverterHome(),
    );
  }
}

class TemperatureConverterHome extends StatefulWidget {
  @override
  _TemperatureConverterHomeState createState() =>
      _TemperatureConverterHomeState();
}

class _TemperatureConverterHomeState extends State<TemperatureConverterHome> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  String _conversionType = "Celsius to Fahrenheit";
  List<String> _conversionHistory = [];

  void _convertTemperature() {
    double inputTemp = double.tryParse(_controller.text) ?? 0.0;
    double convertedTemp;

    if (_conversionType == "Celsius to Fahrenheit") {
      convertedTemp = (inputTemp * 9 / 5) + 32;
      _result = '$inputTemp°C = ${convertedTemp.toStringAsFixed(2)}°F';
    } else {
      convertedTemp = (inputTemp - 32) * 5 / 9;
      _result = '$inputTemp°F = ${convertedTemp.toStringAsFixed(2)}°C';
    }

    setState(() {
      _conversionHistory.add(_result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter by Audry Ashleen Chivanga'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Heading
            Text(
              'Convert Temperature',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Text Input for Temperature
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.thermostat),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Dropdown for Conversion Type
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Convert:'),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: _conversionType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _conversionType = newValue!;
                    });
                  },
                  items: <String>[
                    "Celsius to Fahrenheit",
                    "Fahrenheit to Celsius",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Convert Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300], // Light orange button
              ),
              onPressed: _convertTemperature, // Call conversion function here
              child: Text('Convert Temperature'),
            ),

            SizedBox(height: 16),

            // Display Result
            Text(
              _result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Divider
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            // Conversion History Heading
            Text(
              'Conversion History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

            // History List
            Expanded(
              child: ListView.builder(
                itemCount: _conversionHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.history),
                    title: Text(
                      _conversionHistory[index],
                      style: TextStyle(fontSize: 16),
                    ),
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
