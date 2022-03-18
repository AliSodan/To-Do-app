import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CalendarPage.dart';
import '../main.dart';


import 'package:flutter/foundation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          color: Color(0xff4f5660),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<ProvOne>(
                    builder: (context, provone, child) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('${provone.profileImage}'))),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 40),
                    child: Text(
                      'E-mail',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    height: MediaQuery.of(context).size.height * 0.041,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5, left: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, left: 40),
                            child: Text(
                              'Birth Date',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 30),
                            height: MediaQuery.of(context).size.height * 0.041,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(width: 1, color: Colors.black),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 5, left: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, left: 25),
                            child: Text(
                              'Gender',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 9.6, left: 20, right: 25),
                            height: MediaQuery.of(context).size.height * 0.041,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(width: 1, color: Colors.black),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              items: ['Male', 'Female']
                                  .map((e) => DropdownMenuItem(
                                        child: Text('$e'),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    gender = val;
                                  },
                                );
                              },
                              value: gender,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 40),
                    child: Text(
                      'Contact Number',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    height: MediaQuery.of(context).size.height * 0.041,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5, left: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 70,
                right: 165,
                child: Container(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.grey[300], fontSize: 18),
                  ),
                ),
              ),
              Positioned(
                top: 90,
                right: 120,
                child: Consumer<ProvOne>(
                  builder: (context, provone, child) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('${provone.profileImage}')),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 250,
                right: 110,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.049,
                  width: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                      color: Color(0xfff37588),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey[300],
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: 315, left: 30, right: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarPage()));
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 45,
                right: 145,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xfff37588),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
