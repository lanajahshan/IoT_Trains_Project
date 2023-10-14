# Train Project by:
- Lana Jahshan
- Christeen Shaheen
- Mais Khoury

# Project Description:
Trains are one of the most used public transports in the world, however one of the problems that comes with this, is the delays in trains arrival and the long waiting time on the platforms. 
So we have created Train Project that aims to solve this problem by letting passengers know where to stand on the platform while waiting for the train to arrive, so they can get on the train in the quickest way possible, which decreases the delay.  
We install Infrared proximity sensors above each seat in the train to indicate whether it’s occupied or empty. The data is collected and stored in Firebase Realtime database and then presented on screens in the station in the following way:
Next to the entrance we place this screen that lets the passengers know the general state of the train, by showing the number of empty seats in each compartment. The shades of the colors indicate the capacity of the compartment. Where Darker blue means more empty seats.
Along the platform, next to each compartment door, we show the state of this compartment. We present the number of empty seats and the state of each seat in the compartment.

# Folder Description:
- ESP32: source code for the esp side (firmware). 
- Documentation: wiring diagram + hardware devices description
- Unit Tests: tests for individual hardware components - a test for checking one sensor works properly and a test for connecting one senssor to firebase.
- flutter_app : dart code for our Flutter app.
- Parameters: contains description of configurable parameters.

# Hardware Used:
- Four infrared proximity sensors.
- ESP32 board.
- 2 matrixes.
- Wires

# Hardware Diagram:
![Alt text](hardware_diagram.png)

# Arduino/ESP libraries installed for the project:
Firebase ESP8266 Client - version 4.3.19
Firebase Arduino Client Library for ESP8266 and ESP32 - version 4.3.20

# Project Poster:
![Alt text](<Train Project- IOT poster.png>)

This project is part of ICST - The Interdisciplinary Center for Smart Technologies, Taub Faculty of Computer Science, Technion https://icst.cs.technion.ac.il/