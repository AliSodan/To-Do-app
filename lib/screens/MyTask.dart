import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'EditProfile.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class MyTask extends StatefulWidget {
  const MyTask({Key key}) : super(key: key);

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  DateTime today = DateTime.now();
  var months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<String> progress = [];
  bool s25 = false;
  bool s50 = false;
  bool s75 = false;
  bool s100 = false;
  String val;
  String edit = 'close';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(
                    left: 28,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      Container(
                          child: Text(
                        months[today.month - 1] +
                            ', ' +
                            DateTime.now().day.toString() +
                            ', ' +
                            DateTime.now().year.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.31,
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
                              height:
                                  MediaQuery.of(context).size.height * 0.054,
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('${provone.profileImage}'),
                                  )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    'My Task',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.44,
                    margin: EdgeInsets.only(left: 25),
                    child: Consumer<ProvOne>(
                      builder: (context, provone, child) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 20),
                          itemCount: provone.litems.length,
                          padding: EdgeInsets.all(20),
                          itemBuilder: (context, index) {
                            return index > provone.litems.length ||
                                    index > provone.chooseImage.length ||
                                    index > provone.desems.length ||
                                    index > provone.colors.length ||
                                    index > provone.dateOfTheTask.length
                                ? Container()
                                : firstRow(
                                    provone.litems[index],
                                    provone.chooseImage[index],
                                    provone.colors[index],
                                  );
                          },
                        );
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        'On Going',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Stack(overflow: Overflow.visible, children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Consumer<ProvOne>(
                            builder: (context, provone, child) => Container(
                              margin: EdgeInsets.only(left: 12),
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.296,
                                child: ListView.builder(
                                  itemCount: provone.litems.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return RadioListTile(
                                        title: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: edit == 'close'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.13
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.11,
                                                child: Text(
                                                  provone.litems[i],
                                                  style:
                                                      TextStyle(fontSize: 24),
                                                ),
                                              ),
                                              (provone.litems[i] == val &&
                                                      edit == 'close')
                                                  ? IconButton(
                                                      onPressed:
                                                          openEditingPage,
                                                      icon: Icon(Icons.edit))
                                                  : Container(),
                                              (edit == 'open' &&
                                                      provone.litems[i] == val)
                                                  ? Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.24,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.32,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 15),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 1,
                                                                      left: 20),
                                                              child: Text(
                                                                'your progress is:',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.1,
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                children: [
                                                                  CheckboxListTile(
                                                                      title: Text(
                                                                          '25 %'),
                                                                      value:
                                                                          s25,
                                                                      onChanged:
                                                                          (val) {
                                                                        setState(
                                                                            () {
                                                                          s25 =
                                                                              val;
                                                                          s50 =
                                                                              false;
                                                                          s75 =
                                                                              false;
                                                                          s100 =
                                                                              false;
                                                                        });
                                                                      }),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        '50 %'),
                                                                    value: s50,
                                                                    onChanged:
                                                                        (sal) {
                                                                      setState(
                                                                          () {
                                                                        s50 =
                                                                            sal;
                                                                        s25 =
                                                                            false;
                                                                        s75 =
                                                                            false;
                                                                        s100 =
                                                                            false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        '75 %'),
                                                                    value: s75,
                                                                    onChanged:
                                                                        (dal) {
                                                                      setState(
                                                                          () {
                                                                        s75 =
                                                                            dal;
                                                                        s25 =
                                                                            false;
                                                                        s50 =
                                                                            false;
                                                                        s100 =
                                                                            false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        '100 %'),
                                                                    value: s100,
                                                                    onChanged:
                                                                        (zal) {
                                                                      setState(
                                                                        () {
                                                                          s100 =
                                                                              zal;
                                                                          s25 =
                                                                              false;
                                                                          s50 =
                                                                              false;
                                                                          s75 =
                                                                              false;
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed:
                                                                closeEditingPage,
                                                            child:
                                                                Text('Confirm'),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                width: edit == 'close'
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.3
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.00,
                                              ),
                                              (provone.litems[i] == val)
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          right: 30, top: 5),
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: edit == 'close'
                                                            ? 50
                                                            : 120,
                                                        lineWidth:
                                                            edit == "close"
                                                                ? 8
                                                                : 20,
                                                        animation: true,
                                                        animationDuration: 1500,
                                                        percent: s25 == true
                                                            ? 25 / 100
                                                            : s50 == true
                                                                ? 50 / 100
                                                                : s75 == true
                                                                    ? 75 / 100
                                                                    : s100 ==
                                                                            true
                                                                        ? 100 /
                                                                            100
                                                                        : 0 /
                                                                            100,
                                                        center: s25 == true
                                                            ? Text('25 %')
                                                            : s50 == true
                                                                ? Text('50 %')
                                                                : s75 == true
                                                                    ? Text(
                                                                        '75 %')
                                                                    : s100 ==
                                                                            true
                                                                        ? Text(
                                                                            '100 %')
                                                                        : Text(
                                                                            '??'),
                                                        progressColor:
                                                            provone.colors[i],
                                                        circularStrokeCap:
                                                            CircularStrokeCap
                                                                .round,
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        value: provone.litems[i],
                                        groupValue: val,
                                        onChanged: (newVal) {
                                          setState(() {
                                            val = newVal;
                                          });
                                        });
                                  },
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  openEditingPage() {
    setState(() {
      edit = 'open';
    });
  }

  closeEditingPage() {
    setState(() {
      edit = 'close';
    });
  }

  firstRow(firstTitle, photo1, col) {
    return Consumer<ProvOne>(
      builder: (context, provone, child) {
        return Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.35,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: col,
                gradient: LinearGradient(
                    colors: [col[300], col[400], col[500], col[600]],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                boxShadow: [
                  BoxShadow(color: col.withOpacity(0.5), blurRadius: 20),
                ],
              ),
              child: Center(
                child: Text(
                  firstTitle,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Positioned(
              top: -20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                child: photo1,
              ),
            ),
          ],
        );
      },
    );
  }
}
