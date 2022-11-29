import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  bool fly = false;
  @override
  Widget build(BuildContext context) {

    //moving icon to the top
    AnimatedAlign animatedAlign= AnimatedAlign(
      alignment: fly ? Alignment.topCenter : Alignment.bottomCenter,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      onEnd: () {
        if (fly) {
          setState(() {
            fly = false;
          });
        }
      },
      child: const Icon(Icons.flight),
    );


    Container container = Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 500.0,
              height: 500.0,
              color: Colors.white,
              child: animatedAlign,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fly = !fly;
                });
              },
              child: const Text('go'),
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('myapp')),
        body: Center(
          child: container,
        ),
      ),
    );
  }
}