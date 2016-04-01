
PShader shader;
PImage image;

void setup()
{
  size(1050, 800, P2D);
  image = loadImage("Jellyfish.jpg");
  shader = loadShader("frag.glsl", "Vert.glsl");
}

void draw()
{
  background(60);
  shader(shader);
  image(image, mouseX, mouseY);
  
}