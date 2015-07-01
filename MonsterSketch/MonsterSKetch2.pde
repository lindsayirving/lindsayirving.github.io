int xspacing = 40;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
PShape monster;

void setup() {
  size(840, 560);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  monster = loadShape("Green_Monster_clip_art.svg");
}
void draw() {
  background(0);

  // Start with i as 0
  int i = 0;

  // While i is less than the width of the window
  while (i < width) {
    noStroke();
    // The distance between the current rectangle and the mouse is equal to the absolute value of the difference between i and mouseX.
    float distance = abs(mouseX - i); 
    // That distance is used to fill the color of a rectangle at horizontal location i.
    fill(distance/2);
    rect(i,0,10,height);
    // Increase i by 10
    i += 10;
    i=i+10;
  }


  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    shape(monster, x*xspacing, height/2+yvalues[x], 60, 60);
  }
}


