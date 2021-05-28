Fractal[] fractals = new Fractal[15];

void setup(){
  size(1280,720);
  for (int i=0; i<fractals.length;i++){
    fractals[i] =new Fractal(0,0,0.0001*i,50*i);
  }
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  fractals[0].display();
  for (int i=1; i<fractals.length;i++){
    fractals[i].rotation();
    fractals[i].display();
  }
}
