const byte _data=13;
const byte _clk=12;
const byte _en=11;
uint8_t _width=0;  
uint8_t _height = 0;
char* _text = "Project by Supreet (1RE09EC089),Supriya (1RE09EC091) and Varun (1re09ec101)";
uint16_t * _buffer ;


static const char/* PROGMEM*/  font5x8[] = {
  0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x5F, 0x00, 0x00,
  0x00, 0x07, 0x00, 0x07, 0x00,
  0x14, 0x7F, 0x14, 0x7F, 0x14,
  0x24, 0x2A, 0x7F, 0x2A, 0x12,
  0x23, 0x13, 0x08, 0x64, 0x62,
  0x36, 0x49, 0x55, 0x22, 0x50,
  0x00, 0x05, 0x03, 0x00, 0x00,
  0x00, 0x1C, 0x22, 0x41, 0x00,
  0x00, 0x41, 0x22, 0x1C, 0x00,
  0x08, 0x2A, 0x1C, 0x2A, 0x08,
  0x08, 0x08, 0x3E, 0x08, 0x08,
  0x00, 0x50, 0x30, 0x00, 0x00,
  0x08, 0x08, 0x08, 0x08, 0x08,
  0x00, 0x30, 0x30, 0x00, 0x00,
  0x20, 0x10, 0x08, 0x04, 0x02,
  0x3E, 0x51, 0x49, 0x45, 0x3E,
  0x00, 0x42, 0x7F, 0x40, 0x00,
  0x42, 0x61, 0x51, 0x49, 0x46,
  0x21, 0x41, 0x45, 0x4B, 0x31,
  0x18, 0x14, 0x12, 0x7F, 0x10,
  0x27, 0x45, 0x45, 0x45, 0x39,
  0x3C, 0x4A, 0x49, 0x49, 0x30,
  0x01, 0x71, 0x09, 0x05, 0x03,
  0x36, 0x49, 0x49, 0x49, 0x36,
  0x06, 0x49, 0x49, 0x29, 0x1E,
  0x00, 0x36, 0x36, 0x00, 0x00,
  0x00, 0x56, 0x36, 0x00, 0x00,
  0x00, 0x08, 0x14, 0x22, 0x41,
  0x14, 0x14, 0x14, 0x14, 0x14,
  0x41, 0x22, 0x14, 0x08, 0x00,
  0x02, 0x01, 0x51, 0x09, 0x06,
  0x32, 0x49, 0x79, 0x41, 0x3E,
  0x7E, 0x11, 0x11, 0x11, 0x7E,
  0x7F, 0x49, 0x49, 0x49, 0x36,
  0x3E, 0x41, 0x41, 0x41, 0x22,
  0x7F, 0x41, 0x41, 0x22, 0x1C,
  0x7F, 0x49, 0x49, 0x49, 0x41,
  0x7F, 0x09, 0x09, 0x01, 0x01,
  0x3E, 0x41, 0x41, 0x51, 0x32,
  0x7F, 0x08, 0x08, 0x08, 0x7F,
  0x00, 0x41, 0x7F, 0x41, 0x00,
  0x20, 0x40, 0x41, 0x3F, 0x01,
  0x7F, 0x08, 0x14, 0x22, 0x41,
  0x7F, 0x40, 0x40, 0x40, 0x40,
  0x7F, 0x02, 0x04, 0x02, 0x7F,
  0x7F, 0x04, 0x08, 0x10, 0x7F,
  0x3E, 0x41, 0x41, 0x41, 0x3E,
  0x7F, 0x09, 0x09, 0x09, 0x06,
  0x3E, 0x41, 0x51, 0x21, 0x5E,
  0x7F, 0x09, 0x19, 0x29, 0x46,
  0x46, 0x49, 0x49, 0x49, 0x31,
  0x01, 0x01, 0x7F, 0x01, 0x01,
  0x3F, 0x40, 0x40, 0x40, 0x3F,
  0x1F, 0x20, 0x40, 0x20, 0x1F,
  0x7F, 0x20, 0x18, 0x20, 0x7F,
  0x63, 0x14, 0x08, 0x14, 0x63,
  0x03, 0x04, 0x78, 0x04, 0x03,
  0x61, 0x51, 0x49, 0x45, 0x43,
  0x00, 0x00, 0x7F, 0x41, 0x41,
  0x02, 0x04, 0x08, 0x10, 0x20,
  0x41, 0x41, 0x7F, 0x00, 0x00,
  0x04, 0x02, 0x01, 0x02, 0x04,
  0x40, 0x40, 0x40, 0x40, 0x40,
  0x00, 0x01, 0x02, 0x04, 0x00,
  0x20, 0x54, 0x54, 0x54, 0x78,
  0x7F, 0x48, 0x44, 0x44, 0x38,
  0x38, 0x44, 0x44, 0x44, 0x20,
  0x38, 0x44, 0x44, 0x48, 0x7F,
  0x38, 0x54, 0x54, 0x54, 0x18,
  0x08, 0x7E, 0x09, 0x01, 0x02,
  0x08, 0x14, 0x54, 0x54, 0x3C,
  0x7F, 0x08, 0x04, 0x04, 0x78,
  0x00, 0x44, 0x7D, 0x40, 0x00,
  0x20, 0x40, 0x44, 0x3D, 0x00,
  0x00, 0x7F, 0x10, 0x28, 0x44,
  0x00, 0x41, 0x7F, 0x40, 0x00,
  0x7C, 0x04, 0x18, 0x04, 0x78,
  0x7C, 0x08, 0x04, 0x04, 0x78,
  0x38, 0x44, 0x44, 0x44, 0x38,
  0x7C, 0x14, 0x14, 0x14, 0x08,
  0x08, 0x14, 0x14, 0x18, 0x7C,
  0x7C, 0x08, 0x04, 0x04, 0x08,
  0x48, 0x54, 0x54, 0x54, 0x20,
  0x04, 0x3F, 0x44, 0x40, 0x20,
  0x3C, 0x40, 0x40, 0x20, 0x7C,
  0x1C, 0x20, 0x40, 0x20, 0x1C,
  0x3C, 0x40, 0x30, 0x40, 0x3C,
  0x44, 0x28, 0x10, 0x28, 0x44,
  0x0C, 0x50, 0x50, 0x50, 0x3C,
  0x44, 0x64, 0x54, 0x4C, 0x44,
  0x00, 0x08, 0x36, 0x41, 0x00,
  0x00, 0x00, 0x7F, 0x00, 0x00,
  0x00, 0x41, 0x36, 0x08, 0x00,
  0x08, 0x08, 0x2A, 0x1C, 0x08,
  0x08, 0x1C, 0x2A, 0x08, 0x08 
};

