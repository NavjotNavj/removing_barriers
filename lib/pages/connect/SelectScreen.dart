import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';
import 'package:removing_barriers/pages/connect/ApointmentAvailableScreen.dart';
import 'package:removing_barriers/pages/connect/ApointmentListForDoctor.dart';
import 'package:removing_barriers/pages/connect/ApointmentsScreen.dart';
import 'package:search_page/search_page.dart';

class Person {
  final String name, profession;
  final num age;

  Person(this.name, this.profession, this.age);
}

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  static List<Person> people = [
    Person('Navjyot Singh', 'Surgeon', 64),
    Person('Muskan', 'Cardiologist', 30),
    Person('Somya', 'Bekar doctor', 55),
    Person('Hello', 'Physician', 67),
    Person('Test Name', 'ENT Specialist', 39),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,

        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text(person.profession),
              trailing: Text('${person.age} yo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentAvailableScreen()),
                );
              },
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentListDoctor()),
                );
              },
              child: Icon(Icons.timer_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentsScreen()),
                );
              },
              child: Icon(Icons.timer_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              tooltip: 'Search people',
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Person>(
                  onQueryUpdate: (s) => print(s),
                  items: people,
                  searchLabel: 'Search people',
                  suggestion: Center(
                    child: Text('Filter people by name, surname or age'),
                  ),
                  failure: Center(
                    child: Text('No person found :('),
                  ),
                  filter: (person) => [
                    person.name,
                    person.profession,
                    person.age.toString(),
                  ],
                  builder: (person) => ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.profession),
                    trailing: Text('${person.age} yo'),
                  ),
                ),
              ),
              child: Icon(Icons.search),
            ),
          ],
        ),

        // body: Container(
        //
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       SizedBox(
        //         height: 30,
        //       ),
        //       _headingText(),
        //       SizedBox(
        //         height: 60,
        //       ),
        //       _buttonView(),
        //     ],
        //   ),
        // ),
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
