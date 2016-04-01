
PShader shader;
PImage image1;
PImage image2;

void setup()
{
  size(1050, 800, P2D);
  image1 = loadImage("Jellyfish.jpg");
  image2 = loadImage("Clouds.psd");
  shader = loadShader("frag.glsl");
  shader.set("texture2", image2);
  textureWrap(REPEAT);
}

void draw()
{
  float time = millis()/1000.0;
  shader.set("time", time);
  
  background(60);
  image(image1, mouseX, mouseY);
  
  filter(shader);
  
}