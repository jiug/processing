 int cols,rows;
 int scl =20;
 int w = 2400;
 int h = 1200;
 
 float tilt = 0;
 float flying = 0;
 float speed = 0.025;
 float rot = 0;
 //two dimensional array to store heigths
 float[][] terrain;
 float[][] shade;
 void setup() {
  size(1200,900,P3D);

  cols = w/scl;
  rows = h/scl;
  
  terrain = new float[cols][rows];
  //creates a 2 dimensional array of color shades related to the terrain value
  shade = new float[cols][rows];
}
 void draw(){
   if (key == 's'){
     flying += speed;
   } else {
   flying -= speed;
   }
   

   tilt +=0.01;
  
  
   float yoff = flying;
  for (int y=0; y < rows; y++) {
    float xoff = 0;
     for (int x=0; x < cols; x++) {
      terrain[x][y]= map(noise(xoff,yoff),0,1,-127,127);
      shade[x][y] = terrain[x][y];
      xoff += 0.1;     
   }
   yoff += 0.1;
  }
   background(0);
   noFill();
   
   //Rotate the plane in a visible way
   translate(width/2,height/2);
   rotateX(PI/3);
   
   if (key == 'a'){
     rot += 0.01;
   } else if(key == 'd'){
     rot -= 0.01;
   } else if (keyPressed == false){
     rot += 0;
   }
   rotateZ(rot);
   
   //rotateX(PI/3+0.25*sin(tilt));
   //rotateY(0.25*sin(flying/10));
   //Center the plane after the rotation
   translate(-w /2,-h/2);
   for (int y=0; y < rows-1; y++) {
     
     beginShape(TRIANGLE_STRIP);
     for (int x=0; x < cols; x++) {
       //paints the height in shades of gray
       stroke(127+2*shade[x][y]);
       vertex(x*scl, y*scl, terrain[x][y]);
       vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
     }
     endShape();
   }
}
