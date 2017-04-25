float xBox = 0;
float yBox = 0;
float xSpeed = 5;
float ySpeed = 5;
int boxSize = 10;
float x = 10;
float y = 10;
boolean lost = false;

void setup() {
  size(600,400);
  background(0);
}

void draw() {
  line(width/2, 10, width/2, height-10);
  fill(800,800,800);
  rect(xBox, yBox, boxSize, boxSize);
    xBox += xSpeed;
    yBox += ySpeed;
    
    if(topCollision() || bottomCollision())
    {
        ySpeed = ySpeed * -1;
    }
  strokeWeight(2);
  stroke(100, 0, 100);
  if (lost) {  
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  rect(10, mouseY, 10, 30);
}

boolean topCollision()
{
    if(yBox <= 0)
        return true;
    return false;
}

boolean bottomCollision()
{
    if(yBox + boxSize >= height)
        return true;
    return false;
}