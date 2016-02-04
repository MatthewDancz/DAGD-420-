
PVector v1;
PVector v2;
float angle = 0;

void setup()
{
  size(400,400);
  changeVector();
}

void draw()
{
  //Update :
  if(mousePressed) changeVector();
  v2 = new PVector(mouseX - 200, mouseY - 200);
  
  float dot1 = v1.x * v2.x + v1.y * v2.y;
  
  PVector v3 = v1.copy();
  v3.normalize(); // Unit or directional vector.
  
  float dot2 = v3.x * v2.x + v3.y * v2.y;
  
  v3.mult(dot2); // projection position.
  
  //Draw :
  background(255);
  
  //World Space :
  pushMatrix();
  translate(200, 200);
  stroke(0);
  strokeWeight(1);
  line(0, 0, v2.x, v2.y);
  line(0, 0, v1.x, v1.y);
  
  stroke(0,0,255);
  strokeWeight(3);
  line(0, 0, v3.x, v3.y);

  popMatrix();
  
  //Screen Space:
  fill(0);
  text("v1: (" + v1.x + ", " + v1.y +") " + v1.mag(), 20, 20);
  text("v2: (" + v2.x + ", " + v2.y +") " + v2.mag(), 20, 40);
  text("dot1: " + dot1, 20, 60);
}

void changeVector()
{
  v1 = new PVector();
  v1.x = 100 * cos(angle);
  v1.y = 100 * sin(angle);
  angle += .05;
}