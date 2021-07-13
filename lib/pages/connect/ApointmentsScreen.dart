import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';

import 'SelectScreen.dart';

class Person {
  final String name, time;
  final bool isConfirmed;

  Person(this.name, this.time, this.isConfirmed);
}

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  static List<Person> people = [
    Person('Navjyot Singh', '12:00 am', true),
    Person('Muskan', '10:00 am', false),
    Person('Somya', '11:00 am', false),
    Person('Hello', '9:00 am', true),
    Person('Test Name', '8:00 am', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        appBar: AppBar(
          title: Text("Your Appointments"),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text(person.time),
              trailing: person.isConfirmed
                  ? Text(
                      "Booking Confirmed",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text("Booking Not Confirmed",
                      style: TextStyle(color: Colors.red)),
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
