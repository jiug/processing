import processing.sound.*;

// Sound Variables
BeatDetector beat;
AudioIn in;

int cols = 200;
int rows = 200;

float [][] current;// = new float [cols][rows] ;
float [][] previous;// = new float [cols][rows] ;

float dampening = 0.997;

int pointX;
int pointY; 

float xoff;
float yoff;
float speed = 0.0015;

// Rain variables
int numa;
int numb;

void setup() {
  fullScreen();
  cols = width;
  rows = height;
  current = new float [cols][rows] ;
  previous = new float [cols][rows] ;
  pointX = width/2;
  pointY = height/2;
  xoff = random(100);
  yoff = random(100);
  
  //Initializing audio components
  in = new AudioIn(this,0);
  in.start();
  beat = new BeatDetector(this);
  beat.input(in);
}

void mousePressed(){
  previous[mouseX][mouseY] = 127;
  previous[mouseX+1][mouseY] = 127;
  previous[mouseX-1][mouseY] = 127;
  previous[mouseX][mouseY+1] = 127;
  previous[mouseX][mouseY-1] = 127;
}

void mouseDragged(){
  previous[mouseX][mouseY] = 127;
  previous[mouseX+1][mouseY] = 127;
  previous[mouseX-1][mouseY] = 127;
  previous[mouseX][mouseY+1] = 127;
  previous[mouseX][mouseY-1] = 127;
}


void draw(){
  background(0);
  xoff += speed;
  yoff += speed;
 
  loadPixels();
  for (int i = 1; i < cols-1; i++){
    for (int j = 1; j <rows-1; j++){
      current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1]) / 2 - 
        current[i][j];
        current[i][j] = current[i][j] * dampening;
      int index = i + j*cols;
      pixels[index] = color(current[i][j]);
    }
  }

  updatePixels();
  float[][] temp = previous;
  previous = current;
  current = temp;
  
  
  pointX = round(map(noise(xoff),0,1,5,width-5));
  pointY = round(map(noise(yoff),0,1,5,height-5));
  
    if (pointX >= width - 5){
    pointX = 5;
  } else if (pointX <= 5) {
    pointX = width - 5;
  } else if (pointY >= height - 5){
    pointX = 5;
  } else if (pointY <= 5) {
    pointX = height + 5;
  }
  
  previous[pointX][pointY] = 127;
  previous[pointX+1][pointY] = 127;
  previous[pointX-1][pointY] = 127;
  previous[pointX][pointY+1] = 127;
  previous[pointX][pointY-1] = 127;
  previous[pointX-1][pointY-1] = 127;
  previous[pointX-1][pointY+1] = 127;
  previous[pointX+1][pointY-1] = 127;
  previous[pointX+1][pointY+1] = 127;
  
  // Rainy texture
  if (beat.isBeat() == true) {
    numa = round(random(width - 5)+2);
    numb = round(random(height -5)+2);
    previous[numa][numb] = 255;
    previous[numa-1][numb] = 255;
    previous[numa][numb-1] = 255;
    previous[numa+1][numb] = 255;
    previous[numa][numb+1] = 255;
    previous[numa-1][numb-1] = 255;
    previous[numa-1][numb+1] = 255;
    previous[numa+1][numb-1] = 255;
    previous[numa+1][numb+1] = 255;
  }
}
