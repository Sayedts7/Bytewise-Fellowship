# Bytewise-Fellowship

# Flutter Widgets
Flutter is a mobile app development framework that uses widgets to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. In Flutter, a widget is a lightweight, immutable description of part of a user interface. Widgets can be combined to make complex, responsive UIs in a fast and scalable way.

This readme will introduce you to the basic concepts of Flutter widgets, including how to create and use them, and will provide examples to help you get started.

# What are Flutter Widgets?
In Flutter, everything is a widget, including the app itself, and each widget has its own properties and behavior. Widgets are the building blocks of a Flutter app's user interface. Widgets can be simple, like a text label or button, or complex, like a custom chart or graph.

In Flutter, widgets are divided into two types: stateful and stateless. Stateless widgets are those whose properties don't change during the lifetime of the widget, while stateful widgets have properties that can change, and can be redrawn as needed.

# Creating and Using Widgets
To create a new widget in Flutter, you create a new class that extends the StatelessWidget or StatefulWidget class, depending on whether you need to manage the state of the widget. The build method of the widget class describes how the widget should be drawn on the screen.

Here's an example of a simple stateless widget:
```dart
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  
  const MyWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
```

In this example, we've created a new widget called MyWidget that displays a text label. The title parameter is passed in when the widget is created, and is used to set the text of the label.

You can use this widget in your app like this:

```dart
import 'package:flutter/material.dart';
import 'package:myapp/widgets/my_widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyWidget(title: 'Hello, World!'),
        ),
      ),
    ),
  );
}
```
This code creates a new MaterialApp widget, which is the root of our app. The Scaffold widget provides a basic layout for our app, and the Center widget centers its child vertically and horizontally on the screen. In this case, the child is our MyWidget widget, with a title of 'Hello, World!'.

## Common Flutter Widgets
Flutter provides a wide variety of built-in widgets that you can use to build your app's user interface. Here are a few common widgets that you might find useful:

### Text
The Text widget displays a string of text on the screen.

``` dart Text('Hello, World!');
