# **Quiz App**

A Flutter-based mobile application that allows users to test their knowledge by answering quiz questions fetched from an external API. The app consists of three screens: Splash Screen, Quiz Screen, and Score Screen. It uses dynamic state management and seamless navigation to ensure an engaging user experience.

---

## **Features**
- Fetches quiz questions dynamically from the **Open Trivia Database API**.
- Displays multiple-choice questions with a timer for each question.
- Tracks user score and provides a final score summary.
- Offers options to restart the quiz or return to the main screen.
- Handles API responses and errors gracefully.

---

## **Screens**

### **1. Splash Screen**
- **Purpose**: Briefly displayed upon app launch, introduces the app.
- **Functionality**:
  - Displays welcome text.
  - Automatically navigates to the Quiz Screen after 3 seconds.

### **2. Quiz Screen**
- **Purpose**: Main screen where users answer questions.
- **Functionality**:
  - Fetches questions from the API.
  - Displays a timer for each question.
  - Updates score dynamically based on user answers.
  - Navigates to the Score Screen after the last question.

### **3. Score Screen**
- **Purpose**: Displays the user’s final score.
- **Functionality**:
  - Shows the number of correct answers out of the total questions.
  - Provides options to restart the quiz or return to the previous screen.

---

## **API Integration**
The app uses the **[Open Trivia Database API](https://opentdb.com/)** to fetch quiz questions. 

- **Endpoint**: 
- **Response Format**: JSON containing question text, options, and the correct answer.

- **API Handling**:
- Uses `http` package for HTTP requests.
- Implements error handling to manage API failures or delays.

---

## **Technologies Used**
- **Flutter**: Frontend development framework.
- **Dart**: Programming language.
- **http**: Library for API communication.
- **State Management**: `setState` for UI updates.

---

## **Widgets and Techniques**
- **Widgets**:
- `FutureBuilder`: Handles asynchronous data fetching.
- `ListView.builder`: Dynamically displays question options.
- `ElevatedButton`: Used for interactive buttons.
- `Text`: Displays questions, scores, and messages.
- **Navigation**:
- `Navigator.pushReplacement`: For seamless navigation between screens.
- **State Management**:
- `setState`: Updates UI elements based on app state.

---

## **Installation and Setup**
1. Clone the repository:
 ```bash
     git clone <repository-url>
2.  Navigate the directory:
```bash
    cd quiz_app
3. Install dependencies and run:
```bash
    flutter pub get
    flutter run