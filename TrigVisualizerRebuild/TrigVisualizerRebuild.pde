
boolean isSpacePressed = false;
boolean isSpacePressedPreviously = false;
boolean isUnitCircleActive = false;
float circleSize = 400;
float half = 2;
PVector origin = new PVector(250, 250);
String startText = "[space] : toggle unit circle (off)";
String onText = "[space] : toggle unit circle (on)";
String isUnitCircleActiveText = "";

void setup()
{
  size(500, 500);
}

void draw()
{
  background(65);
  
  drawGrid(half);
  toggleCircle(circleSize, half);
  
  drawLine(half);
}

void toggleCircle(float r, float divisor)
{
  isUnitCircleActiveText = startText;
  if (divisor != 0)
  {
    if (isSpacePressed && !isSpacePressedPreviously)
    {
      isUnitCircleActive = !isUnitCircleActive;
    }
    if (isUnitCircleActive == true)
    {
      noFill();
      stroke(0);
      strokeWeight(1);
      ellipse((float)width/divisor, (float)height/divisor, r, r);
      isUnitCircleActiveText = onText;
    }
    else
    {
      isUnitCircleActiveText = startText;
    }
    isSpacePressedPreviously = isSpacePressed;
  }
  textAlign(BOTTOM, LEFT);
  text(isUnitCircleActiveText, 5, 15);
}

void drawGrid(float divisor)
{
  stroke(0);
  strokeWeight(1);
  line(width/divisor, 0, width/divisor, height);
  line(0, height/divisor, width, height/divisor);
}

void drawLine(float n)
{
  PVector mouseVector = new PVector(mouseX, mouseY);
  PVector directionVector;
  float sideY;
  float sideX;
  float magnitude;
  float theta;
  String sd;
  
  directionVector = new PVector(mouseVector.x - origin.x, mouseVector.y - origin.y);
  magnitude = sqrt(directionVector.x * directionVector.x + directionVector.y * directionVector.y);

  if (isUnitCircleActive == true)
  {
    directionVector = directionVector.normalize();
    magnitude = 200;
  }
  
  theta = atan2(directionVector.y, directionVector.x);
  sideX = cos(theta) * magnitude;
  sideY = sin(theta) * magnitude;
  
  stroke(200);
  strokeWeight(3);
  
  if (mouseX > 250)
  {
    textAlign(LEFT, CENTER);
  }
  if (mouseX <= 250)
  {
    textAlign(RIGHT, CENTER);
  }
  
  line(sideX + origin.x, sideY + origin.y, sideX + origin.x, origin.y);
  if (isUnitCircleActive == true)
  {
    text(sideY / 200, sideX + origin.x, sideY / n + origin.y);
  }
  else
  {
    text(sideY, sideX + origin.x, sideY / n + origin.y);
  }
  
  if (mouseY >= 250)
  {
    textAlign(CENTER);
  }
  if (mouseY < 250)
  {
    textAlign(CENTER);
  }
  line(sideX + origin.x, origin.y, origin.x, origin.y);
  if (isUnitCircleActive == true)
  {
    if (mouseY >= 250)
    {
      text(sideX / 200, sideX / n + origin.x, origin.y - 3);
    }
    else
    {
      text(sideX / 200, sideX / n + origin.x, origin.y + 15);
    }
  }
  else
  {
    if (mouseY >= 250)
    {
      text(sideX, sideX / n + origin.x, origin.y - 3);
    }
    else
    {
      text(sideX, sideX / n + origin.x, origin.y + 15);
    }
  }
  
  if (isUnitCircleActive == true)
  {
    textAlign(TOP, RIGHT);
    sd = nf(theta, 1, 3);
    if (theta > 0)
    {
      arc(origin.x, origin.y, 100, 100, 0, theta);
      text(sd + " radians", (130 * cos(theta - theta / n)) / n + origin.x, (130 * sin(theta - theta / n)) / n + origin.y);
    }
    if (theta < 0)
    {
      arc(origin.x, origin.y, 100, 100, theta, -.001);
      text(sd + " radians", (130 * cos(theta - theta / n)) / n + origin.x, (130 * sin(theta - theta / n)) / n + origin.y);       
    }
  }
  
  if (mouseX >= 250)
  {
    textAlign(RIGHT);
  }
  else
  {
    textAlign(LEFT);
  }
  
  stroke(255, 255, 0);
  strokeWeight(5);
  line(sideX + origin.x, sideY + origin.y, origin.x, origin.y);
  if (isUnitCircleActive == true)
  {
    if (mouseY >= 250)
    {
      text(magnitude / 200, sideX / n + origin.x, sideY / n + origin.y + 15);
    }
    else
    {
      text(magnitude / 200, sideX / n + origin.x, sideY / n + origin.y - 3);
    }
  }
  else
  {
    if (mouseY >= 250)
    {
      text(magnitude, sideX / n + origin.x, sideY / n + origin.y + 15);
    }
    else
    {
      text(magnitude, sideX / n + origin.x, sideY / n + origin.y - 3);
    }
  }
}

void keyPressed()
{
  if (keyCode == 32)
  {
    isSpacePressed = true;
  }
}

void keyReleased()
{
  if (keyCode == 32)
  {
    isSpacePressed = false;
  }
}