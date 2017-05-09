
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

int leftScore;
int rightScore;

PFont scoreFont; 


void setup () {
  size(800, 600); 
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

  leftScore = 0;
  rightScore = 0;

  scoreFont = loadFont ("AppleSDGothicNeo-UltraLight-40.vlw"); //this is calling the font that we've set up through 
  //tools > create font // loadFont should have a return type of PFont
}

void draw () {
  background(0);
  rectMode(CENTER);
  displayLeftPaddle();
  displayRightPaddle();
  fill(255, 170, 183);
  ellipse(ballX, ballY, ballSize, ballSize); 

  textSize(20);
  textFont(scoreFont); 
  fill(255);
  text("Player One: " + leftScore, 70, 100); 
  text ("Player Two: " + rightScore, 505, 100);

  ballX = ballX + ballX_speed;
  ballY = ballY + ballY_speed;

  if (yUpperBoundHit() || yLowerBoundHit()) {
    ballY_speed = -ballY_speed;
  }

  if (ballX - ballSize/2 <= leftPaddleX + paddleWidth/2) {
    ballX_speed = -ballX_speed;
    ballY_speed += random(-.5, .5);
    leftScore = leftScore + 1;
  } 

  if (ballX + ballSize/2 >= rightPaddleX - paddleWidth/2) {
    ballX_speed = -ballX_speed; 
    ballY_speed += random(-.5, .5);
    rightScore = rightScore + 1;
  }
}

void displayLeftPaddle() { 
  fill(186, 255, 201);
  noStroke();
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
}

void displayRightPaddle() {
  fill(186, 225, 255);
  noStroke();
  rect (rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);
}

boolean yUpperBoundHit() {
  boolean result = ballY + (ballSize/2) >=height;
  return result;
}

boolean yLowerBoundHit() {
  return ballY - (ballSize/2) <= 0;
} 

boolean xUpperBoundHit() {
  boolean result = ballX + (ballSize/2) >=width;
  return result;
}

boolean xLowerBoundHit() {
  return ballY + (ballSize/2) >= 0;
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
  
  if (key == 'g') {
  
  ballX = width/2;
  ballY = height/2;

  ballX_speed = 3;
  ballY_speed = 2;
  }
}

void mousePressed() {
  if(mousePressed) {
  
  ballX = width/2;
  ballY = height/2;

  ballX_speed = 0;
  ballY_speed = 0;
  
  leftScore = 0;
  rightScore = 0;
  
  }
}