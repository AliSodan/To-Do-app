import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo_application/screens/events.dart';
import 'edit_on_dep/Calendar.dart';
import 'EditProfile.dart';
import 'FirstTask.dart';
import 'package:provider/provider.dart';
import 'MyTask.dart';
import 'OnBoardPage.dart';
import '../main.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String open = 'close';
  double _opacity = 0.0;
  @override
  DateTime today = DateTime.now();

  var months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 45, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoardPage()));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Today`s Task',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()));
                      },
                      child: Consumer<ProvOne>(
                        builder: (context, provone, child) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.054,
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('${provone.profileImage}'),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                border: Border.all(width: 1)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 15),
                        child: Row(
                          children: [
                            Text(
                              months[today.month - 1] +
                                  ', ' +
                                  DateTime.now().day.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Consumer<ProvOne>(
                          builder: (context, provone, child) {
                            return Text(
                              '${provone.sum} Tasks today',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyTask()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Color(0xfff9ad51)),
                      child: Center(
                        child: Text(
                          'On Going',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Consumer<ProvOne>(
                    builder: (context, provone, child) =>
                        AnimatedHorizontalCalendar(
                            tableCalenderIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            date: DateTime.now(),
                            textColor: Colors.black45,
                            backgroundColor: Colors.white,
                            tableCalenderThemeData: ThemeData.light().copyWith(
                              primaryColor: Colors.green,
                              accentColor: Colors.red,
                              colorScheme:
                                  ColorScheme.light(primary: Colors.green),
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            selectedColor: Color(0xfff9ad51),
                            tableCalenderButtonColor: Color(0xfff9ad51),
                            onDateSelected: (date) {
                              setState(() {
                                provone.selectedDate = date;
                              });
                            }),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0704,
              ),
              Consumer<ProvOne>(
                builder: (context, provone, child) => Container(
                  height: MediaQuery.of(context).size.height * 0.501,
                  width: MediaQuery.of(context).size.width,
                  child: Events(),
                ),
              ),
            ],
          ),
          Consumer<ProvOne>(
            builder: (context, provone, child) {
              return Positioned(
                bottom: 30,
                left: 80,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstTask()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Color(0xfff9ad51),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'add a new task',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * 1,
                width: open == 'close'
                    ? MediaQuery.of(context).size.width * 0.005
                    : MediaQuery.of(context).size.width * 0.6,
                color: Color(0xfff9ad51),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: _opacity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/ali.jpg'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25, right: 25),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            'Flutter developer:\nAli Sodan',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25, right: 25),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            'FaceBook Account:\nAli Sodan',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25, right: 25),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            'WhatsApp Account:\n+963930835960',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25, right: 25),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            'GitHup account:\nAli Sodan',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: openAnimatedContainer,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.08,
                  decoration: BoxDecoration(
                    color: Color(0xfff9ad51),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  openAnimatedContainer() {
    if (open == 'close') {
      setState(() {
        open = 'open';
        _opacity = 1;
      });
    } else if (open == 'open') {
      setState(() {
        open = 'close';
        _opacity = 0.0;
      });
    }
  }
}
