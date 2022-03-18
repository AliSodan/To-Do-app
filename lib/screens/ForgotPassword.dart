import 'package:flutter/material.dart';
import 'LoginPage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/key.png'),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Reset your password',
                    style: TextStyle(fontSize: 30),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'We have sent a code to your Email adress , check your email and enter the code to reset your password',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the Code',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Center(
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.deepPurple),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 0),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'The Code isn`t sent ?',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Center(
                  child: Text(
                    'Resend',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.deepPurple),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
