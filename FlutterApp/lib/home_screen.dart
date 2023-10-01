import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter_project/compartment_model.dart';
import 'package:iot_flutter_project/compartment_screen.dart';
import 'package:iot_flutter_project/train_model.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 53, 53, 0.973),
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(247, 184, 183, 183),
              ),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Center(child:
                Text("Haifa Center Station",
                  style: GoogleFonts.novaMono(
                    color: Color.fromARGB(255, 59, 59, 59),
                    fontSize: 80,
                    fontWeight: FontWeight.w900,),
                  textAlign: TextAlign.center,
                  )
                )
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                for(int i = 0 ; i < train.compartmentsList.length ; i++)
                  Column(children: [
                    Text("Compartment ${i+1}",
                      style: GoogleFonts.novaMono(
                        color: Color.fromARGB(255, 59, 59, 59),
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text("${train.compartmentsList[i].compartmentData!.emptySeatsNum()} empty seats",
                      style: GoogleFonts.novaMono(
                        color: Color.fromARGB(255, 59, 59, 59),
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ), 
                    const SizedBox(height: 10),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(247, 206, 206, 206),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1000),
                      )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompartmentScreen(compartmentData: train.compartmentsList[i].compartmentData!, compartmentNum: i)));
                      }
                      ,child: compartmentWidget(train.compartmentsList[i].compartmentData!),
                    ), 
                  ],)
              ]
            )
          ],
        ),
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

  Widget compartmentWidget(CompartmentData compartmentData)
  {
    Color color;
    if(compartmentData.emptySeatsNum() <= 10)
    {
      
      color = Color.fromARGB(255, 176, 182, 197);
    }
    else if(compartmentData.emptySeatsNum() > 70)
    { 
      color = Color.fromARGB(255, 78, 107, 188);
    }
    else
    {
      color = Color.fromARGB(255, 134, 151, 200);
    }

    return 
    Container(
      padding: EdgeInsets.all(16.0),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          )]
      ),
      child: const Image(
        image: AssetImage('assets/train_icon.png'), 
        color: Color.fromRGBO(68, 68, 69, 0.976),
      ));
  }
}