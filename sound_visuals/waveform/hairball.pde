class Hairball{
  float posX;
  float posY;
  int samples;
  int size;
  float scale = 0.1;
  
  //Constructor
  Hairball(int s){
    samples = s;
  }
  
  void display(float x, float y, float size){
    posX = x;
    posY = y;
    stroke(127,map(amp.analyze(),0,0.15,127,255),127);
    strokeWeight(2);
    noFill();
   
    beginShape();
    for(int i = 0; i < samples; i++)
    {
      vertex(
        //Circular waveform
        //The size of the splattered thinguie gets modulated by the amplitude of the waveform
        map(waveform.data[i], -0.125, 0.125, 0, exp(map(amp.analyze(),0,0.15,size,size*scale)))*cos(2*PI/samples*i)+posX,
        map(waveform.data[i], -0.125, 0.125, 0, exp(map(amp.analyze(),0,0.15,size,size*scale)))*sin(2*PI/samples*i)+posY
        );
    }
    endShape();
   }
}
