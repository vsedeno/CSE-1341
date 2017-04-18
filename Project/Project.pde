float xBox = 0;
float yBox = 0;
float xSpeed = 5;
float ySpeed = 5;
int boxSize = 15;
float x = 10;
float y = 10;

void setup() {
  size(600,400);
  background(0);
}

void draw() {
  fill(800,800,800);
  rect(x, y, 15, 50);
  rect(570, 10, 15, 50);
  rect(xBox, yBox, boxSize, boxSize);
    xBox += xSpeed;
    yBox += ySpeed;
    
    if(topCollision() || bottomCollision())
    {
        ySpeed = ySpeed * -1;
    }
    if(leftCollision() || rightCollision())
    {
        xSpeed *= -1;
    }
    
}
boolean topCollision()
{
    if(yBox <= 0)
        return true;
    return false;
}

boolean bottomCollision()
{
    if(yBox + boxSize >= 400)
        return true;
    return false;
}
boolean leftCollision()
{
    if(xBox <= 0)
        return true;
    return false;
}
boolean rightCollision()
{
    if(xBox + boxSize >= 600)
        return true;
    return false;
}
void keyPressed() {
   if (key == 'a') {
     x = x-5; 
  }
   if (key == 'd') {
     x = x+5; 
  }
   if (key == 'w') {
     y = y-5; 
  }
   if (key == 's') {
     y = y+5; 
  }
}