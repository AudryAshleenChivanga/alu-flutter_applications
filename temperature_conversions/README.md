# **Temperature Converter App**

A simple yet intuitive Flutter application for converting temperatures between Celsius and Fahrenheit. The app allows users to input a temperature, select the conversion type, display the result, and maintain a history of all conversions. It also features a responsive design that adapts to both portrait and landscape orientations.

## **Purpose**
The purpose of the Temperature Converter app is to provide users with a clean, easy-to-use interface to convert temperatures between Celsius and Fahrenheit. It demonstrates:
- State management in Flutter using **StatefulWidgets**.
- Use of **TextField** for input, **DropdownButton** for options, and **ListView** for displaying a history of conversions.
- A responsive layout using **OrientationBuilder** to adapt the interface for both portrait and landscape modes.

## **Features**
- Input temperatures and select between two conversion types: **Celsius to Fahrenheit** and **Fahrenheit to Celsius**.
- Calculate and display the conversion result.
- Maintain a conversion history that logs all previous conversions.
- Responsive UI that works seamlessly in both portrait and landscape orientations.

## **App Architecture**

### **Main Function (`main.dart`)**
The **main.dart** file contains the entry point for the Flutter application:
- **`runApp()`**: Launches the app by creating an instance of **TemperatureConverterApp**, a stateless widget that sets up the app's theme and directs to the home screen, **TemperatureConverterHome**.

### **Widgets**
1. **`TemperatureConverterApp` (StatelessWidget)**:
   - Sets up the Material Design for the app using the **MaterialApp** widget.
   - Defines the app's theme (primary color: orange) and directs to the **TemperatureConverterHome** widget, the main screen of the app.

2. **`TemperatureConverterHome` (StatefulWidget)**:
   - The core of the app where the user interacts with temperature conversion.
   - Manages the app's state, including input temperature, conversion type, result, and conversion history.

### **Key Components**
1. **`TextField`**:
   - Captures the user’s input (temperature).
   - Utilizes a **TextEditingController** to manage the input data.

2. **`DropdownButton`**:
   - Provides a selection menu for choosing the conversion type: "Celsius to Fahrenheit" or "Fahrenheit to Celsius".

3. **`ElevatedButton`**:
   - Executes the conversion when pressed. The conversion logic is based on simple mathematical formulas:
     - Celsius to Fahrenheit: `°F = (°C * 9/5) + 32`
     - Fahrenheit to Celsius: `°C = (°F - 32) * 5/9`

4. **`ListView.builder`**:
   - Displays the conversion history in a scrollable list format.
   - Each item in the history is represented as a **ListTile**, making it visually appealing with icons.

5. **`OrientationBuilder`**:
   - Adjusts the layout based on device orientation (portrait or landscape).
   - In portrait mode, the widgets are arranged in a vertical **Column**.
   - In landscape mode, the widgets are rearranged into a horizontal **Row** for a better user experience on wider screens.

## **Demo**

You can watch a demo of the app in action on YouTube:  
[![Temperature Converter App Demo](https://img.youtube.com/vi/7R2F727NjRw/maxresdefault.jpg)](https://youtu.be/7R2F727NjRw)

## **How to Run the App**
1. Clone the repository from GitHub.
2. Make sure Flutter is installed on your machine. If not, follow [Flutter's installation guide](https://flutter.dev/docs/get-started/install).
3. Run `flutter pub get` to install the dependencies.
4. Use an emulator or connect a physical device and run `flutter run` to launch the app.

## **Future Improvements**
- Add support for additional temperature units like Kelvin.
- Allow users to edit and remove items from the conversion history.
- Implement a clearer way to show past results (e.g., with better formatting or color coding).
