import processing.sound.*;

//Sound Variables
Waveform waveform;
AudioIn in;
BeatDetector beat;
Amplitude amp;


int cols = 200;
int rows = 200;

float [][] current;// = new float [cols][rows] ;
float [][] previous;// = new float [cols][rows] ;

float dampening = 0.98;

int pointX;
int pointY; 

float xoff;
float yoff;
float speed = 0.0015;

int numa;
int numb;

//Hairball variables
float posX;
float posY;
int samples = 1500;
Hairball hairball;


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
  in = new AudioIn(this, 0);
  in.start();
  waveform = new Waveform(this, samples);
  waveform.input(in);
  beat = new BeatDetector(this);
  beat.input(in);
  amp = new Amplitude(this);
  amp.input(in);
  
  //Initializing hairball
  posX = width/2;
  posY = height/2;
  hairball = new Hairball(samples);
}

void draw(){
  //background(0);
  waveform.analyze();

  xoff += speed;
  yoff += speed;
 
  // Screen updating
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
  
  // Perlin noise update
  pointX = round(map(noise(xoff),0,1,5,width-5));
  pointY = round(map(noise(yoff),0,1,5,height-5));
  
  // Boundary conditions
    if (pointX >= width - 5){
    pointX = 5;
  } else if (pointX <= 5) {
    pointX = width - 5;
  } else if (pointY >= height - 5){
    pointX = 5;
  } else if (pointY <= 5) {
    pointX = height + 5;
  }
  
  // Moving "worm"
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
  
  // Sprinkled drops about one every half a second
  if (frameCount%17== 0){
    numa = round(random(width - 5)+2);
    numb = round(random(height -5)+2);
    previous[numa][numb] = 255;
    previous[numa-1][numb] = 255;
    previous[numa][numb-1] = 255;
    previous[numa+1][numb] = 255;
    previous[numa][numb+1] = 255;
  }
    
  //if (beat.isBeat() == true) {
    //numa = round(random(width - 5)+2);
    //numb = round(random(height -5)+2);
    //previous[numa][numb] = 255;
    //previous[numa-1][numb] = 255;
    //previous[numa][numb-1] = 255;
    //previous[numa+1][numb] = 255;
    //previous[numa][numb+1] = 255;
    //previous[numa-1][numb-1] = 255;
    //previous[numa-1][numb+1] = 255;
    //previous[numa+1][numb-1] = 255;
    //previous[numa+1][numb+1] = 255;
    
    for (int i =0; i < samples; i++){
      previous[round((width-samples)/2)+i][round(height/2)+round(map(waveform.data[i], -1, 1, 0, height-400))]=255 ;
    //}
  }
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
