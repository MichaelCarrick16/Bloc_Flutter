import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../list_user.dart';
import 'DetailRoute.dart';


class ListviewRoute extends StatefulWidget {
  const ListviewRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListviewState();
  }
}

class ListviewState extends State<ListviewRoute> {
  bool isSwitch = false;

  @override
  void initState() {
    super.initState();
  }

  onChangeSwitch(bool isSwitch) {
    setState(() {
      this.isSwitch = isSwitch;
    });
  }

  onChangeFollow(int index) {
    setState(() {
      if (users[index].isFollowedByMe) {
        users[index].isFollowedByMe = false;
      } else {
        users[index].isFollowedByMe = true;
      }
    });
  }

  deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            title: const Text('Junior Flutter'),
            centerTitle: true,
            backgroundColor: isSwitch ? Colors.blue : Colors.red,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh),
              ),
              Switch(
                  value: isSwitch,
                  activeColor: Colors.blue.shade200,
                  inactiveThumbColor: Colors.red.shade200,
                  inactiveTrackColor: Colors.red.shade200,
                  onChanged: (value) {
                    onChangeSwitch(value);
                  }),
            ],
          ),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    print(users[index].image);
                  },
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: [
                      IconSlideAction(
                        caption: 'Detail',
                        color: Colors.blue,
                        icon: Icons.arrow_circle_up,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailRoute()),
                        ),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () => print('Share : ' + users[index].name),
                      ),
                    ],
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.lightGreen.shade700,
                        icon: Icons.delete,
                        onTap: () => deleteUser(index),
                      ),
                    ],
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 85,
                          color: isSwitch
                              ? (index % 2 == 0
                              ? Colors.blue.shade200
                              : Colors.blue.shade600)
                              : (index % 2 == 0
                              ? Colors.red.shade200
                              : Colors.red.shade600),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(users[index].image),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(users[index].name,
                                      style: const TextStyle(color: Colors.white)),
                                  const SizedBox(height: 3),
                                  Text(users[index].username,
                                      style: TextStyle(color: Colors.grey.shade700))
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: users[index].isFollowedByMe
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade300,
                                    border:
                                    Border.all(color: Colors.grey.shade800)),
                                width: 100,
                                height: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    print('Follow : ' + users[index].image);
                                    onChangeFollow(index);
                                  },
                                  child: Center(
                                    child: users[index].isFollowedByMe
                                        ? const Text(
                                      'Unfollow',
                                      style: TextStyle(color: Colors.white),
                                    )
                                        : const Text('Follow',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ));
  }
}