class Dust{
  float posX;
  float posY;
  float xoff;
  float yoff;
  float speed = 0.0001;
  
  //Constructor
  Dust(){
    posX = random(width);
    posY = random(height);
    xoff = random(1000);
    yoff = random(1000);  
  }
  
  void display(){
    //stroke(map(amp.analyze(),0,0.15,127,255),140,map(amp.analyze(),0,0.15,127,0));
    stroke(255);
    //strokeWeight(map(amp.analyze(),0,0.15,5,10));
    strokeWeight(6);
  }
  
  void disperse(){
    xoff += speed+map(amp.analyze(),0,0.15,0,0.006);
    yoff += speed+map(amp.analyze(),0,0.15,0,0.006);

    posX +=  map(noise(xoff),0,1,-2,2);
    posY +=  map(noise(yoff),0,1,-2,2);
    
    if (posX <= 0){
      posX = width;
    } else if (posX >= width){
      posX = 0;
    }
    if (posY <= 0){
      posY = height;
    } else if (posY >= height){
      posY = 0;
    }
  }

}
