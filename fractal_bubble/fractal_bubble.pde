Bubble[] bubbles = new Bubble[10];

void setup() {
  size(1280,720);
  for (int i=0; i<bubbles.length; i++){
    bubbles[i] = new Bubble(random(width),height,random(100,200));
  }
}
void draw() {
  background(255);
  for (int i=0; i<bubbles.length; i++){
    bubbles[i].ascend();
    bubbles[i].display();
    bubbles[i].top();
  }
}

void mousePressed(){
 for(int i=0;i<bubbles.length;i++){
   bubbles[i].pop();
 }
}
