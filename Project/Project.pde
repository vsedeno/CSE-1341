int leftPaddleX; 
int leftPaddleY;

int rightPaddleX;
int rightPaddleY;

int paddleWidth;
int paddleHeight;

int ballX;
int ballY;

int ballX_speed;
int ballY_speed;

int ballSize;

void setup() {
  size(800,600);
  paddleWidth = width/32;   //using fractions will help maintain proportions if you adjust the size of the screen
  paddleHeight = height/8; 

  leftPaddleX = width/10;
  leftPaddleY = height/2;

  rightPaddleX = width - (width/10);
  rightPaddleY = height/2; 

  ballX = width/2;
  ballY = height/2;

  ballX_speed = 3;
  ballY_speed = 2;

  ballSize = width/20; 


}

void draw() {
  background(0);
  rectMode(CENTER);
  fill(255,170,183);
  ellipse(ballX, ballY, ballSize, ballSize); 
  
  ballX = ballX + ballX_speed;
  ballY = ballY + ballY_speed;
  
}
void keyPressed() {   //when a key is pressed, I want my paddle to move
  if (key == 'x') {
    leftPaddleY = leftPaddleY + 15;
  }

  if (key == 's') {
    leftPaddleY = leftPaddleY - 15;
  }

  if (keyCode == DOWN) {
    rightPaddleY = rightPaddleY + 15;
  }

  if (keyCode == UP) {
    rightPaddleY = rightPaddleY - 15;
  }
}