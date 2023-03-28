 import processing.sound.*;

 FFT fft;
 AudioIn in;
 int bands = 1024;
 float[] spectrum = new float[bands];


 int cols,rows;
 int scl =12;
 int w = 2048;
 int h = 4800;

 float speed = 0.020;
 float rot = 0;
 //two dimensional array to store heigths
 float[][] terrain;
 
void setup() {
  fullScreen(P3D);
  
  cols = w/scl;
  rows = h/(scl);
  
  terrain = new float[bands][rows];
  
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}
 void draw(){
   background(0);
   fft.analyze(spectrum);
   noFill();
   
   // Generate the terrain array
   // Refreshing like an old TV
   int which = frameCount % rows;
   for (int x=0; x < cols; x++) {
     terrain[x][which]= map(spectrum[x],0,1,0,10000);
   }
  
   // Flying over mountains
   
   //for (int y=0; y < rows-1; y++) {
   //  for (int x=0; x < cols; x++) {
   //    terrain[x][y+1]=terrain[x][y];
   //  }
   //}
   
   // All the lines represent the same spectrum
   //for (int y=0; y<rows-1; y++){
   //  if (y==0){
   //    for (int x=0; x < cols; x++) {
   //      terrain[x][0]= map(spectrum[x],0,1,0,10000);
   //    }
   //  } else {
   //    for (int x=0; x < cols; x++) {
   //      terrain[x][y]=terrain[x][y-1];
   //    }
   //  }
   //}
   //Rotate the plane in a visible way
   translate(width/2,height/2);
   rotateX(PI/3);
   
   //Interact with the keyboard
   if (key == 'a'){
     rot += 0.01;
   } else if(key == 'd'){
     rot -= 0.01;
   } else if (keyPressed == false){
     rot += 0;
   }
   rotateZ(rot);
  
   //Center the plane after the rotation
   translate(-w/2,-h/2);
   //Actual drawing 
   for (int y=0; y < rows-1; y++) {
     beginShape();
     for (int x=0; x < cols; x++) { 
       if (x< cols/2){
         
         stroke(terrain[cols/2-x][y],terrain[cols/2-x][y],terrain[cols/2-x][y]);
         vertex(x*scl, 0.5*y*scl, terrain[cols/2-x][y]);
         //vertex(x*scl, (y+1)*scl, terrain[cols/2-x][y+1]);         
       }
       else{
         stroke(terrain[x-cols/2][y],terrain[x-cols/2][y],terrain[x-cols/2][y]);
         vertex(x*scl, 0.5*y*scl, terrain[x-cols/2][y]);
         //vertex(x*scl, (y+1)*scl, terrain[x-cols/2][y+1]);
       }
     }
     endShape();
   } 
}
