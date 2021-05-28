class Ball{
  float x;
  float y;
  float a;
  float b;
  float c;
  float diameter;
  
  Ball (float tempD){
    x = random(0,width);
    y = random(0,height);
    a = 127;
    b = 127;
    c = 127;
    diameter = tempD;
  }
  
  void drift(){
    x++;
  }
  
  void display(){
   stroke(0);
   fill(a,b,c);
   ellipse(x,y,diameter,diameter);
  }
  
  void checkEdges(){
    if (x >= width){
      x = 0;
    }
    else if (x <= 0){
      x = width;
    }
    if (y >= height){
      y = 0;
    }
    else if (y <= 0){
      y = height;
    }
  }
  void moveBall(){                                                                                                  
    x = x + random(-3,3);
    y = y + random(-3,3);
  }
  void changeColor(){
    a = (a + random(-2,2))%255;
    if (a < 0){
      a = 255;
    }
    b = (b + random(-2,2))%255;
    if (b < 0){
      b = 255;
    }
    c = (c + random(-2,2))%255;
    if (c < 0){
      c = 255;
    }
  }
}
