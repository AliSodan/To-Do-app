import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CalendarPage.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({Key key}) : super(key: key);
  @override
  _FirstTaskState createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  TextEditingController dateinput = TextEditingController();
  dynamic day;
  TextEditingController timeinput = TextEditingController();
  Map<dynamic, dynamic> last = {};
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String taskPop = 'close';
  String taskImagePop = 'close';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: Color(0xff4375ff),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            margin: EdgeInsets.only(left: 35),
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image(
                              image: AssetImage('assets/images/crea.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            'Create a new task',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 8.0, right: 25),
                          child: Consumer<ProvOne>(
                              builder: (context, provone, child) {
                            return TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: provone.myController,
                              decoration: InputDecoration(
                                  hintText: 'Title',
                                  hintStyle: TextStyle(color: Colors.white)),
                            );
                          }),
                        ),
                        Consumer<ProvOne>(
                          builder: (context, provone, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 25),
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                controller: provone.desController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    labelText: 'add a Description',
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                            );
                          },
                        ),
                        Consumer<ProvOne>(
                          builder: (context, provone, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 25),
                              child: TextField(
                                  controller: dateinput,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today),
                                    labelText: "Enter Date",
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        dateinput.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  }),
                            );
                          },
                        ),
                        Consumer<ProvOne>(
                          builder: (context, provone, child) => Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 20),
                            child: TextField(
                              controller: timeinput,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.timer),
                                  labelText: "Enter Time"),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime.format(context));
                                  DateTime parsedTime = DateFormat.jm().parse(
                                      pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    timeinput.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: openTaskImagePop,
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Center(
                                  child: Text(
                                    'Choose an image ▼',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: openTaskPop,
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Center(
                                  child: Text(
                                    'Choose Color ▼',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Consumer<ProvOne>(
                          builder: (context, provone, child) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                    color: Colors.transparent,
                                    child: provone.selectedImage,
                                  ),
                                  Consumer<ProvOne>(
                                    builder: (context, provone, child) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            color: provone.selectedColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            border: Border.all(
                                                color: Colors.white)),
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<ProvOne>(builder: (context, provone, child) {
                      return InkWell(
                        onTap: () {
                          provone.addingToSum();
                          (provone.myController.text != null)
                              ? provone.addingToLitems()
                              : provone.myController.text = 'unNamed';
                          //provone.litems.add('unNamed');
                          (provone.desController.text != null)
                              ? provone.addingToDesems()
                              : provone.desController.text =
                                  'No description availiable';
                          (dateinput.text != null)
                              ? provone.dateOfTheTask.add(dateinput.text)
                              : provone.dateOfTheTask.add(provone.selectedDate);
                          provone.timeOfTask.add(timeinput.text);
                          provone.chooseImage.add(provone.selectedImage);
                          provone.colors.add(provone.selectedColor);
                          (provone.myController).clear();
                          (provone.desController).clear();
                          setData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalendarPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.19,
                          child: Center(
                              child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                          decoration: BoxDecoration(
                              color: Color(0xff4375ff),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            Container(
              child: (taskPop == 'open')
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: InkWell(
                          onTap: closeTaskPop(),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: SingleChildScrollView(
                                  child: Consumer<ProvOne>(
                                builder: (context, provone, child) {
                                  return Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor = Colors.blue;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.blue)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor = Colors.red;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.red)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor =
                                                Colors.green;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.green)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor = Colors.pink;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.pink)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor =
                                                Colors.purple;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.purple)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor =
                                                Colors.yellow;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.yellow)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedColor =
                                                Colors.orange;

                                            closeTaskPop();
                                          },
                                          child: addColors(Colors.orange))
                                    ],
                                  );
                                },
                              ))),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Container(
              child: (taskImagePop == 'open')
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: InkWell(
                          onTap: closeTaskImagePop(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey,
                            ),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: SingleChildScrollView(
                              child: Consumer<ProvOne>(
                                builder: (context, provone, child) {
                                  return Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                                image: AssetImage(
                                                    'assets/images/work2.png'));

                                            closeTaskImagePop();
                                          },
                                          child: addImage('work2')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/exercise.png'),
                                            );
                                            closeTaskImagePop();
                                          },
                                          child: addImage('exercise')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/sport.png'),
                                            );
                                            closeTaskImagePop();
                                          },
                                          child: addImage('sport')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/hearts.png'),
                                            );

                                            closeTaskImagePop();
                                          },
                                          child: addImage('hearts')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/cake.png'),
                                            );

                                            closeTaskImagePop();
                                          },
                                          child: addImage('cake')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/class.png'),
                                            );

                                            closeTaskImagePop();
                                          },
                                          child: addImage('class')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                              image: AssetImage(
                                                  'assets/images/reading.png'),
                                            );

                                            closeTaskImagePop();
                                          },
                                          child: addImage('reading')),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            provone.selectedImage = Image(
                                                image: AssetImage(
                                                    'assets/images/meeting.png'));

                                            closeTaskImagePop();
                                          },
                                          child: addImage('meeting')),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  Container addColors(Color color) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  openTaskPop() {
    setState(() {
      taskPop = 'open';
    });
  }

  closeTaskPop() {
    setState(() {
      taskPop = 'close';
    });
  }

  openTaskImagePop() {
    setState(() {
      taskImagePop = 'open';
    });
  }

  closeTaskImagePop() {
    setState(() {
      taskImagePop = 'close';
    });
  }

  Container addImage(String img) {
    return Container(
      child: Image(
        image: AssetImage('assets/images/$img.png'),
      ),
    );
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('date', dateinput.text);
    print(day);
  }
}
