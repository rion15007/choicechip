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
  final _choices = ["M1", "M2", "M3", "M4", "M5", "M6"];
  final _icon = [
    const Icon(Icons.ac_unit),
    const Icon(Icons.access_alarm_sharp),
    const Icon(Icons.zoom_in),
    const Icon(Icons.school_outlined),
    const Icon(Icons.radio),
    const Icon(Icons.air_rounded),
  ];

  var _choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _choices.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ChoiceChip(
                        label: Text(_choices[index]),
                        avatar: _icon[index],
                        selected: _choiceIndex == index,
                        selectedColor: Colors.red,
                        onSelected: (bool selected) {
                          setState(() {
                            _choiceIndex = index;
                          });
                        },
                        backgroundColor: Colors.green,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: Wrap(
              children: _choiceList, // 代入
            ),
          ),
        ],
      ),
    );
  }

  String selectedChoice = "";
  var listxxx = [
    'memory1',
    'memory2',
    'memory3',
    'memory4',
    'memory5',
    'memory6',
  ];

  List<Widget> get _choiceList {
    List<Widget> choices = [];
    for (var item in listxxx) {
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
