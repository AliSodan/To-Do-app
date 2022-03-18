import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'screens/OnBoardPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return ProvOne();
        },
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
        ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(microseconds: 10), changingSpValue);
    Timer(Duration(seconds: 2), addingOpacity);
    Timer(
        Duration(
          milliseconds: 2300,
        ),
        onBoard);
    super.initState();
  }

  String sp = 'close';
  String initOpacity = 'close';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          height: (sp == 'open')
              ? MediaQuery.of(context).size.height * 0.5
              : MediaQuery.of(context).size.height * 0.1,
          width: (sp == 'open')
              ? MediaQuery.of(context).size.width * 1
              : MediaQuery.of(context).size.width * 0.2,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/t.png'),
            ),
          ),
          child: (initOpacity == 'open')
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Powered by',
                      style: TextStyle(
                        fontSize: 10,
                        shadows: [
                          Shadow(color: Colors.grey, offset: Offset(1, 1)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Ali Sodan',
                      style: TextStyle(
                        fontSize: 18,
                        shadows: [
                          Shadow(color: Colors.grey, offset: Offset(1, 1)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  onBoard() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardPage()));
  }

  changingSpValue() {
    setState(() {
      sp = 'open';
    });
  }

  addingOpacity() {
    setState(() {
      initOpacity = 'open';
    });
  }
}

class ProvOne with ChangeNotifier {
  int sum = 0;
  dynamic daysName = DateFormat('yyyy-MM-dd').format(DateTime.now());
  dynamic selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Image selectedImage = Image(image: AssetImage('assets/images/3.png'));
  List<Image> chooseImage = [];
  List<Color> colors = [];
  List<String> litems = [];
  List<String> dateOfTheTask = [];
  List timeOfTask = [];

  Color selectedColor = Colors.blue;
  List<String> desems = [];
  dynamic profileImage = 'assets/images/prof.jpg';
  TextEditingController myController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController beginningController = TextEditingController();

  addingToSum() {
    sum++;
    notifyListeners();
  }

  removingFromSum() {
    sum--;
    notifyListeners();
  }

  addingToLitems() {
    litems.add(myController.text);
    notifyListeners();
  }

  addingToDesems() {
    desems.add(desController.text);
    notifyListeners();
  }

  removeTasks(int i) {
    litems.removeAt(i);
    desems.removeAt(i);
    colors.removeAt(i);
    chooseImage.removeAt(i);
    notifyListeners();
  }

  Stack tasks(
    php,
    des,
    col,
    Image photo,
    time,
    taskTime,
  ) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 20,
          ),
          child: Consumer<ProvOne>(
            builder: (context, provone, child) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.11,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.grey[300]),
                          child: Center(
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.045,
                              width: MediaQuery.of(context).size.width * 0.095,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: col),
                              child: Center(
                                child: Text(
                                  taskTime[0] + taskTime[1],
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28, left: 15),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: SingleChildScrollView(
                              child: Text(
                                php,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 23, left: 10),
                            child: Container(
                              margin: EdgeInsets.only(left: 30),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                des,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'desfo',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: col,
                    gradient: LinearGradient(
                      colors: [col[300], col[400], col[500], col[600]],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.9), blurRadius: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          right: -10,
          top: -25,
          child: Container(
            height: 75,
            child: photo,
          ),
        ),
      ],
    );
  }
}
