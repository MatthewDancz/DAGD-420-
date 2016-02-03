class Matrix
{
  float a, b, c;
  float d, e, f;
  float g, h, i;
  
  Matrix(float radians, float scale, float tx, float ty)
  {
    a = cos(radians) * scale;
    b = sin(radians) * scale;
    c = tx;
    d = -b;
    e = a;
    f = ty;
    g = 0;
    h = 0;
    i = 1;
  }
  
  PVector transform(PVector p)
  {
    PVector theVector = new PVector();
    theVector.x = p.x * a + p.y * b + 1 * c;
    theVector.y = p.x * d + p.y * e + 1 * f;
    return theVector;
  }
}