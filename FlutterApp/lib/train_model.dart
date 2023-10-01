import 'package:firebase_database/firebase_database.dart';
import 'package:iot_flutter_project/compartment_model.dart';

class Train{
  List<Compartment> compartmentsList = [];

  Train();

  void addCompartment(Compartment compartment)
  {
    compartmentsList.add(compartment);
  }

  void editCompartment(DataSnapshot data)
  {
    int index = compartmentsList.indexWhere((element) => element.key == data.key);
    compartmentsList.removeAt(index);
    compartmentsList.insert(index,Compartment(
      key: data.key, compartmentData: CompartmentData.fromJson(data.value as Map)));
  }
}