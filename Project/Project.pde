
// Victoria Sedeno
// 9 May 2017
// Pong Game 
//To move left paddle: 'x' for down, 's' for up
//To move right paddle: 'Down Arrow' for down, 'Up Arrow" for up
//Click mouse to reset game
//CLick anywhere to restart game

boolean paused = true;
int ballX_speed_temp;
int ballY_speed_temp;

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
  paddleWidth = width/32;
  paddleHeight = height/8; 

  leftPaddleX = width/10;
  leftPaddleY = height/2;

  rightPaddleX = width - (width/10);
  rightPaddleY = height/2; 

  reset();

  ballSize = width/20; 

  leftScore = 0;
  rightScore = 0;

  scoreFont = loadFont ("AppleSDGothicNeo-UltraLight-40.vlw"); 
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
  
  if ((rightPaddleHit() && ballX_speed > 0) || leftPaddleHit() && ballX_speed < 0) {
    ballX_speed = -ballX_speed;
    ballY_speed += random(-1, 1); 
  } 
  
  if(ballX <= 0 || ballX >= width)
  {
    if(ballX_speed > 0) {
      leftScore = leftScore + 1;
    }
    if(ballX_speed < 0) {
      rightScore = rightScore + 1;
    }
    reset();
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
  boolean result = ballY + (ballSize/2) >= height;
  return result;
}

boolean yLowerBoundHit() {
  return ballY - (ballSize/2) <= 0;
} 

boolean rightPaddleHit() {
  boolean xRightBoundsHit = false;
  boolean contact = false;
  if((ballX + (ballSize/2) >= rightPaddleX - paddleWidth/2) && (ballX - (ballSize/2) <= rightPaddleX + paddleWidth/2))
    xRightBoundsHit = true;
  if((ballY - (ballSize/2) >= rightPaddleY - paddleHeight/2) && (ballY + (ballSize/2) <= rightPaddleY + paddleHeight/2))
    contact = true;
  return xRightBoundsHit && contact;
}

boolean leftPaddleHit() {
  boolean xLeftBoundsHit = false;
  boolean contact = false;
  if((ballX - (ballSize/2) <= leftPaddleX + paddleWidth/2) && (ballX + (ballSize/2) >= leftPaddleX - paddleWidth/2)) {
    xLeftBoundsHit = true;
  }
  if((ballY + (ballSize/2) <= leftPaddleY + paddleHeight/2) && (ballY - (ballSize/2) >= leftPaddleY - paddleHeight/2)) {
    contact = true;
  }
  return xLeftBoundsHit && contact;
} 

void reset() {
  ballX = width/2;
  ballY = height/2;
  
  if(random(0,2) > 1) { 
    ballX_speed = 3;
  }
  else {
    ballX_speed = -3;
  }
  ballY_speed = 2;
}

void keyPressed() { 
  if (key == 'x') {
    leftPaddleY = leftPaddleY + 30; 
  }

  if (key == 's') {
    leftPaddleY = leftPaddleY - 30;
  }

  if (keyCode == DOWN) {
    rightPaddleY = rightPaddleY + 30;
  }

  if (keyCode == UP) {
    rightPaddleY = rightPaddleY - 30;
  }

  if (key == 'p') {
    if(paused) {
      paused = false;
      ballX_speed_temp = ballX_speed;
      ballY_speed_temp = ballY_speed;
      ballX_speed = 0;
      ballY_speed = 0;
    }
    else
    {
      paused = true;
      ballX_speed = ballX_speed_temp;
      ballY_speed = ballY_speed_temp;
    }
  }
}

void mousePressed() {
  if(mousePressed) {
    reset();
    leftScore = 0;
    rightScore = 0;
  }
}