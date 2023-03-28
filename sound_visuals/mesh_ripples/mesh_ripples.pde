
int cols = 200;
int rows = 200;
int scl = 30;

float [][] current;// = new float [cols][rows] ;
float [][] previous;// = new float [cols][rows] ;

float dampening = 0.99999;


void setup() {
  size(300,300,P3D);
  cols = width/30;
  rows = height/30;
  current = new float [cols][rows] ;
  previous = new float [cols][rows] ;
  
  current[width/2][height/2] = 2;
}

void mousePressed(){
  current[mouseX][mouseY] = 10;

}


void draw(){
  background(0);
  stroke(255);
  noFill();

  for (int i = 1; i < cols-1; i++){
    for (int j = 1; j <rows-1; j++){
      current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1]) / 2 - 
        current[i][j];
        current[i][j] = current[i][j] * dampening;
    }
  }

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-width/2, -height/2);
 for (int i = 1; i < rows-1 ; i++) {
   
   beginShape(TRIANGLE_STRIP);
   for (int j = 1; j < cols-1 ; j ++) {  
     vertex(j*scl, i*scl, current[j][i]);
     vertex(j*scl, (i+1)*scl, current[i][j]);
   }
   endShape();
 }
 
  updatePixels();
  float[][] temp = previous;
  previous = current;
  current = temp;
  

  
}
