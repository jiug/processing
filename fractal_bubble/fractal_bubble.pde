Bubble[] bubbles = new Bubble[15];
PImage fractal;

void setup() {
  size(720,480);
  for (int i=0; i<bubbles.length; i++){
    fractal = loadImage("fractal"+i%5+".png");
    bubbles[i] = new Bubble(random(width),random(height),random(50,150),fractal);
    
  }
}
void draw() {
  //background(255);
  loadPixels();
  for(int x =0; x<width; x++){
    for(int y = 0; y<height; y++){
      pixels[x+y*width] = color(random(255),25);
    }
  }
  updatePixels();
  for (int i=0; i<bubbles.length; i++){
    bubbles[i].ascend();
    bubbles[i].display();
    bubbles[i].top();
    bubbles[i].sides();
  }
}

void mousePressed(){
 for(int i=0;i<bubbles.length;i++){
   bubbles[i].pop();
 }
}
