import processing.sound.*;

//Sound Variables
Waveform waveform;
AudioIn in;
BeatDetector beat;
Amplitude amp;


//Dust
int particles = 300;
Dust dust[] = new Dust[particles];
int radius = 300;

//Hairball variables
//float posX;
//float posY;
int samples = 1000;
//Hairball hairball;
void setup(){
  fullScreen();
  background(0);
  
  //Initializing audio components
  in = new AudioIn(this, 0);
  in.start();
  waveform = new Waveform(this, samples);
  waveform.input(in);
  beat = new BeatDetector(this);
  beat.input(in);
  amp = new Amplitude(this);
  amp.input(in);
  
  //Initializing hairball
  //posX = width/2;
  //posY = height/2;
  //hairball = new Hairball(posX,posY,samples);
  
  //Initializing Dust
  for (int i = 0 ; i<particles ; i++){
    dust[i] = new Dust();
  }
}

void draw(){
  
  background(0);

  waveform.analyze();
  
  //hairball.display();
  
  for (int i = 0 ; i<particles ; i++){
      dust[i].display();
      dust[i].disperse();
      
      //Paints teal links between the dust particles when the volume gets louder.
      for (int j = 0; j<particles-1; j++){
        if (i!=j & sqrt(pow((dust[i].posX-dust[j].posX),2)+pow((dust[i].posY-dust[j].posY),2))<(radius*amp.analyze()+10)){
          stroke(0,128,128);
          strokeWeight(2);
          line(dust[i].posX,dust[i].posY,dust[j].posX,dust[j].posY);
        }
      }
  }

}
