import processing.sound.*;

//Sound Variables
Waveform waveform;
AudioIn in;
BeatDetector beat;
Amplitude amp;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

float smoothingFactor = 0.25;
float sum;

int cols = 200;
int rows = 200;

float [][] current;// = new float [cols][rows] ;
float [][] previous;// = new float [cols][rows] ;


float dampening = 0.98; // 0.98 recommended upper limit

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
  fft = new FFT(this,bands);
  fft.input(in);
  

}

void draw(){
  waveform.analyze();
  fft.analyze(spectrum);
  
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
 
  
  // Waveform as ripples
  //for (int i =0; i < samples; i++){
  //  previous[round((width-samples)/2)+i][round(map(waveform.data[i], -1, 1, 0, height))]=255 ;
  //}
  
  // Spectrum as ripples
  for (int i =0; i < bands; i++){
    previous[round((width-bands)/2)+i][round(map(spectrum[i], -1, 1, 0, height))]=255;
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
