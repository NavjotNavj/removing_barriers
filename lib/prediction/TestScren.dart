import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';
import 'package:removing_barriers/prediction/pneumoniaInput.dart';

import 'brainTumour.dart';
import 'covidInput.dart';
import 'diabetesInput.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 100,
                  child: WavyAnimatedTextKit(
                    textStyle: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    text: ["Health is wealth"],
                    isRepeatingAnimation: true,
                    speed: Duration(milliseconds: 150),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 100,
                  child: Image.network(
                      "https://media.baamboozle.com/uploads/images/140571/1616762928_292417_gif-url.gif"),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Provide Test Details for any of the following Diseases",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 550,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 2,
                    childAspectRatio: (3 / 4),
                    crossAxisCount: 2,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CovidInput()));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(children: [
                              Image.asset("assets/images/covid_virus.png"),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Covid",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiabetesInput()));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(children: [
                              Image.asset("assets/images/diabetes_meter.png"),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Diabetes",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PneumoniaInput()));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(children: [
                              Image.asset("assets/images/pneumonia.png"),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Pneumonia",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TumourInput()));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(children: [
                              Image.asset("assets/images/brain.png"),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Brain Tumour",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ),
                      ),
                      // RaisedButton(
                      //     color: Colors.blue,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: Text(
                      //       "Covid",
                      //       style: TextStyle(fontSize: 24, color: Colors.white),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => CovidInput()));
                      //     }),
                      // RaisedButton(
                      //     color: Colors.blue,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: Text(
                      //       "Diabetes",
                      //       style: TextStyle(fontSize: 24, color: Colors.white),
                      //     ),
                      //     onPressed: () {
                      //
                      //     }),
                      // RaisedButton(
                      //     color: Colors.blue,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: Text(
                      //       "Pneumonia",
                      //       style: TextStyle(fontSize: 24, color: Colors.white),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => PneumoniaInput()));
                      //     }),
                      // RaisedButton(
                      //     color: Colors.blue,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: Text(
                      //       "Brain Tumour",
                      //       style: TextStyle(fontSize: 24, color: Colors.white),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => TumourInput()));
                      //     }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
