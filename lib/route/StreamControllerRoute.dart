import 'dart:async';

import 'package:flutter/material.dart';

class StreamControllerRoute extends StatelessWidget {
  const StreamControllerRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HandleStreamController(),
    );
  }
}

class HandleStreamController extends StatelessWidget {
  const HandleStreamController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.pink,
          onPressed: () async {
            var streamController = StreamController();

            // lắng nghe
            streamController.stream.listen(print);

            // push events
            streamController.sink.add('Tui là Minh');
            streamController.sink.add(100);

            // Khi không cần sử dụng controller này nữa thì nên close controller
            await Future.delayed(
                const Duration(seconds: 2)); // sau 2 giây ta sẽ close controller
            await streamController.close();
            // Nếu thêm streamController.sink.add(200) ở dưới sẽ bị crash do streamController đã close rồi
            // streamController.sink.add(200);

          },
          child: const Text('Show StreamController Console'),
        ),
      ),
    );
  }
}
