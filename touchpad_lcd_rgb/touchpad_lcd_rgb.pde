#include <LiquidCrystal.h>
#define Lo 4 
#define Bo 5 
#define Ro 6 
#define To 7 

#define Ti 1 
#define Ri 0 

#define LED 13 

int touchX = 0;
int touchY = 0;
const int pr=9, pg=10, pb=11;
int r, g, b;

//LiquidCrystal lcd(7, 6, 11, 10, 9, 8);

void setup()
{
 Serial.begin(9600);
// lcd.begin(16, 2);
 pinMode(LED, OUTPUT); 
}

void loop()
 {
 if (touched())
 {
   touchY = map(touchY, 90, 1000, 0, 1023);
   touchX = map(touchX, 100, 1000, 0, 1023);
 Serial.print("X=");
 Serial.print(touchX); 
 Serial.print(" Y=");
 Serial.println(touchY);
 
digitalWrite(LED, HIGH); 
delay(50);
digitalWrite(LED, LOW); 
 }
 
}


boolean touched()
 {
 boolean touch = false;

 pinMode(Lo, OUTPUT);
 digitalWrite(Lo, LOW); 
 pinMode(Ro, OUTPUT);
 digitalWrite(Ro, HIGH); 
 pinMode(To, INPUT);
 pinMode(Bo, INPUT);
 delay(10); 
 touchX = analogRead(Ti); 

 pinMode(Bo, OUTPUT);
 digitalWrite(Bo, LOW); 
 pinMode(To, OUTPUT);
 digitalWrite(To, HIGH); 
 pinMode(Ro, INPUT);
 pinMode(Lo, INPUT); 
 delay(10); 
 touchY = analogRead(Ri);

 if(touchX < 1000 and touchY < 1000)
 touch = true;
 
 return touch;
}

void touchMap()
{
  
 
 if(touchY>737) r = 255-((touchX-148)/4);
 if(touchY<737 and touchY>522) g=255-((touchX-148)/4);
 if(touchY<522 and touchY>307) b,255-((touchX-148)/4);
 if(touchY>0 and touchY<307) 
   {
     if(touchX<453)
       {
         r=0;
         g=0;
         b=0;
       }
      if(touchX>453)
       {
         r=255;
         g=255;
         b=255;
       }
   } 
}


