import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_demo/route/cubit/counter_cubit.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      // body: BlocBuilder<CounterCubit, int>(
      //     buildWhen: (previous, current) => previous != current,
      //     builder: (context, count) {
      //   return Center(child: Text('$count'));
      // }),
      body: BlocSelector<CounterCubit, int, int>(
        bloc: context.read<CounterCubit>() ,
        selector: (state) {
          // return selected state based on the provided state.
          print('$state');
          return state;
        },
        builder: (context, state) {
          // return widget here based on the selected state.
          return Center(child: Text('$state'));
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
