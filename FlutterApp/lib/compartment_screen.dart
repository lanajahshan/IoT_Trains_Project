import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter_project/compartment_model.dart';
import 'package:iot_flutter_project/train_model.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CompartmentScreen extends StatefulWidget {
  CompartmentData? compartmentData;
  int? compartmentNum;
  CompartmentScreen({super.key, required this.compartmentData, required this.compartmentNum});
  

  @override
  State<CompartmentScreen> createState() => _CompartmentScreenState(compartmentData, compartmentNum);
}

class _CompartmentScreenState extends State<CompartmentScreen> {
  CompartmentData? compartmentData;
  int? compartmentNum;
  _CompartmentScreenState(this.compartmentData, this.compartmentNum);

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  Train train = Train();

  @override
  void initState() {
    super.initState();

    retrieveCompartmentsData();
    retrieveEditedCompartmentsData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = [];
    int seatNum = train.compartmentsList[compartmentNum!].compartmentData!.numOfSeats;
    for(int i = 0; i < seatNum; i++)
    {
      widgetsList.add(Text("${i+1}"));
      widgetsList.add(seatWidget(train.compartmentsList[compartmentNum!].compartmentData!.seats[i]));
      widgetsList.add(SizedBox(height: 10,));
      if(i % 4 == 1)
        widgetsList.add(SizedBox(height: 40,));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 53, 53, 0.973),
        title: Text("Compartment ${compartmentNum! + 1}"),
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[ Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 125, 143, 194),
                  shape: BoxShape.circle
                ),
                child: Text("${train.compartmentsList[compartmentNum!].compartmentData!.emptySeatsNum()}", 
                  style: GoogleFonts.novaMono(
                    color: Color.fromARGB(255, 50, 50, 50),
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                  ),
                )
              )]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Empty Seats",
                  style: GoogleFonts.novaMono(
                    color: Color.fromARGB(255, 59, 59, 59),
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]
            ),
            Row(children: [SizedBox(height: 20,)],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for(int i = 0; i < seatNum/4; i++)
                  Column(
                    children: [
                      for(int j = 0; j < 13; j++)
                        widgetsList[i * 13 + j]
                    ]
                  )
              ],
        ),
        ]
    ));
  }

  Widget seatWidget(String? occupancy)
  {
    if(occupancy == "Empty")
    {
      return Container(
        padding: EdgeInsets.all(16.0),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 125, 143, 194),
          borderRadius: BorderRadius.circular(7),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 143, 143, 143).withOpacity(0.5),
        borderRadius: BorderRadius.circular(7),

      ),
      child: Icon(Icons.close, color: Color.fromARGB(255, 196, 196, 196),
      size: 30,)
    );
  }

  void retrieveCompartmentsData() {
    dbRef.child("Train").onChildAdded.listen((data) {
      CompartmentData compartmentData = CompartmentData.fromJson(data.snapshot.value as Map);
      Compartment compartment = Compartment(key: data.snapshot.key, compartmentData: compartmentData);
      train.addCompartment(compartment);
      setState(() {});
    });
  }

  void retrieveEditedCompartmentsData() {
    dbRef.child("Train").onChildChanged.listen((data) {
      train.editCompartment(data.snapshot);
      setState(() {});
    });
  }


}