import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.lightBlueAccent.shade100,

          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _topbar(),
              SizedBox(
                height: 30,
              ),
              _headingText(),
              SizedBox(
                height: 60,
              ),
              _buttonView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topbar() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                color: Colors.white70,
                textColor: Colors.black,
                child: Icon(
                  Icons.android,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white70,
                textColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headingText() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Text(
        "Get your requirements matched and safe life",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buttonView() {
    double c_width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/doctor_image.png", height: 400),
          Column(
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: Text(
                    "Donate",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/selectscreen"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: Text("Receive"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/selectscreen"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
