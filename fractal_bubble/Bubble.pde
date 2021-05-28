class Bubble{
  
  float x;
  float y;
  float diameter;
  PImage img;
  int speed = 1;
  
  Bubble(float posx , float posy,float tempD, PImage fractal){
    x = posx;
    y = posy;
    diameter= tempD;
    img = fractal;
  }
  
  void ascend(){
   y = y - speed*diameter/200;
   x = x + random(-2,2);
  }  
  
  void display(){
    //stroke(0);
    //fill(127);
    //ellipse(x,y,diameter,diameter);
    imageMode(CENTER);
    image(img,x,y,diameter, diameter);
  }
  
  void pop(){
    if (pow(mouseX-x,2)+pow(mouseY-y,2)<pow(diameter,1.7)){
      diameter = 0;
    }
  }
  
  void top(){
    if (y< diameter/2){
      y = diameter/2;
      speed = -speed;
    } else if (y> height - diameter/2){
      speed = -speed;
      y = height-diameter/2;
    }
  }
  
  void sides(){
    if (x< diameter/2){
      x = diameter/2;
    } else if (y> height - diameter/2){
      x = width - diameter/2;
    }
  }
}