void RunningDisplay(uint8_t width,uint8_t height)
{
  _buffer = (uint16_t*)calloc(height,sizeof(uint16_t));
  _width = width>16?16:width;
  _height = height>16?16:height;
}

void display(uint8_t height,uint8_t speed)
{
  uint8_t Letter=0;
  uint8_t* temp;
  for(uint16_t k=0;k<(strlen(_text)+4);k++)
  {
    if(Letter<strlen(_text))
      temp = getChar(_text[Letter]);
    else temp = getChar(' ');
    for(uint8_t j=0;j<5;j++)
    {	
      for(uint8_t i=height;i<(height+8)&&i<_height;i++)
        _buffer[i]=_buffer[i]|((temp[j]>>(i-height))&0x0001);
      flush(speed);
      for(uint8_t i=0;i<_height;i++)_buffer[i]<<=1;
    }

    for(uint8_t i=0;i<_height;i++)_buffer[i]<<=1;
    Letter++;
  }
}

void sendD(boolean dat)
{
  if(dat==1) 
    digitalWrite(_data,HIGH);
  else
    digitalWrite(_data,LOW);
  digitalWrite(_clk,HIGH);
  delayMicroseconds(10);
  digitalWrite(_clk,LOW);
}

void sendByte(byte i)
{
  for(int k=0;k<8;k++)
    sendD((i<<k&0x80)>>7);
}
void dump()
{
  digitalWrite(_en,HIGH) ;
  delayMicroseconds(10);
  digitalWrite(_en,LOW) ;
}

