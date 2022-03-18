import 'package:flutter/material.dart';
import 'LoginPage.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  PageController pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: pageController,
                    children: [
                      page('1', 'Manage your Tasks'),
                      page('2', 'Manage your time'),
                      page('3', 'Always be successful'),
                    ],
                    onPageChanged: (value) => {setCurrentPage(value)},
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffa994f4),
                    Color(0xffa390fa),
                    Color(0xffa08cfd),
                    Color(0xff8e79fb)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.43,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(3, (index) => getIndicator(index))),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 131,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Color(0xfffafafa),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.09,
            left: MediaQuery.of(context).size.width * 0.372,
            child: Center(
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.all(
                    Radius.circular(70),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.398,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfff4598a),
                        Color(0xfff6608e),
                        Color(0xfffc83a7)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: Text(
                    '➔',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column page(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$img.png'),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 35),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Organize all your tasks in lists and projects, Color them to add priorities and categories',
          style: TextStyle(color: Colors.grey, fontSize: 17),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == pageNo)
            ? Colors.black
            : Colors.white.withOpacity(0.5),
      ),
    );
  }

  setCurrentPage(int value) {
    setState(() {
      (currentPage == value) ? currentPage++ : currentPage = value;
    });
  }
}
