#include <Servo.h>
int PIN_TRIGGER = 10;
int ECHO_PIN = 9;
int SERVO_motor = 3;
Servo servo;
long duration = 0;
long cm = 0;


void setup()
{
 pinMode(PIN_TRIGGER, OUTPUT);
 pinMode(ECHO_PIN, INPUT);
 servo.attach(SERVO_motor);
 servo.write(0);
 Serial.begin(9600);
}

void loop()
{
  digitalWrite(PIN_TRIGGER, HIGH);
  delayMicroseconds(100);
  digitalWrite(PIN_TRIGGER, LOW);


  duration = pulseIn(ECHO_PIN, HIGH);
  cm = (duration/2)/28.5;

  if(cm < 25){
    servo.write(0);
  }
  else if(cm > 26 && cm<150){
    servo.write(90);
  }
  else if(cm > 150){
    servo.write(180); 
  }

  Serial.print("Jarak: ");
  Serial.print(cm);
  Serial.println(" cm");

  delay(5000);
}
