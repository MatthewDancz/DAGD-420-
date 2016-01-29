// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.
// To mathematically determine the position of
// the electrons, look at the example electron.
// Notice that before we translate it (add 200
// to x and 200 to y), it is orbiting the origin.
// Its position is a vector, so we can easily get
// its magnitude and angle from the origin.
// Once we have the angle, it should be obvious
// that we need to modify the angle then
// recalculate x and y from angle and magnitude.
// Finally, you would translate it 200, 200.
// Do all of this with trigonometry and Vectors.
float randomNumberE1;
float randomNumberE2;
float randomNumberE3;

void setup(){
  size(400, 400);
  randomNumberE1 = random(500, 1000);
  randomNumberE2 = random(500, 1000);  
  randomNumberE3 = random(500, 1000);
}
void draw(){
  background(0);
  drawAtomBG();
  ///////////////// START HOMEWORK CODE HERE:
  PVector e1 = new PVector();
  float time1 = (float)millis()/randomNumberE1;
  float time2 = (float)millis()/randomNumberE2;
  float time3 = (float)millis()/randomNumberE3;
  
  e1.x = 150 * cos(time1) + 200;
  e1.y = 50 * sin(time1) + 200;
  
  noStroke();
  fill(255,100,100);
  ellipse(e1.x, e1.y, 20, 20);
  
  ///////////////// END HOMEWORK CODE HERE
  
  PVector e2 = new PVector();
  float e2Angle;
  float e2Magnitude;
  
  e2.x = 150 * cos(time2);
  e2.y = 50 * sin(time2);
  
  e2Angle = atan2(e2.y, e2.x);
  e2Magnitude = sqrt(e2.x * e2.x + e2.y * e2.y);
  
  e2Angle = e2Angle - PI/3;
  
  e2.x = e2Magnitude * cos(e2Angle) + 200;
  e2.y = e2Magnitude * sin(e2Angle) + 200;
  
  noStroke();
  fill(100, 255, 100);
  ellipse(e2.x, e2.y, 20, 20);
  
  PVector e3 = new PVector();
  float e3Angle;
  float e3Magnitude;
  
  e3.x = 150 * cos(time3);
  e3.y = 50 * sin(time3);
  
  e3Angle = atan2(e3.y, e3.x);
  e3Magnitude = sqrt(e3.x * e3.x + e3.y * e3.y);
  
  e3Angle = e3Angle - (float)2 * (PI / 3);
  
  e3.x = e3Magnitude * cos(e3Angle) + 200;
  e3.y = e3Magnitude * sin(e3Angle) + 200;
  
  noStroke();
  fill(100, 100, 255);
  ellipse(e3.x, e3.y, 20, 20);
  
}
void drawAtomBG(){
  noStroke();
  fill(255);
  ellipse(200,200,50,50);
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2*PI/1.5);
  stroke(100,100,255);
  ellipse(0,0,300,100);
  popMatrix();
}