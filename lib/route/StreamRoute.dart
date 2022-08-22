import 'package:flutter/material.dart';

class StreamRoute extends StatelessWidget {
  const StreamRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HandleStream(),
    );
  }
}

class HandleStream extends StatelessWidget {
  const HandleStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.pink,
          onPressed: () async {
            var subscription =
                Stream.periodic(const Duration(seconds: 1), (int i) {
              if (i == 5) {
                throw Exception('lỗi');
              }
              if (i % 2 == 0) {
                return '$i là số chẵn';
              } else {
                return '$i là số lẻ';
              }
            }).listen(print, onError: print, onDone: () => print('Done!'));

            // Sau 3 giây kể từ lúc run chương trình ta sẽ pause stream
            await Future.delayed(const Duration(seconds: 3), () {
              print('pause stream');
              subscription.pause();
            });

            // Sau 2 giây kể từ lúc pause stream ta sẽ resume stream
            await Future.delayed(const Duration(seconds: 2), () {
              print('resume stream');
              subscription.resume();
            });

            // Sau 3 giây kể từ lúc resume stream ta sẽ cancel stream
            await Future.delayed(const Duration(seconds: 3), () {
              print('cancel stream');
              subscription.cancel();
            });
          },
          child: const Text('Show Stream Console'),
        ),
      ),
    );
  }
}
