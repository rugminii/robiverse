#include <Adafruit_NeoPixel.h>

const int LAST_PIN = 4;

const int INPUT_PIN[LAST_PIN] = {1, 2, 3, 4}; // D1, D2, D3, D4

const int CONTROL_PIN = 6;
const int NUM_LEDS = 40;

const int LED_POS[LAST_PIN] = {5, 15, 25, 35};


Adafruit_NeoPixel strip = Adafruit_NeoPixel(NUM_LEDS, CONTROL_PIN, NEO_GRB + NEO_KHZ800);

uint32_t on;
uint32_t off;

void setup() {
  for (int ii = 0; ii < LAST_PIN; ii++) {
    pinMode(INPUT_PIN[ii], INPUT_PULLUP);
  }
  // put your setup code here, to run once:
  strip.begin();
  on = strip.Color(0, 255, 0);
  off = strip.Color(10, 10, 10);
  
  for (int ii = 0; ii < 40; ii++) {
    if (ii % 10) {
      strip.setPixelColor(LED_POS[ii], off);
    } else {
      strip.setPixelColor(LED_POS[ii], on);
    }
  }
}

void loop() {
  // put your main code here, to run repeatedly:

  strip.show();
  delay(25);

}
