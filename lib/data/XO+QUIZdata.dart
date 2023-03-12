import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'question.dart';

class AppBrain {
  int _x = 0;

  List<Quistons> mobileDevQuiz = [
    Quistons(
      textquestion:
          "What is the official language for Android app development?",
      options: {
        "Java": true,
        "Swift": false,
        "Dart": false,
        "Python": false,
      },
    ),
    Quistons(
      textquestion:
          "What is the equivalent language to Java for iOS app development?",
      options: {
        "Objective-C": true,
        "Kotlin": false,
        "Swift": false,
        "C++": false,
      },
    ),
    Quistons(
      textquestion:
          "What database is commonly used for mobile app development?",
      options: {
        "MySQL": false,
        "MongoDB": false,
        "SQLite": true,
        "PostgreSQL": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development framework?",
      options: {
        "React Native": true,
        "Flutter": true,
        "Ionic": true,
        "Xamarin": true,
      },
    ),
    Quistons(
      textquestion:
          "What programming language is used to develop Flutter apps?",
      options: {
        "Java": false,
        "Swift": false,
        "Dart": true,
        "Python": false,
      },
    ),
    Quistons(
      textquestion: "What is the primary language for iOS app development?",
      options: {
        "Swift": true,
        "Objective-C": true,
        "Java": false,
        "C++": false,
      },
    ),
    Quistons(
      textquestion:
          "What database system is most commonly used in Android app development?",
      options: {
        "MongoDB": false,
        "SQLite": true,
        "PostgreSQL": false,
        "MySQL": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development tool?",
      options: {
        "Visual Studio": false,
        "Xcode": false,
        "Android Studio": false,
        "Flutter": true,
      },
    ),
    Quistons(
      textquestion: "What is the primary language for Android app development?",
      options: {
        "Java": true,
        "Dart": false,
        "Swift": false,
        "Python": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular database system for iOS app development?",
      options: {
        "PostgreSQL": false,
        "MySQL": false,
        "SQLite": true,
        "MongoDB": false,
      },
    ),
    Quistons(
      textquestion: "What is a popular mobile app development platform?",
      options: {
        "Facebook": false,
        "Google": false,
        "Apple": false,
        "All of the above": true,
      },
    ),
    Quistons(
      textquestion: "What is a popular framework for building native iOS apps?",
      options: {
        "Ionic": false,
        "React Native": false,
        "Xamarin": false,
        "UIKit": true,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular database system for Android app development?",
      options: {
        "SQLite": true,
        "PostgreSQL": false,
        "MySQL": false,
        "MongoDB": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular mobile app development platform owned by Google?",
      options: {
        "Android Studio": true,
        "Xcode": false,
        "Visual Studio": false,
        "Eclipse": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development language?",
      options: {
        "Java": false,
        "Swift": false,
        "Dart": true,
        "Python": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular framework for building native Android apps?",
      options: {
        "Ionic": false,
        "React Native": false,
        "Xamarin": false,
        "Android SDK": true,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular database system for iOS app development?",
      options: {
        "MongoDB": false,
        "PostgreSQL": false,
        "SQLite": true,
        "MySQL": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular mobile app development platform owned by Apple?",
      options: {
        "Xcode": true,
        "Android Studio": false,
        "Visual Studio": false,
        "Eclipse": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development framework owned by Google?",
      options: {
        "React Native": false,
        "Xamarin": false,
        "Ionic": false,
        "Flutter": true,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular programming language for Android app development?",
      options: {
        "Java": true,
        "Swift": false,
        "Dart": false,
        "Python": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development tool owned by Microsoft?",
      options: {
        "Xcode": false,
        "Android Studio": false,
        "Visual Studio": true,
        "Eclipse": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular mobile app development platform owned by Facebook?",
      options: {
        "Android Studio": false,
        "Xcode": false,
        "Visual Studio": false,
        "React Native": true,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular programming language for iOS app development?",
      options: {
        "Swift": true,
        "Objective-C": true,
        "Java": false,
        "C++": false,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular database system for Android app development?",
      options: {
        "MongoDB": false,
        "SQLite": true,
        "PostgreSQL": false,
        "MySQL": false,
      },
    ),
    Quistons(
      textquestion: "What is a popular framework for building native iOS apps?",
      options: {
        "Ionic": false,
        "React Native": false,
        "Xamarin": false,
        "UIKit": true,
      },
    ),
    Quistons(
      textquestion:
          "What is a popular cross-platform mobile app development language?",
      options: {
        "Java": false,
        "Swift": false,
        "Dart": true,
        "Python": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of an API in mobile development?",
      options: {
        "To provide a graphical user interface for an app": false,
        "To allow the app to interact with other apps or services": true,
        "To generate code automatically": false,
        "To simulate different device configurations": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a JOIN statement in SQL?",
      options: {
        "To add new data to a table": false,
        "To delete data from a table": false,
        "To modify existing data in a table": false,
        "To combine data from two or more tables": true,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of an Intent in Android?",
      options: {
        "To store data in a key-value pair": false,
        "To launch a new activity or service": true,
        "To create a custom view for an app": false,
        "To handle runtime exceptions": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a primary key in a database table?",
      options: {
        "To uniquely identify each row in the table": true,
        "To group rows together based on a common value": false,
        "To sort the rows in the table in ascending or descending order": false,
        "To perform complex calculations on the data in the table": false,
      },
    ),
    Quistons(
      textquestion:
          "Which of the following is NOT a mobile programming language?",
      options: {
        "Java": false,
        "Python": true,
        "Swift": false,
        "Kotlin": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a foreign key in a database table?",
      options: {
        "To uniquely identify each row in the table": false,
        "To group rows together based on a common value": false,
        "To establish a relationship between two tables": true,
        "To perform complex calculations on the data in the table": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a layout file in Android?",
      options: {
        "To store data in a key-value pair": false,
        "To define the user interface of an app": true,
        "To create a custom view for an app": false,
        "To handle runtime exceptions": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a storyboard in iOS?",
      options: {
        "To define the user interface of an app": true,
        "To store data in a key-value pair": false,
        "To create a custom view for an app": false,
        "To handle runtime exceptions": false,
      },
    ),
    Quistons(
      textquestion: "What is the purpose of a package in Java?",
      options: {
        "To group related classes together": true,
        "To define the user interface of an app": false,
        "To create a custom view for an app": false,
        "To handle runtime exceptions": false,
      },
    ),
    Quistons(
      textquestion: "What is a database?",
      options: {
        "A collection of data that is stored and organized in a way that allows it to be easily accessed, managed and updated.":
            true,
        "A program that allows you to write, test, and debug code.": false,
        "A set of rules for creating and formatting code.": false,
        "A device that displays visual output from a computer.": false,
      },
    ),
    Quistons(
      textquestion: "What is an API?",
      options: {
        "A set of protocols and tools for building application software": true,
        "A tool for storing and retrieving data in a structured way": false,
        "A way to style and layout web pages using HTML and CSS": false,
        "A programming language for creating web applications": false,
      },
    ),
    Quistons(
      textquestion: "What is a variable in programming?",
      options: {
        "A container for storing a value or a reference to a value.": true,
        "A block of code that performs a specific task.": false,
        "A type of data structure that holds a collection of values.": false,
        "A set of instructions that are executed in a specific order.": false,
      },
    ),
    Quistons(
      textquestion: "What is an Intent in Android?",
      options: {
        "A messaging object that can be used to request an action from another app component.":
            true,
        "A class that is used to manage the lifecycle of an activity.": false,
        "A layout file that defines the user interface of an activity.": false,
        "A method that is used to handle user input in an activity.": false,
      },
    ),
    Quistons(
      textquestion: "What is a method in programming?",
      options: {
        "A block of code that performs a specific task.": true,
        "A type of data structure that holds a collection of values.": false,
        "A container for storing a value or a reference to a value.": false,
        "A set of instructions that are executed in a specific order.": false,
      },
    ),
    Quistons(
      textquestion: "What is a compiler?",
      options: {
        "A program that translates source code into machine code.": true,
        "A tool for storing and retrieving data in a structured way.": false,
        "A set of protocols and tools for building application software.":
            false,
        "A way to style and layout web pages using HTML and CSS.": false,
      },
    ),
    Quistons(
      textquestion: "What is an array?",
      options: {
        "A type of data structure that holds a collection of values.": true,
        "A container for storing a value or a reference to a value.": false,
        "A block of code that performs a specific task.": false,
        "A set of instructions that are executed in a specific order.": false,
      },
    ),
  ];

  String getRandomQuestion(index) {
    return mobileDevQuiz[index].textquestion;
  }

  String getQuestion(index) {
    return mobileDevQuiz[index].textquestion;
  }

  String getOption0(index) {
    return mobileDevQuiz[index].options.keys.elementAt(0);
  }

  String getOption1(index) {
    return mobileDevQuiz[index].options.keys.elementAt(1);
  }

  String getOption2(index) {
    return mobileDevQuiz[index].options.keys.elementAt(2);
  }

  String getOption3(index) {
    return mobileDevQuiz[index].options.keys.elementAt(3);
  }

  bool getOptionanswer0(index) {
    return mobileDevQuiz[index].options.values.elementAt(0);
  }

  bool getOptionanswer1(index) {
    return mobileDevQuiz[index].options.values.elementAt(1);
  }

  bool getOptionanswer2(index) {
    return mobileDevQuiz[index].options.values.elementAt(2);
  }

  bool getOptionanswer3(index) {
    return mobileDevQuiz[index].options.values.elementAt(3);
  }
}
