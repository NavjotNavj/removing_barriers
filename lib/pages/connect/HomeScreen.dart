import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              _searchbar(),
              SizedBox(
                height: 20,
              ),
              _carouselSlider(),
              SizedBox(
                height: 20,
              ),
              _detailButtonContainer(),
              _backgroundImage(),
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

  Widget _searchbar() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
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
      height: 200,
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
    double c_width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      width: c_width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                'https://png.pngtree.com/element_our/20200610/ourmid/pngtree-medical-blood-plasma-image_2248372.jpg',
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
                      "Find the Donor",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Get matched with the right blood donor ans safe life",
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
          SizedBox(height: 20,),
          SizedBox(
            width: c_width,
            child: ElevatedButton(
              child: Text("Checkout"),
              onPressed: () =>  Navigator.of(context)
                  .pushNamed("/selectscreen"),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),      ],
      ),
    );
  }
  
  Widget _backgroundImage(){
    return Image.asset('images/bg_image.png');
  }
}
