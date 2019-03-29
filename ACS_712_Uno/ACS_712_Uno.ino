/*
Measuring Current Using ACS712
*/
const int In1 = 0;
const int In2 = 1;
int mVperAmp = 185; // use 100 for 20A Module and 66 for 30A Module
int RawValue= 0;
int ACSoffset = 0; 
double Voltage = 0;
double Amps = 0;

void setup(){ 
 Serial.begin(9600);
}

void loop(){
 
 RawValue = 0;
 Amps = 0;
 Voltage = 0;
 
 for(int i = 0; i < 10; i++)
      RawValue += (analogRead(In1));
 RawValue /= 10;
 
 Voltage = (RawValue / 1024.0) * 5000; // Gets you mV
 Amps = ((Voltage - ACSoffset) / mVperAmp);
 
 //Serial.print("Raw Value = " ); // shows pre-scaled value 
 //Serial.print(RawValue); 
 //Serial.print("\t mV = "); // shows the voltage measured 
 //Serial.print(Voltage,3); // the '3' after voltage allows you to display 3 digits after decimal point
 //Serial.print("mAmps = "); // shows the voltage measured 
 Serial.print((1000*Amps-13400),3); // the '3' after voltage allows you to display 3 digits after decimal point
 Serial.print("\t");
 Serial.println(((float)millis())/1000.0);
 delay(500); 
 
}