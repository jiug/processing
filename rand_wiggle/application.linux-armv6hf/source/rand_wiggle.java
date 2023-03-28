import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class rand_wiggle extends PApplet {

Ball[] balls = new Ball[200]; 

int total = 10;

public void setup(){
  background(0,0,0);
  
  for (int i=0; i<balls.length; i++){
    balls[i] = new Ball(random(10,30));
  }

}

public void draw(){
  for (int i=0; i<total; i++){
    balls[i].display();
    balls[i].drift();
    balls[i].moveBall();
    balls[i].checkEdges();
    balls[i].changeColor();
  }
}

public void mousePressed(){
  if (total < balls.length){
    total = total + 1;
  }
}

public void keyPressed(){
 total = total -1;
 if (key == BACKSPACE){
   exit();
 }
}
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
  
  public void drift(){
    x++;
  }
  
  public void display(){
   stroke(0);
   fill(a,b,c);
   ellipse(x,y,diameter,diameter);
  }
  
  public void checkEdges(){
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
  public void moveBall(){                                                                                                  
    x = x + random(-3,3);
    y = y + random(-3,3);
  }
  public void changeColor(){
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
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rand_wiggle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
