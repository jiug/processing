Ball[] balls = new Ball[200]; 

int total = 10;

void setup(){
  background(0,0,0);
  fullScreen();
  for (int i=0; i<balls.length; i++){
    balls[i] = new Ball(random(10,30));
  }

}

void draw(){
  for (int i=0; i<total; i++){
    balls[i].display();
    balls[i].drift();
    balls[i].moveBall();
    balls[i].checkEdges();
    balls[i].changeColor();
  }
}

void mousePressed(){
  if (total < balls.length){
    total = total + 1;
  }
}

void keyPressed(){
 total = total -1;
 if (key == BACKSPACE){
   exit();
 }
}
