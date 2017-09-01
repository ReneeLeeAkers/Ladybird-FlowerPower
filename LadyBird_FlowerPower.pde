Ladybird l0; 
Ladybird l1; 
Ladybird l2;
Ladybird l3; 

/*------------------------------------------------- 
 LadyBird Pulsating Cirlces :
 */
float circlesize;
float increment;
int max_size;

/*------------------------------------------------- 
 Following The Ladybird :
  */
int size = 60;
int[] x = new int[size];
int[] y = new int[size];
int mouse = 5;

//-------------------------------------------------
//LadyBird Images :

PImage[] images = new PImage[2];
int imageIndex = 0;

//-------------------------------------------------
//Flower:
/*
  Program to draw flower patterns
  
  Left mouse click to place flowers.
  
  Middle mouse click to erase.
*/

// Radius of flower bud
float Cr = 25;
// Radius of the petals
float petalR = 25;
// Offset of petals from bud
float petalOffset = 1;
   
// Sample the mouse
int prevMouseX = 0, prevMouseY = 0;
int samplingFrequency = 73;   

//-------------------------------------------------
//Flower Pattern:
int flowerPattern() {
  return color(random(120,255), random(255), random(255));
}

void drawFlower(float x, float y, float flowerSize){
  
  strokeWeight(flowerSize);
  stroke(flowerPattern());
  
 translate(x, y);
  for (int i= 0; i<10; i++) {
    rotate(TWO_PI / 10);
    line(0,0,3*flowerSize,0);
  }
  
 strokeWeight(0);
 fill(flowerPattern());
 ellipse(0,0,1.5 * flowerSize,1.5 * flowerSize);
 
}

//-------------------------------------------------
void setup() {
  size(1000,1000);

  circlesize = 25;
  max_size = 50;
  increment = 1.5;
  
    images [0]  = loadImage("a.png");
    images [1] = loadImage ("c.png");
    
  l0 = new Ladybird (400, 200);
  l1 = new Ladybird (200, 300);
  l2 = new Ladybird (600, 100);
  l3 = new Ladybird (800, 0);
}


//-------------------------------------------------
// Flower:


int sampleMouse() {
  int diffX = abs(mouseX - prevMouseX);
  int diffY = abs(mouseY - prevMouseY);
  
  if ( diffX < samplingFrequency &&  diffY < samplingFrequency){
    return 0;
  } else {
     return 1;
  }
}

//-------------------------------------------------
// Following The LadyBird :
 
void update() {
  circlesize += increment;

  if ((circlesize >= max_size) || (circlesize <= 0)) {
    increment *= -1;
  }
}

/*------------------------------------------------- 
 LadyBird Pulsating Cirlces :
 */

void drawCircles(int rows, int columns) {
  for (int a = 0; a < columns; a++) {
    for (int b = 0; b < rows; b++) {
      fill(200,30,56);
      ellipse(a*(max_size*2), b*(max_size*2), circlesize, circlesize);
    }
  }
}


//-------------------------------------------------
void draw() {
background(112, 128, 144); 
update();
drawCircles(194,56);

  fill(6);
  strokeWeight(5);
  x[mouse] = mouseX;
  y[mouse] = mouseY;
  mouse = (mouse + 2) % size;
  
  for (int i = 0; i < size; i++) {
   
    int pos = (mouse + i) % size;
    float radius = (size-i) / 2.0;
    ellipse(x[pos], y[pos], radius, radius);
  }
  
  textSize(25);
fill(230, 140); 
text("Press 1 or 2 for IMAGE", 1, 960);
text("Press ENTRE or LEFT MOUSE KEY for FLOWERS", 1, 980);




  
  imageMode(CENTER);
  image(images[imageIndex],width/2,height/2);
  
   if (mousePressed && mouseButton == LEFT && (sampleMouse() == 1)) {
    fill(255,0,0);
    ellipse(mouseX, mouseY, Cr, Cr);
    
    prevMouseX = mouseX;
    prevMouseY = mouseY;
    
    float petalX, petalY;
    
    for (int i=0; i < 360; i = i + 90) {
      petalX = (Cr+petalOffset) * cos(radians(i)) + mouseX;
      petalY = (Cr+petalOffset) * sin(radians(i)) + mouseY;        
      fill(random(0,255), random(0,255), random(0,255));
      ellipse(petalX, petalY, petalR, petalR);
      
    }


  if (keyPressed == true) {
    drawFlower(random(width), random (height), random(1, 100));
      saveFrame(); 
  }
  
  l0.run();
  l1.run();
  l2.run();
  l3.run();
}
}




//----------------------------
void keyPressed() {
  if (key == '1') imageIndex = 0;
  if (key == '2') imageIndex = 1;

  {
  // If the user pressed Right mmouse button, save the image
  //if (mouseButton == MIDDLE) {
  //  saveFrame("sgFlowers-####.png");
  //}

  // Clear the screen if middle mouse button is clicked
  if (mouseButton == RIGHT) {
    clear();
    redraw();
   
}
  }
}

    
  



 