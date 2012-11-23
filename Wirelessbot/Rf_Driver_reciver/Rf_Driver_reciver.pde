#define pwmLeft 9
#define pwmRight 10
#define wheelBias 8

//---------------------------
boolean wDirection;
int wSpeed;
int leftP;
int rightP;
//-----------------------------

void wheelDir()
{
  digitalWrite(wheelBias,wDirection);
}


void WheelHori()
{
  int wL= wSpeed * ((100-leftP)/100);
  int wR= wSpeed * ((100-rightP)/100);
  analogWrite(pwmLeft,wL);
  analogWrite(pwmRight,wR);
}


  

