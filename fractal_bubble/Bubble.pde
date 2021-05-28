class Bubble{
  float x;
  float y;
  float diameter;
  PImage tree;
  Bubble(float posx , float posy,float tempD){
    x = posx;
    y = posy;
    diameter= tempD;
    tree = loadImage("fractal1.png");
  }
  
  
  void ascend(){
   y = y - 200/diameter;
   x = x + random(-2,2);
  }  
  
  void display(){
    //stroke(0);
    //fill(127);
    //ellipse(x,y,diameter,diameter);
    imageMode(CENTER);
    image(tree,x,y,diameter, diameter);
  }
  
  void pop(){
    diameter= diameter*2;
  }
  void top(){
    if (y< diameter/2){
      y = diameter/2;
    }
  }
}
