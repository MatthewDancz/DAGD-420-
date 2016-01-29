
ArrayList<Thingy> things = new ArrayList<Thingy>();

void setup()
{
  size(500, 500);
  
  for (int i = 0; i < 30; i++)
  {
    things.add(new Thingy());
  }
}

void draw()
{
 for(Thingy t : things)
 {
   t.update();
   t.draw();
 }
}