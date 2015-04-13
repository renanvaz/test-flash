// frequency = (((value - k) * M) + offset) * freq_resolution;

const unsigned int AUDIO_PIN  = 11;

const char START_TX  = '?';
const char END_TX    = '@';

const unsigned int M            = 1;         // Frequency bins per Symbol
const unsigned int SAMPLE_RATE  = 44100;     // Hz
const unsigned int SAMPLES      = 8192;      // 128, 256, 512, 1024
const unsigned int REPEAT       = 1;         // Prolong the signal (for what?)
const unsigned int OFFSET       = 0;         // Un-unsable bin on the spectrum's low end


const unsigned int ENC_START_TX = charToAscii(START_TX);
const unsigned int ENC_END_TX   = charToAscii(END_TX);
const double FREQ_RESOLUTION    = (double) SAMPLE_RATE / SAMPLES;
const unsigned int DURATION     = (int) REPEAT * (1000 / FREQ_RESOLUTION);

int data[6];

void setup() {
  pinMode(AUDIO_PIN, OUTPUT);

  Serial.begin(9600); // Debug
}

unsigned int charToAscii(char value){
  unsigned int K = 45; // First char starts in 45
  return (unsigned int) ((((value - K) * M) + OFFSET) * FREQ_RESOLUTION);
}

void encodeInt(int m) {
  char message[M];
  itoa(m, message, 10); // Convert int to ASCII: char * itoa (int value, char * str, int base)

  data[0] = ENC_START_TX;

  for (int i = 0; i < M; i++) {
    if (message[i] == '\0') {
       data[i + 1] = ENC_END_TX;

       break; // Stop the loop
    }

    data[i + 1] = charToAscii(message[i]);
  }
}

void loop() {
    tone(AUDIO_PIN, 400);
    delay(5);
    noTone(AUDIO_PIN);
    delay(500);
}

