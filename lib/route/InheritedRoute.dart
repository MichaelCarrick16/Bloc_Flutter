import 'package:flutter/material.dart';

class InheritedRoute extends StatefulWidget {
  @override
  InheritedRouteState createState() => InheritedRouteState();
}

class InheritedRouteState extends State<InheritedRoute> {
  int counter = 0; // Data của Widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // data là biến counter
        // StatelessWidget MyText nhận data qua constructor
        // child: MyText(counter: counter),
        child: MyInheritedWidget(
            data: counter, child: MyCenterWidget(counter: counter)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      // tiếp tục truyền data từ widget MyCenterWidget xuống MyText
      child: MyText(counter: counter),
    );
  }
}

class MyText extends StatelessWidget {
  // constructor để nhận data từ widget cha
  MyText({required this.counter});

  // data nhận được từ widget cha được lưu trữ trong biến này
  final int counter;

  @override
  Widget build(BuildContext context) {
    // data nhận được sẽ update UI
    return Text(
        'Tui là widget Text. Data của tui hiện tại là: ${MyInheritedWidget.of(context)!.data}');
  }
}

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({required super.child, required this.data});

final int data;

@override
bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  return false;
}

static MyInheritedWidget? of(BuildContext context) {
return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}
}