
const byte data[]={
  5,6,7,8};
const byte statusInput = 4;
const byte leftPWM = 9;
const byte rightPWM = 10;
const byte leftDig = 11;
const byte rightDig =12;

byte speed=0;



void setup()
{
  pinMode(data[0],INPUT);
  pinMode(data[1],INPUT);
  pinMode(data[2],INPUT);
  pinMode(data[3],INPUT);
  pinMode(statusInput,INPUT);
  pinMode(rightDig,OUTPUT);
  pinMode(leftDig,OUTPUT) ;
  pinMode(rightPWM,OUTPUT);
  pinMode(leftPWM ,OUTPUT);


  Serial.begin(9600);
}

void loop()
{
  byte a[4
    ];
  byte num = 0 ;
  while(digitalRead(statusInput)==1)
  {

    for(int i=0;i<4;i++)
    {
      a[i]=digitalRead(data[i]);
      //    Serial.print(a[i]);
    }
    num = (a[3]<<0|a[2]<<1|a[1]<<2|a[0]<<3)&0x0f;
    //  Serial.println(num);
    speed++;
    kickStart(num);
  }
  while(digitalRead(statusInput)==0)speed = 0;
}

void kickStart(byte num)
{
  switch(num) 
  {
  case 2: 
    motorControl(speed,0,0);//forward
    //  Serial.println("Forward");
    break;
  case 8: 
    motorControl(speed,1,1);//backward
    //  Serial.println("backward");
    break;
  case 4: 
    motorControl(speed,1,0);// left
    //  Serial.println("left");
    break;
  case 6: 
    motorControl(speed,0,1);// right
    //  Serial.println("right");
    break;
  default: 
    break;
  }
}


void motorControl( byte tspeed,boolean wRight,boolean wLeft)
{
  int lspeed=tspeed;
  int rspeed=tspeed;
  Serial.print("Data sent : ");

  digitalWrite(leftDig,wLeft);
  Serial.print(wLeft);
  digitalWrite(rightDig,wRight);
  Serial.print(wRight);

  if (wLeft==1)

    lspeed = 255-tspeed;

  else lspeed = tspeed;
  Serial.print(lspeed );
  if(wRight ==1)
    rspeed = 255-tspeed;
  else rspeed = 255- rspeed;
  Serial.print(rspeed );
  analogWrite(leftPWM,lspeed);
  analogWrite(rightPWM , rspeed);

  delay(10);

  analogWrite(leftPWM,0);
  analogWrite(rightPWM , 0);
  digitalWrite(leftDig,0);
  digitalWrite(rightDig,0);
}




