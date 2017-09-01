class Ladybird {

float x = 0;
float y = 0;
float speedX = 10;
float speedY = 10;

// constructor
Ladybird (float _x, float _y) {
  
  x = _x;
  y = _y;
  

  strokeWeight(10);
  fill(0);
  smooth();
  
}

//functions

void run() {
  display();
  move();
  bounce();
  gravity();
}

void gravity () {
  speedY += 0.2;
}

void bounce() {
  if (x > width) {
    speedX = speedX* -1;
  }
  if (x < 0) {
    speedX = speedY * -1;
  }
  if (y > height) {
    speedY = speedY* -1;
  }
  if (y < 0) {
    speedY = speedY * -1;
  }
  
}

void move() {
   x += speedX;
   y += speedY;
  }

void display () {
  ellipse (x, y, 20, 20);
}

}