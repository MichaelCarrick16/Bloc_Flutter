import 'package:flutter/material.dart';

class BuildContextRoute extends StatelessWidget {
  const BuildContextRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShowSnackBar(),
    );
  }
}

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.pink,
          onPressed: () {
            // xử lý show snackbar khi click
            const snackBar = SnackBar(
                content: Text(
                    'Đọc thật kĩ bài BuildContext để hiểu về nó nhé =)))')
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}
