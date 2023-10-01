class Compartment{
  String? key;
  CompartmentData? compartmentData;

  Compartment({this.key, this.compartmentData});
}

class CompartmentData{
  List<String?> seats = [];
  int numOfSeats = 80;

  CompartmentData({this.numOfSeats = 80});

  CompartmentData.fromJson(Map<dynamic,dynamic> json){
    for(int i = 0; i <= numOfSeats; i++)
    {
      seats.add(json["seat$i"]);
    }
  }

  int emptySeatsNum()
  {
    int emptySeatsNum = 0;
    for(int i = 0; i <= numOfSeats; i++)
    {
      if(seats[i] == "Empty")
      {
      emptySeatsNum++;
      }
    }

    return emptySeatsNum;
  }

 
}

