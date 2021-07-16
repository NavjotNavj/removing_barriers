import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';
import 'package:removing_barriers/models/AppointBookModel.dart';
import 'package:removing_barriers/models/AvailableSlotModel.dart';
import 'package:search_page/search_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'ApointmentsScreen.dart';
import 'SelectScreen.dart';

// class Appointment {
//   final String name, time;
//
//   Appointment(this.name, this.time);
// }

class AppointmentAvailableScreen extends StatefulWidget {
  final String doctorId;

  const AppointmentAvailableScreen({Key? key, required this.doctorId})
      : super(key: key);

  @override
  _AppointmentAvailableScreenState createState() =>
      _AppointmentAvailableScreenState();
}

class _AppointmentAvailableScreenState
    extends State<AppointmentAvailableScreen> {
  String? token;
  Future<List<AvailableSlotModel>>? _futureAppointmentList;

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

  Future<List<AvailableSlotModel>> fetchAppointmentList() async {
    final uri =
        'https://rmingbarriers.herokuapp.com/slots/getSelectedDoctorSlot';
    var requestBody = {
      'doctorid': widget.doctorId,
    };

    final response = await http.get(Uri.parse(uri), headers: {
      'x-auth-token': token! //do token work
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List responseJson = json.decode(response.body);
      return responseJson
          .map((m) => new AvailableSlotModel.fromJson(m))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load slots');
    }
  }

  Future<AppointmentBookModel> slotBookApiHit(String slotid) async {
    // final uri = 'https://removingbarriers.herokuapp.com/appointment';
    var requestBody = {
      'slotid': slotid,
      'additionalrequirement': ' ',
    };

    final response =
        await http.post(Uri.https('removingbarriers.herokuapp.com', '/slots'),
            headers: {
              'x-auth-token': token! //do token work
            },
            body: requestBody);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List responseJson = json.decode(response.body);
      print(responseJson.toString());
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Thankyou for booking"),
          content: Text("Be on time!"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            )
          ],
        ),
      );

      return AppointmentBookModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load slots');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<AvailableSlotModel> people = [];
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.BACKGROUND,
          appBar: AppBar(
            title: Text("Appointment Availability"),
          ),
          body: (_futureAppointmentList == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FutureBuilder<List<AvailableSlotModel>>(
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
                          final AvailableSlotModel person = people[index];
                          return ListTile(
                            title: Text("Slot Id" + person.slotid!),
                            subtitle: Text(person.timeslot!),
                            trailing: MaterialButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Doctor will be booked"),
                                    content: Text("Are you sure?"),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          print("ok pressed");
                                          slotBookApiHit(person.slotid!);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              },
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
