import 'package:flutter/material.dart';

class DiabetesPredictor extends StatefulWidget {
  const DiabetesPredictor({super.key});

  @override
  _DiabetesPredictorState createState() => _DiabetesPredictorState();
}

class _DiabetesPredictorState extends State<DiabetesPredictor> {
  String? selectedGender = 'Select Gender';
  final TextEditingController ageController = TextEditingController();
  final TextEditingController glucoseController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();

  String predictionResult = 'No prediction yet';

  void predictDiabetes() {
    // Simple prediction logic based on user input
    int age = int.tryParse(ageController.text) ?? 0;
    double glucose = double.tryParse(glucoseController.text) ?? 0;
    double insulin = double.tryParse(insulinController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    double bmi = height > 0 ? weight / (height * height) : 0;

    // Basic logic for prediction
    if (age > 45 || glucose > 140 || insulin > 15 || bmi > 30) {
      setState(() {
        predictionResult = 'Prediction: Positive for Diabetes';
      });
    } else {
      setState(() {
        predictionResult = 'Prediction: Negative for Diabetes';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diabetes Predictor', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gender Selection Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
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
                    selectedGender = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Age Input Field
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Glucose Level Input Field
              TextFormField(
                controller: glucoseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Glucose Level',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Weight and Height Input Fields for BMI
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (m)',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Insulin Level Input Field
              TextFormField(
                controller: insulinController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Insulin Level',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Blood Pressure Input Field
              TextFormField(
                controller: bloodPressureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Blood Pressure',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Predict Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: predictDiabetes,
                child: const Text('Predict Diabetes'),
              ),
              const SizedBox(height: 16),

              // Prediction Result
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    predictionResult,
                    style: const TextStyle(fontSize: 18, color: Colors.teal),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Recommendations
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

// Main entry point of the app
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const DiabetesPredictor(), // Use const for better performance
  ));
}
