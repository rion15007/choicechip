import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers',
      theme: ThemeData(
        fontFamily: 'Arial',
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
      ),
      home: const Chipselect(),
    );
  }
}

class Chipselect extends StatefulWidget {
  const Chipselect({Key? key}) : super(key: key);

  @override
  _ChipselectState createState() => _ChipselectState();
}

class _ChipselectState extends State<Chipselect> {
  String selectedChoice = "";
  final List<String> strings = [
    'memory1',
    'memory2',
    'memory3',
    'memory4',
    'memory5',
    'memory6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: _choiceList, // 代入
        ),
      ),
    );
  }

  List<Widget> get _choiceList {
    List<Widget> choices = [];
    for (var item in strings) {
      choices.add(Container(
        padding: const EdgeInsets.all(30.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoice == item, // 判定
          onSelected: (selected) {
            setState(() {
              selectedChoice = item; // 代入
            });
          },
        ),
      ));
    }
    return choices;
  }
}
