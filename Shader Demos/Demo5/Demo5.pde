
PShader shader;
PImage image1;

void setup()
{
  size(1050, 800, P2D);
  image1 = loadImage("Jellyfish.jpg");
  shader = loadShader("frag.glsl");
  shader.set("aspect", image1.width/(float)image1.height);
  textureWrap(REPEAT);
}

void draw()
{
  
  background(60);
  shader(shader);
  image(image1, mouseX, mouseY);
  
}