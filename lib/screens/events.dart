import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  void initState() {
    super.initState();

    getData().then((value) => setState(() {
          date = value;
          an.add(date);
        }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  List an = [];
  String date;
  Map<dynamic, List> last;

  String daysName = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Consumer<ProvOne>(
        builder: (context, provone, child) => changeDay(provone.selectedDate));
  }

  changeDay(day) {
    return Consumer<ProvOne>(
      builder: (context, provone, child) => ListView.builder(
        itemCount: provone.sum,
        itemBuilder: (context, i) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: (Slidable(
                child: (provone.selectedDate == provone.dateOfTheTask[i])
                    ? provone.tasks(
                        provone.litems[i],
                        provone.desems[i],
                        provone.colors[i],
                        provone.chooseImage[i],
                        provone.dateOfTheTask[i],
                        provone.timeOfTask[i])
                    : Container(),
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                actions: [
                  IconSlideAction(
                    caption: 'Remove Task',
                    icon: Icons.restore_from_trash_outlined,
                    color: provone.colors[i],
                    onTap: () {
                      provone.removingFromSum();
                      provone.removeTasks(i);
                    },
                  )
                ],
              )),
            ),
          );
        },
      ),
    );
  }

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var date = prefs.getString('date');
    print(date);
    return date;
  }
}
