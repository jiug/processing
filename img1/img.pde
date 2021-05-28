class Fractal{
  float x;
  float y;
  float ang;
  float a = 0;
  float size;
  PImage fractal;
  Fractal(float posx, float posy, float angle, float diameter){
    x = posx;
    y = posy;
    ang = angle;
    size = diameter;
    fractal = loadImage("rotating1.png");   
  }


  void rotation(){
   a = a+ang; 
  }

  void display(){
    rotate(a);
    tint(255,100);
    imageMode(CENTER);
    image(fractal,x,y,size,size);
  }
}
