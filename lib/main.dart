import 'package:flutter/material.dart';
import 'package:listview_demo/route/BuildContextRoute.dart';
import 'package:listview_demo/route/InheritedRoute.dart';
import 'package:listview_demo/route/ListviewRoute.dart';
import 'package:listview_demo/route/StreamControllerRoute.dart';
import 'package:listview_demo/route/StreamRoute.dart';
import 'package:listview_demo/route/bloc/BlocRoute.dart';
import 'package:listview_demo/route/cubit/cubit_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 40,
                color: Colors.yellow,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListviewRoute()),
                      );
                    },
                    child: const Text(
                      'Listview',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InheritedRoute()),
                      );
                    },
                    child: const Text(
                      'Inherited',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.red,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuildContextRoute()),
                      );
                    },
                    child: const Text(
                      'BuildContext',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.tealAccent,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StreamRoute()),
                      );
                    },
                    child: const Text(
                      'Stream',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.blue,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StreamControllerRoute()),
                      );
                    },
                    child: const Text(
                      'Stream Controller',
                      style: TextStyle(color: Colors.black, fontSize: 10.5),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.deepPurple,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BlocRoute()),
                      );
                    },
                    child: const Text(
                      'Bloc Pattern',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.pink,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CounterApp()),
                      );
                    },
                    child: const Text(
                      'Cubit',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
