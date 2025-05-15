import 'package:flutter/material.dart';
import 'package:flutter_payment_demo/models/dog.dart';

import 'models/database/database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    try {
      print("Increment called!");
      final fido = Dog(name: 'Fido ${_counter + 1}', age: _counter + 1);
      await DatabaseHelper.instance.insertDog(fido);
      setState(() {
        _counter++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dog added successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding dog: $e')),
      );
    }
  }

  void _decrement() async {
    try {
      print("Decrement called!");
      final dogs = await DatabaseHelper.instance.getDogs();
      print(dogs);
      setState(() {
        if (_counter > 0) _counter--;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Found ${dogs.length} dogs')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching dogs: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),

              FloatingActionButton(
                onPressed: _decrement,
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
