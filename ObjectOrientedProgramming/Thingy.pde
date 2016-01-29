class Thingy
{
  
  PVector position = new PVector();
  PVector velocity = new PVector();
  float mass;
  float size;
  color colour;
  
  Thingy()
  {
    position.x = random(0, width);
    position.y = random(0, height);
    mass = random(1, 100);
    size = map(mass, 1, 100, 5, 50);
    colour = color(random(1,255), random(1,255), random(1,255));
  }
  
  void update()
  {
    PVector acceleration = PVector.sub(new PVector(mouseX, mouseY), position);
    acceleration.normalize();
    acceleration.mult(2);
    acceleration.div(mass);
    
    velocity.add(acceleration);
    velocity.limit(15);
    position.add(velocity);
  }
  
  void draw()
  {
    fill(colour);
    noStroke();
    ellipse (position.x, position.y, size, size);
  }
}