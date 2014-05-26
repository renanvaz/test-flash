#include <SPI.h>
#include <Mirf.h>
#include <MirfHardwareSpiDriver.h>
#include <MirfSpiDriver.h>
#include <nRF24L01.h>

int FSK_PIN     = 12;
int FREQ_LOW    = 220;
int FREQ_HIGH   = FREQ_LOW * 2;
int i           = 0;
int response    = 0;

String msg;

void setup () {
  pinMode(FSK_PIN, OUTPUT);
  
  Serial.begin(9600);
  
  Mirf.cePin = 8;
  Mirf.csnPin = 7;
  
  Mirf.spi = &MirfHardwareSpi;
  Mirf.init();
  
  Mirf.setRADDR((byte *)"F0001");
  Mirf.payload = sizeof(unsigned int);
  Mirf.channel = 90;
  Mirf.config();
}

void loop () {
  /*if (Mirf.dataReady()) {
    for (i = 0; i < FREQ_HIGH * 0.1; i++) { 
      digitalWrite(FSK_PIN, HIGH);
      delay(1000 / FREQ_HIGH / 2);
      digitalWrite(FSK_PIN, LOW);
      delay(1000 / FREQ_HIGH / 2);
    }
  } else {
    digitalWrite(FSK_PIN, HIGH);
    delay(1000 / FREQ_LOW / 2);
    digitalWrite(FSK_PIN, LOW);
    delay(1000 / FREQ_LOW / 2);  
  }*/
  
  while(!Mirf.dataReady()){
    // Waiting
  }
  
  Mirf.getData((byte *) &response);
  
  if (response == 1) {
    digitalWrite(FSK_PIN, HIGH);
  } else {
    digitalWrite(FSK_PIN, LOW);
  }
}
