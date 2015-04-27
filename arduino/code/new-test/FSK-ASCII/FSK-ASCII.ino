// frequency = (((value - k) * M) + offset) * freq_resolution;

const unsigned int AUDIO_PIN    = 11;

const unsigned int SAMPLE_RATE  = 44100;    // Hz
const unsigned int SAMPLES      = 2048;     // 128, 256, 512, 1024
const unsigned int REPEAT       = 8;        // Prolong the signal
const unsigned int GAP          = 60;       // GAP between caracters, for correct round

const double FREQ_RESOLUTION    = (double) SAMPLE_RATE / SAMPLES;
const unsigned int DURATION     = (unsigned int) REPEAT * (1000 / FREQ_RESOLUTION);

int data[6];

void setup() {
  pinMode(AUDIO_PIN, OUTPUT);
}

unsigned int charToAscii(char value){
  unsigned int K = 32; // First char starts in 32
  return (unsigned int) ((value - K) * FREQ_RESOLUTION);
}

void loop() {
  for (int i = 'A'; i <= '~'; i++) {
    noTone(AUDIO_PIN);
    tone(AUDIO_PIN, charToAscii(i));
    delay(DURATION);
  }
}
