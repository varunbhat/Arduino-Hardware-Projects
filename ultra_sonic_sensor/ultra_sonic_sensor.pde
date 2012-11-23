
const int pingPin = 7;
const int buzz = 9;
const int segPins[]={7,8,11,10,12,13,6};
int segVal[10];
int thresholdLeng=7;



void setup() {

  Serial.begin(9600);
  sevSegInit();
}

void loop()
{

  long duration, inches, cm;

  pinMode(pingPin, OUTPUT);
  digitalWrite(pingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(pingPin, LOW);

  pinMode(pingPin, INPUT);
  duration = pulseIn(pingPin, HIGH);

  cm = microsecondsToCentimeters(duration);
 
  Serial.print(inches);
  Serial.print("in, ");
  Serial.print(cm);
  Serial.print("cm");
  Serial.println();
  
  if(cm > thresholdLeng)
  {
     digitalWrite(buzz,HIGH); 
  }
  if(cm< 10 )
  {
    void segPrint(cm);
  }
 
  delay(100);
}

long microsecondsToInches(long microseconds)
{
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}

void segPrint(int dist)
{
   for(int i=0;i<7;i++)
  {
     segPins[i]=segVal[cm][i];
  } 
}


/*
void sevSegInit()
{
    
  segVal[0][]={ };
  segVal[1][]={ };
  segVal[2][]={ };
  segVal[3][]={ };
  segVal[4][]={ };
  segVal[5][]={ };
  segVal[6][]={ };
  segVal[7][]={ };
  segVal[8][]={ };
  segVal[9][]={ };
}
*/
