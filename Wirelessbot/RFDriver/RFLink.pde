
#define RECEIVER

#define BUTTON_PIN  2
#define LED_PIN     13

// Button hardware is setup so the button goes LOW when pressed
#define BUTTON_PRESSED LOW
#define BUTTON_NOT_PRESSED HIGH

void setup()
{
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);

  Serial.begin(1200);  // Hardware supports up to 2400, but 1200 gives longer range
}

#ifdef TRANSMITTER
void loop()
{
  static int prev_button = BUTTON_NOT_PRESSED;  // Previous button press value
  int        cur_button;                        // Current button press value

  cur_button = digitalRead(BUTTON_PIN);

  if ((prev_button == BUTTON_NOT_PRESSED) && (cur_button == BUTTON_PRESSED))
  {
    writeUInt(271); // Put any number you want to send here (71 is just a test)
  }
 
  delay(50); // Debounce button
  prev_button = cur_button;
}
#endif //TRANSMITTER

#ifdef RECEIVER
void loop()
{
  boolean light_led = false;

  if (readUInt(true) == 271) // Check to see if we got the 71 test number
  {
    light_led = true;
  }
  
  if (light_led)
  {
    digitalWrite(LED_PIN, HIGH);
    delay(1000);
    digitalWrite(LED_PIN, LOW);
  }
}
#endif //RECEIVER


