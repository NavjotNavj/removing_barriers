import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';

import 'ApointmentAvailableScreen.dart';
class Person {
  final String name, time;

  Person(this.name, this.time);
}
class AppointmentListDoctor extends StatefulWidget {
  const AppointmentListDoctor({Key? key}) : super(key: key);

  @override
  _AppointmentListDoctorState createState() => _AppointmentListDoctorState();
}

class _AppointmentListDoctorState extends State<AppointmentListDoctor> {
  static List<Person> people = [
    Person('Navjyot Singh', '12:00 am'),
    Person('Muskan', '10:00 am'),
    Person('Somya', '11:00 am'),
    Person('Saurabh', '9:00 am'),
    Person('Jaswinder', '8:00 am'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        appBar: AppBar(
          title: Text("Appointment Enquiries"),
        ),

        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text(person.time),
              trailing: Column(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Accept",
                        style: TextStyle(color: Colors.white,fontSize: 10),
                      ),
                      color: Colors.green.shade600,
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Reject",
                        style: TextStyle(color: Colors.white,fontSize: 10),
                      ),
                      color: Colors.red.shade600,
                    ),
                  ),
                ],
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
