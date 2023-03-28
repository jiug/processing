import peasy.*;

float x = 0;
float y = 0;
float z = 0;
int n = 10000;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup(){
  size(1080,720,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  for( int i=0; i<n; i++){
    x = random(-100,100);
    y = random(-100,100);
    z = random(-100,100);
    points.add(new PVector(x,y,z));
  }
}

void draw(){
  float hu = 0;
  background(0);
  strokeWeight(3);
  noFill();
  beginShape();
  for (PVector v: points) {
    hu = sqrt(v.x*v.x+v.y*v.y+v.z*v.z);
    if (hu > 255){
      hu = 0;
    }
    stroke(hu,255,255);
    point(v.x, v.y , v.z);
    PVector offset = PVector.random3D();
    v.add(offset);
  }
}
