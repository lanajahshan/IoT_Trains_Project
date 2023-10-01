#include <WiFi.h>
#include <FirebaseESP8266.h>

#define FIREBASE_HOST "trainproject1-ad5f4-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyB8Uyqbhp_pq-Ir3B1BBVTCB4F3WFjcnPI"
#define WIFI_SSID "lanaiphone"                                          
#define WIFI_PASSWORD "asdfghjkl"                                   
#define SENSORS_NUM 4

FirebaseData firebaseData;

const int ProxSensor1 = 27;
const int ProxSensor2 = 14;
const int ProxSensor3 = 13;
const int ProxSensor4 = 4;

const int proxsensor[4] = {27, 14, 13, 4};
const String sensor_name[4] = {"/Train/compartment0/seat1", "/Train/compartment0/seat2", "/Train/compartment0/seat3", "/Train/compartment0/seat4"};

String send_data = "OFF";
String read_data = "";

void setup() {

  Serial.begin(9600);     
  pinMode(ProxSensor1, INPUT);
  pinMode(ProxSensor2, INPUT);
  pinMode(ProxSensor3, INPUT);
  pinMode(ProxSensor4, INPUT);
           
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);       
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }

  Serial.println();
  Serial.print("Connected to ");
  Serial.println(WIFI_SSID);
  Serial.print("IP Address is : ");
  Serial.println(WiFi.localIP());            
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);   

  Firebase.reconnectWiFi(true);

  Serial.println();       
  delay(1000);
}

void loop() 
{ 
  for(int i = 0; i < SENSORS_NUM; i++)
  {
    // sensor 1
    send_data = "Empty";//OFF

    if(digitalRead(proxsensor[i]) == LOW)
    {
      send_data = "Occupied";//ON
    }
    else 
    {
      send_data = "Empty";
    }
    if (Firebase.getString(firebaseData, sensor_name[i]))
    {
      read_data = firebaseData.stringData();
    }
    else 
    {        
      Serial.println(firebaseData.errorReason());
    }

    if (send_data != read_data)
    {
      if (Firebase.setString(firebaseData, sensor_name[i], send_data)) 
      {   
        Serial.print("data ");
        Serial.print("'");               
        Serial.print(send_data);
        Serial.print("'");                  
        Serial.println(" Uploaded Successfully To Sensor");         
      }
      else 
      {        
        Serial.println(firebaseData.errorReason());
      }
    }
    delay(1000);
  }
  delay(1000);
}