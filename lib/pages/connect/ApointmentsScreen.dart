import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';
import 'package:removing_barriers/models/MyUserAppointmentModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'SelectScreen.dart';

// class Person {
//   final String name, time;
//   final bool isConfirmed;
//
//   Person(this.name, this.time, this.isConfirmed);
// }

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {

  //
  // static List<Person> people = [
  //   Person('Navjyot Singh', '12:00 am', true),
  //   Person('Muskan', '10:00 am', false),
  //   Person('Somya', '11:00 am', false),
  //   Person('Hello', '9:00 am', true),
  //   Person('Test Name', '8:00 am', true),
  // ];


  String? token;
  Future<List<MyUserAppointmentModel>>? _futureAppointmentList;

  @override
  void initState() {
    // TODO: implement initState
    _getDataFromSharedPref();

    super.initState();
  }


  void _getDataFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // name = prefs.getString('name');
      token = prefs.getString('token');
      _futureAppointmentList = fetchAppointmentList();
    });
  }


  Future<List<MyUserAppointmentModel>> fetchAppointmentList() async {
    final uri = 'https://rmingbarriers.herokuapp.com/appointment/myuserappointment';

    final response = await http.get(Uri.parse(uri), headers: {
      'x-auth-token': token! //do token work
    },);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List responseJson = json.decode(response.body);
      print(responseJson.toString());
      print(token);


      return responseJson.map((m) => new MyUserAppointmentModel.fromJson(m)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {

    List<MyUserAppointmentModel> people = [];

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        appBar: AppBar(
          title: Text("Your Appointments"),
        ),
        body: (_futureAppointmentList == null)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : FutureBuilder<List<MyUserAppointmentModel>>(
          future: _futureAppointmentList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              people = snapshot.data!;

              // for (int i = 0; i < doctorDataList.length; i++) {
              //   if (doctorDataList[i] == 'Depression') {
              //     depressionSpecialistList.add(doctorDataList[i]);
              //   }
              //   if (doctorDataList[i] == 'Covid19') {
              //     covid19SpecualistList.add(doctorDataList[i]);
              //   }
              //   if (doctorDataList[i] == 'MentalHealth') {
              //     mentalHealthList.add(doctorDataList[i]);
              //   }
              // }

              return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  final MyUserAppointmentModel person = people[index];
                  return ListTile(
                    title: Text(person.doctorid!.name !=null? person.doctorid!.name!: " "),
                    subtitle: Text(person.slotid!.timeslot !=null? person.slotid!.timeslot!: " "),
                    trailing: person.isConfirmedByDoctor!
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
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(child: Text("${snapshot.error}")),
              );
            }
            return CircularProgressIndicator();
          },
        )

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
