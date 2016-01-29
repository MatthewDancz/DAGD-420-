
float circleSize = 20;
boolean isWireFrameActive = false;
boolean isSpaceBarPressed = false;
boolean isSpaceBarPressedPreviously = false;

void setup()
{
  size(500, 500);
}

void draw()
{
  if (isSpaceBarPressed && !isSpaceBarPressedPreviously)
  {
    isWireFrameActive = !isWireFrameActive;
  }
  
  background(100);
  if ( isWireFrameActive == true)
  {
    noFill();
    stroke(255, 255, 0);
  }
  else
  {
    fill(255, 0, 255);
    noStroke();
  }
  
  circleSize = map(mouseX, 0, width, 0, 1000);
  if (mouseX >= 250)
  {
    circleSize = map(mouseX, 0, width, 1000, 0);  
  }
  
  ellipse(mouseX, mouseY, circleSize, circleSize);
  
  isSpaceBarPressedPreviously = isSpaceBarPressed;
}

void mouseWheel(MouseEvent e)
{
  int amount = e.getCount();
  circleSize += amount * 10;
  if (circleSize < 10)
  {
    circleSize = 10;
  }
}

void keyPressed()
{
  //println(keyCode);
  if (keyCode == 32 )
  {
    isSpaceBarPressed = true;
  }
}

void keyReleased()
{
  if (keyCode == 32)
  {
    isSpaceBarPressed = false;
  }
}