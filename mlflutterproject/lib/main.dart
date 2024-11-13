import 'package:flutter/material.dart';

void main() {
  runApp(const DiabetesPredictorApp());
}

class DiabetesPredictorApp extends StatelessWidget {
  const DiabetesPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes Risk Predictor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const DiabetesPredictor(),
    );
  }
}

class DiabetesPredictor extends StatefulWidget {
  const DiabetesPredictor({super.key});

  @override
  _DiabetesPredictorState createState() => _DiabetesPredictorState();
}

class _DiabetesPredictorState extends State<DiabetesPredictor> {
  final _formKey = GlobalKey<FormState>();
  String _gender = 'Select Gender';
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _glucoseController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _insulinController = TextEditingController();
  final TextEditingController _bloodPressureController = TextEditingController();

  double _riskScore = 0.0;

  // Function to calculate BMI
  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  // Function to predict the risk score (regression logic)
  void predictRisk() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // Example simple logic: Predict risk based on input fields (using mock formula)
        double age = double.parse(_ageController.text);
        double glucoseLevel = double.parse(_glucoseController.text);
        double weight = double.parse(_weightController.text);
        double height = double.parse(_heightController.text);
        double bmi = calculateBMI(weight, height);
        double insulinLevel = double.parse(_insulinController.text);
        double bloodPressure = double.parse(_bloodPressureController.text);

        // Mock regression formula for risk score
        _riskScore = (glucoseLevel * 0.01) + (bmi * 0.02) + (insulinLevel * 0.03) - (age * 0.001) + (bloodPressure * 0.001);

        // Make sure the score is between 0 and 1
        if (_riskScore > 1) {
          _riskScore = 1.0;
        } else if (_riskScore < 0) {
          _riskScore = 0.0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diabetes Risk Predictor', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  enabledBorder: OutlineInputBorder(),
                ),
                items: ['Select Gender', 'Male', 'Female'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue!;
                  });
                },
                validator: (value) {
                  if (value == 'Select Gender') {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  enabledBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _glucoseController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Glucose Level',
                  enabledBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter glucose level';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                        enabledBorder: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter weight';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Height (m)',
                        enabledBorder: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter height';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _insulinController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Insulin Level',
                  enabledBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter insulin level';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _bloodPressureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Blood Pressure',
                  enabledBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood pressure';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: predictRisk,
                child: const Text('Predict Diabetes Risk'),
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 4,
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Risk Score: ${_riskScore.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, color: Colors.teal),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Recommendations:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const Text('• Maintain a balanced diet low in sugars.'),
              const Text('• Engage in regular physical activity.'),
              const Text('• Monitor your blood sugar levels.'),
              const Text('• Consult a healthcare provider.'),
            ],
          ),
        ),
      ),
    );
  }
}
