int cols = 200;
int rows = 200;

float [][] current;// = new float [cols][rows] ;
float [][] previous;// = new float [cols][rows] ;

float dampening = 0.99;

int pointX;
int pointY; 

void setup() {
  fullScreen();
  cols = width;
  rows = height;
  current = new float [cols][rows] ;
  previous = new float [cols][rows] ;
  pointX = width/2;
  pointY = height/2;
}

void mousePressed(){
  previous[mouseX][mouseY] = 255;
  previous[mouseX+1][mouseY] = 255;
  previous[mouseX-1][mouseY] = 255;
  previous[mouseX][mouseY+1] = 255;
  previous[mouseX][mouseY-1] = 255;
}

void mouseDragged(){
  previous[mouseX][mouseY] = 255;
  previous[mouseX+1][mouseY] = 255;
  previous[mouseX-1][mouseY] = 255;
  previous[mouseX][mouseY+1] = 255;
  previous[mouseX][mouseY-1] = 255;
}


void draw(){
  background(0);
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
  
  pointX = round(random(width-10)+5);
  pointY = round(random(height-10)+5);
  
    if (pointX >= width - 5){
    pointX = 5;
  } else if (pointX <= 5) {
    pointX = width - 5;
  } else if (pointY >= height - 5){
    pointX = 5;
  } else if (pointY <= 5) {
    pointX = height + 5;
  }
  
  previous[pointX][pointY] = 255;
  previous[pointX+1][pointY] = 255;
  previous[pointX-1][pointY] = 255;
  previous[pointX][pointY+1] = 255;
  previous[pointX][pointY-1] = 255;
  previous[pointX-1][pointY-1] = 255;
  previous[pointX-1][pointY+1] = 255;
  previous[pointX+1][pointY-1] = 255;
  previous[pointX+1][pointY+1] = 255;
  
}
