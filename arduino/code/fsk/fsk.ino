

int FSK_PIN     = 12;
int SENSOR_PIN  = 11;
int FREQ_LOW    = 220;
int FREQ_HIGH   = FREQ_LOW * 2;
int i           = 0;

void setup () {
  pinMode(FSK_PIN, OUTPUT);
  pinMode(SENSOR_PIN, INPUT);
}

void loop () {
  if (digitalRead(SENSOR_PIN) == HIGH) {
    digitalWrite(FSK_PIN, HIGH);
    delay(1000 / FREQ_HIGH / 2);
    digitalWrite(FSK_PIN, LOW);
    delay(1000 / FREQ_HIGH / 2);
  } else {
    digitalWrite(FSK_PIN, HIGH);
    delay(1000 / FREQ_LOW / 2);
    digitalWrite(FSK_PIN, LOW);
    delay(1000 / FREQ_LOW / 2);  
  }
}
