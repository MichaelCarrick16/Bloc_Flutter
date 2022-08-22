import 'package:flutter/material.dart';
import 'package:listview_demo/route/bloc/remote_bloc.dart';
import 'package:listview_demo/route/bloc/remote_event.dart';
import 'package:listview_demo/route/bloc/remote_state.dart';

class BlocRoute extends StatefulWidget {
  const BlocRoute({Key? key}) : super(key: key);

  @override
  _BlocRouteState createState() => _BlocRouteState();
}

class _BlocRouteState extends State<BlocRoute> {
  final bloc = RemoteBloc(); // khởi tạo bloc  <=== new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<RemoteState>(
          // sử dụng StreamBuilder để lắng nghe Stream <=== new
          stream: bloc.stateController.stream,
          // truyền stream của stateController vào để lắng nghe <=== new
          initialData: bloc.state,
          // giá trị khởi tạo chính là volume 70 hiện tại <=== new
          builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
            return Text(
                'Âm lượng hiện tại: ${snapshot.data?.volume}'); // update UI <=== new
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(IncrementEvent(5)),
            // add event <=== new
            child: const Icon(Icons.volume_up),
          ),
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(DecrementEvent(10)),
            // add event <=== new
            child: const Icon(Icons.volume_down),
          ),
          FloatingActionButton(
            onPressed: () => bloc.eventController.sink.add(MuteEvent()),
            // add event <=== new
            child: const Icon(Icons.volume_mute),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose(); // dispose bloc <=== new
  }
}
