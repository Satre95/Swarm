/**********************************************
 Swarm Processing Concept                      *
 Siddharth Atre                                *
 ***********************************************/
import processing.pdf.*;
import controlP5.*;
ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;
PFont font;

//Master Vars
final int num = 8000; //number of Agents
final int res = 1200;
float noiseScale = 6000, noiseStrength = 100; //noiseScale controls the spread of the points, and noiseStrength determines the amount of distinct convergence areas.
int drawMode = 1;
int pointMode = 3;
float opacity = 100;
float strokeWidth = 0.3;
float rad = 3;
color shade = color(random(255), random(255), random(255));
//color shade = 255;
boolean record = false;

//Objects
Agent[] agents = new Agent[num];

void setup() {
  size(res, res, P2D);
  cursor(CROSS);
  smooth();
  background(0);
  for (int i = 0; i < agents.length; i++)
    agents[i] = new Agent();
  setupGUI();
}

void draw() {
  background(0);
  drawGUI();
  if (drawMode == 1) {
    for (int i=0; i<num; i++)
      agents[i].update1();
  } 
  else {
    for (int j=0; j<num; j++)
      agents[j].update2();
  }
}

void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') pointMode = 3;
  if (key == '4') pointMode = 4;
  if (key == ' ') {
    int newNoiseSeed = (int) random(100000);
    //    println("newNoiseSeed: "+newNoiseSeed);
    noiseSeed(newNoiseSeed);
    shade = color(random(255), random(255), random(255));
  }
  if (key == DELETE || key == BACKSPACE) background(0);
  if (key == 's') save("Image.png");
  if (key == 'r') endRecord();
}

void keyPressed() {
  if (key == 'r') beginRecord(PDF, "Swarm.pdf");
  background(0);
}