uint8_t strlen(char * temp)
{
  uint8_t count=0;
  for(count;temp[count]!='\0';count++);
  return (count);
}

uint8_t* getChar(char Letter)
{
  uint8_t temp[5];
  for(uint8_t i=0;i<5;i++)
    temp[i] = font5x8[((Letter-32)*5)+i];
  return temp;
}

void flush(int times)
{
  for(int k=0;k<times;k++)
  {
    for(int j=0;j<_height;j++)
    {
      for(int i=15;i>7;i--) 
      {
        sendD(!bitRead(_buffer[j],i));
        //  Serial.print(bitRead(_buffer[j],i));
      }

      for(int i=1<<j,count=0;count<16;i<<=1,count++)
      {
        sendD(bitRead(i,15)) ;
        //      Serial.print(!bitRead(i,15)) ;
      }
      for(int i=7;i>=0;i--)
      {
        sendD(!bitRead(_buffer[j],i));
        //    Serial.print(bitRead(_buffer[j],i));
      }
      dump();
      //   delay(1)  ;
      delayMicroseconds(500);
      //  Serial.println();
    }
    // Serial.println();
  }
}

void setup()
{
  RunningDisplay(16,16); 
  pinMode(_data,OUTPUT);
  pinMode(_clk,OUTPUT);
  pinMode(_en,OUTPUT);
  Serial.begin(9600);
  /*
  _text = "welcome to Aavishkaar";
   display(5,7);
   _text = "Dot Matrix Display Presented by";
   display(0,7);
   _text = "Supreet S Naik";
   display(7,7);
   _text = "Supriya R";
   display(0,7);
   _text ="Varun Bhat";
   display(7,7);
   */
  resetLeds();
  
_text = "Working";
display(6,5);
}

void resetLeds()
{
  for(int i=0;i<16;i++)
    _buffer[i]=0;
  
  for(int i=0;i<16;i++)
   {
   if(i==5)
   _buffer[i] = -1; 
   if(i==10)
   _buffer[i] = -1;
   uint16_t temp;
   temp = (B00000100<<8)|B00100000;
   _buffer[i] = _buffer[i] | temp;
   }
   
}

void xolpha(int val,byte p)
{
  int x[4] = {
    B0000,
    B0110,
    B0110,
    B0000
  } 
  ;
  int o[4] = {
    B0110,
    B1001,
    B1001,
    B0110 
  };
  boolean type ;
  if((val/9)>0)
  {
    type = true;
    val = val/9;
  }
  else type = false;

  int x_pos = val%3;
  x_pos = (x_pos*4)+x_pos+1;
  int  y_pos = val/3;
  y_pos = (y_pos*4)+y_pos;
  if(!p)
    for(uint8_t i=y_pos;i<(y_pos+4)&&i<_height;i++)
      _buffer[i]=_buffer[i]| ((x[i-y_pos])<<x_pos);
  else
    for(uint8_t i=y_pos;i<(y_pos+4)&&i<_height;i++)
      _buffer[i]=_buffer[i]| ((o[i-y_pos])<<x_pos);

}


void loop()
{
  char a;
  int someVal=0;
  byte type;
  if(Serial.available()>0)
  {
    a=Serial.read();
    a= a-'0';
    someVal = a;
  } 
  if (someVal>=9){
    someVal-=9;
    type = 1;
  }
  else if(someVal<=17) type =0;
  if (someVal==19){
    _text = "X won the Match" ;
    display(6,7);
  }
  if(someVal==20){
    _text = "O won the Match";
    display(6,7);
  }
  Serial.println((int)someVal);
  xolpha(someVal,type);
  flush(1);
  type = -1;
  someVal = -1;
  a=-1;
}









