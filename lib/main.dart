import 'package:counter/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (BuildContext context) => MyHomePage(title: 'first screen'),
        '/second-screen': (BuildContext context) => const SecondScreen(),
      }
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const key = 'counter';

  @override
  void initState() {
    _initCounter();
    super.initState();
  }

  Future _initCounter() async {
    await _setValue();
  }

  Future _setValue() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, 'Какое-то значение');
  }

  Future<String> _getValue() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? 'Значение недоступно';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                print(await _getValue());
              },
              child: const Text('Получить значение'),
            ),
            ElevatedButton(
              onPressed: () => _setValue(),
              child: const Text('Записать значение'),
            ),

            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/second-screen'), child: const Text('Перейти')),
          ],
        ),
      ),
    );
  }
}
