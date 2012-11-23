#define Lo 2 
#define Bo 3 
#define Ro 4 
#define To 5 

#define LED 13

#define Ti 1 
#define Ri 0
int r;

int touchX = 0;
int touchY = 0;

void setup()
{
 Serial.begin(9600);
}

void loop()
{

}


void getKeyPressed()
{
    if (touched())
       {
        //-------------------------------------------
           Serial.print("X=");
           Serial.print(touchX); 
           Serial.print(" Y=");
           Serial.println(touchY);
           digitalWrite(LED, HIGH); 
           digitalWrite(LED, LOW); 
        //---------------------------------------------
           touchMap(); 
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

//------------------------------------------------------------
//to be modded
void touchMap()
{
 if(touchY>737)
  {
     if(touchX > 666) r=3;
     else if(touchX < 666 and touchY >333) r=2;
     else if(touchX < 333 and touchY >0) r=1;
  } 
  else if(touchY<737 and touchY>522) 
  { 
     if(touchX > 666) r=6;
     else if(touchX < 666 and touchY >333) r=5;
     else if(touchX < 333 and touchY >0) r=4;
  }
  else if(touchY<522 and touchY>307) 
 {
     if(touchX > 666) r=9;
     else if(touchX < 666 and touchY >333) r=8;
     else if(touchX < 333 and touchY >0) r=7;
 }
 
 if(touchY>0 and touchY<307) 
  {
     if(touchX > 666) r=12;
     else if(touchX < 666 and touchY >333) r=11;
     else if(touchX < 333 and touchY >0) r=10;
  } 
}

//----------------------------------------------------------------
