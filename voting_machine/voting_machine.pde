int clock = 6, addr=7  ; 
int data[]={ 2, 3, 4, 5};
int addresses[] = { 0x7f,0x2a,0x1b };


void setup()  
{ 
 pinMode(clock,OUTPUT);
 pinMode(addr,OUTPUT);
 Serial.begin(9600); 
 for(int i=0;i<4;i++) pinMode(data[i],INPUT); 
 addressList();
 digitalWrite(13,HIGH);
 
} 

void loop()  
{ 
 // setAddr(0);
  dataRead();
 // delay(10000);
 
 
  
}


void setAddr(int n){ 
  int addrByte = addresses[n]; 
  Serial.println(addrByte);
  for (int i=0;i<8;i++)
  {
      int addrBit= addrByte%2;
      digitalWrite(addr,addrBit);
      Serial.print(addrBit);
      Serial.print(" ");
      digitalWrite(clock,HIGH);
      delay(20);
      digitalWrite(clock,LOW);
      addrByte=addrByte/2;  
              
  }
   Serial.println(); 
}
  
    
void addressList()
{
  Serial.println("the Address is ");
  for(int i=0;i<4;i++)
  {  
    Serial.print("Device ");
    Serial.print(i);
    Serial.print("  ");
    Serial.println(addresses[i],BIN);
  }
  Serial.println();
}


int dataRead()
{
  int readBit=0, readData=0;
   for (int i=0 ;i<4;i++)
   {
      int expo=1;
      for(int c=0;c<i;c++) expo=expo*2;
      readBit =digitalRead(data[i]);
      Serial.print(readBit);      
      readData=readData + (readBit*expo);      
   }
   Serial.print("     ");
   Serial.println(readData);
   return readData;
}
