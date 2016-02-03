
/*
In this example we homebrew our own Matrix math!
This is a simple practice exercise, and is NOT very functional for complex transforms.
*/


ArrayList<PVector> dots = new ArrayList<PVector>();

void setup()
{
  size ( 200, 200);
  dots.add(new PVector(-10, -10));
  dots.add(new PVector(10, -10));
  dots.add(new PVector(-10, 10));
  dots.add(new PVector(10, 10));
  noStroke();
}

void draw()
{
  background(0);
  float time = millis() / 1000.0; //Seconds since app launch
  
  //create a new transform matrix
  float scale =  map(mouseX, 0, width, .5, 2);
  Matrix matrix = new Matrix(time, scale, 100, 100);
  
  for (PVector p : dots)
  {
    //transform point by matrix
    p = matrix.transform(p);
    ellipse(p.x, p.y, 10, 10);
  }
}