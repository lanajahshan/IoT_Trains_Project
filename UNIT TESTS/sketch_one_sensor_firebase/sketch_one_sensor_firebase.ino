#include <WiFi.h>
#include <FirebaseESP8266.h>

#define FIREBASE_HOST "trainproject1-ad5f4-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyB8Uyqbhp_pq-Ir3B1BBVTCB4F3WFjcnPI"
#define WIFI_SSID ""                                          
#define WIFI_PASSWORD ""    

FirebaseData firebaseData;

const int ProxSensor1 = 13;

String send_data = "OFF";
String read_data = "";

void setup() {

  Serial.begin(9600);     
  pinMode(ProxSensor1, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);       
           
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
  // sensor 1
  send_data = "OFF";

  if(digitalRead(ProxSensor1) == LOW)
  {
    send_data = "ON";
  }
  else 
  {
    send_data = "OFF";
  }

  if (Firebase.getString(firebaseData, "/sensor1"))
  {
    read_data = firebaseData.stringData();
  }

  if (send_data != read_data)
  {
    if (Firebase.setString(firebaseData, "/sensor1", send_data)) 
    {   
      Serial.print("data ");
      Serial.print("'");               
      Serial.print(send_data);
      Serial.print("'");                  
      Serial.println(" Uploaded Successfully To Sensor 1");         
    }
    else 
    {        
      Serial.println(firebaseData.errorReason());
    }
  }
  delay(1000);
}