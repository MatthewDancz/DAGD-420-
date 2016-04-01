
PShader shader;
PImage image1;
PImage image2;

void setup()
{
  size(1050, 800, P2D);
  image1 = loadImage("Jellyfish.jpg");
  image2 = loadImage("Penguins.jpg");
  shader = loadShader("frag.glsl");
  shader.set("texture2", image2);
}

void draw()
{
  background(60);
  shader(shader);
  image(image1, mouseX, mouseY);
  
}