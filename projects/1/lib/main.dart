import 'package:flutter/material.dart';
import 'person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'My very first Flutter project'),
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
  final Person _person = Person(firstName: 'Anna', lastName: 'Kuts');

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Привіт, ${_person.fullName}!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'Імʼя',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Прізвище',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _person.firstName = _firstNameController.text;
                    _person.lastName = _lastNameController.text;
                  });
                },
                child: const Text('Застосувати'),
              ),
            ),
            const Text('Сьогодні ти полаявся стільки разів:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
