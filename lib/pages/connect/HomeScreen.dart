import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:removing_barriers/constants/ColorConstants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.BACKGROUND,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                // _topbar(),
                // SizedBox(
                //   height: 30,
                // ),
                // _searchbar(),
                SizedBox(
                  height: 30,
                ),
                _carouselSlider(),
                SizedBox(
                  height: 20,
                ),
                _detailButtonContainer(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Other Services",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                _otherView()
                // _backgroundImage(),
              ],
            ),
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

  Widget _searchbar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(190),
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search For Area",
                hintStyle: TextStyle(color: Colors.black.withAlpha(120)),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _carouselSlider() {
    return Container(
      height: 170,
      child: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.collegedekhocdn.com/media/img/careers/doctor-clinic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://static.toiimg.com/photo/imgsize-157221,msid-76999956/76999956.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.collegedekhocdn.com/media/img/careers/doctor-clinic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://static.toiimg.com/photo/imgsize-157221,msid-76999956/76999956.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.collegedekhocdn.com/media/img/careers/doctor-clinic.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailButtonContainer() {
    double c_width = MediaQuery.of(context).size.width;

    return Card(
      child: Container(
        width: c_width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  'https://media.baamboozle.com/uploads/images/140571/1616762928_292417_gif-url.gif',
                  width: 90,
                  height: 90,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Find the Doctor",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Get matched with the right doctor and get an instant treatment",
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: c_width,
              child: ElevatedButton(
                child: Text("Checkout"),
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
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Image.asset('images/bg_image.png');
  }

  Widget _otherView() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _otherServicesCard(
                "Medicines Reminder",
                "assets/images/pills.png",
                onclick: () {
                  Navigator.of(context).pushNamed("/home/medicinesHelper/home");

                },
              ),
            ),
            Expanded(
              child: _otherServicesCard(
                "Get your disease detected",
                "assets/images/disease.png",
                onclick: () {
                  Navigator.of(context).pushNamed("/home/testScreen");

                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _otherServicesCard(
                "Check twitter resources",
                "https://png.pngtree.com/element_our/20200610/ourmid/pngtree-medical-blood-plasma-image_2248372.jpg",
                onclick: () {},
              ),
            ),
            Expanded(
              child: _otherServicesCard(
                "Death management",
                "https://png.pngtree.com/element_our/20200610/ourmid/pngtree-medical-blood-plasma-image_2248372.jpg",
                onclick: () {},
              ),
            ),
          ],
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 100,
        //   child: _otherServicesCard(
        //     "Medicines Reminder",
        //     ".jpg",
        //     onclick: () {
        //
        //     },
        //   ),
        // )
      ],
    );
  }

  Widget _otherServicesCard(String title, String url,
      {required VoidCallback onclick}) {
    return InkWell(
      onTap: () {
        onclick();
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(url),
              SizedBox(
                height: 10,
              ),
              Text(title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
