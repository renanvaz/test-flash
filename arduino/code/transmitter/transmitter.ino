#include <SPI.h>
#include <Mirf.h>
#include <MirfHardwareSpiDriver.h>
#include <MirfSpiDriver.h>
#include <nRF24L01.h>

int SENSOR_PIN  = 12;
boolean wait    = false;

String msg;

void setup () {
  pinMode(SENSOR_PIN, INPUT);
  
  Serial.begin(9600);
  
  Mirf.cePin = 8;
  Mirf.csnPin = 7;
  
  Mirf.spi = &MirfHardwareSpi;
  Mirf.init();
  
  Mirf.setTADDR((byte *)"F0001");
  Mirf.payload = sizeof(unsigned int);
  Mirf.channel = 90;
  Mirf.config();
}

void loop () {
  if (digitalRead(SENSOR_PIN) == HIGH /*&& !wait*/) {
    Mirf.send((byte *) 1);
  
    /*while(Mirf.isSending()){
      // Wait
    }*/
    
    wait = true;
  } else {
    wait = false;
    
    Mirf.send((byte *) 0); // Remover
  }
  
  while(Mirf.isSending()){} // Remover
}
