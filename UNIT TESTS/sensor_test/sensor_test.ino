const int ProxSensor1 = 13;

String send_data = "OFF";
String read_data = "";

void setup() {
  Serial.begin(9600);     
  pinMode(ProxSensor1, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);            
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
 
  Serial.print("Sensor is ");  
  Serial.print(send_data);               

  delay(1000);
}