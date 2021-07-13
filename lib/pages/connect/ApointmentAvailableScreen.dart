import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';
import 'package:search_page/search_page.dart';

import 'ApointmentsScreen.dart';
import 'SelectScreen.dart';

// class Appointment {
//   final String name, time;
//
//   Appointment(this.name, this.time);
// }

class Person {
  final String name, time;

  Person(this.name, this.time);
}

class AppointmentAvailableScreen extends StatefulWidget {
  const AppointmentAvailableScreen({Key? key}) : super(key: key);

  @override
  _AppointmentAvailableScreenState createState() =>
      _AppointmentAvailableScreenState();
}

class _AppointmentAvailableScreenState
    extends State<AppointmentAvailableScreen> {
  static List<Person> people = [
    Person('Navjyot Singh', '12:00 am'),
    Person('Muskan', '10:00 am'),
    Person('Somya', '11:00 am'),
    Person('Hello', '9:00 am'),
    Person('Test Name', '8:00 am'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        appBar: AppBar(
          title: Text("Appointment Availability"),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text(person.time),
              trailing: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Book Appointment",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AppointmentAvailableScreen()),
                // );
              },
            );
          },
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



}

//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: ColorConstants.BACKGROUND,
//       body: Container(
//         height: 600,
//         child: ListView.builder(
//           itemCount: people.length,
//           itemBuilder: (context, index) {
//             final Appointment person = people[index];
//             return ListTile(
//               title: Text(person.name),
//               subtitle: Text(person.time),
//               trailing: Row(
//                 children: [
//                   MaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Book Appointment",
//                     ),
//                     color: Colors.blueAccent,
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     ));
//   }
// }
