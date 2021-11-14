PImage background;
PImage bird;
//sound
import processing.sound.*;

SoundFile soundfile;


Rifle rifle;
ArrayList<Bird> birds;
int markTime = 0;
float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float floor;
boolean debug = true;
int birdInterval = 2000;
int MAX_BIRDS = 10;
int score = 0;


void setup(){
  size (800,700);
  floor = height;
  background = loadImage ("background.jpg");
  bird = loadImage ("bird.png");
  rifle = new Rifle(450);
  birds = new ArrayList<Bird>();
  score = 0;
  
  // Sound
  soundfile = new SoundFile(this, "goomba.mp3");
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");
  soundfile.loop();

}

void draw(){
  image(background, 0, 0, 800, 700);
  
  //sound
  float playbackSpeed = map(mouseX, 0, width, 0.25, 4.0);
  soundfile.rate(playbackSpeed);
  
  float amplitude = map(mouseY, 0, width, 0.2, 1.0);
  soundfile.amp(amplitude);
  
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  soundfile.pan(panning);
  
  
  
  
 
  
  // draw score
  textSize(32);
  fill(0,0,0);
  text("" + score, 10, 50);
  
  int t = millis();
   
  if (t > markTime + birdInterval && birds.size() < MAX_BIRDS) {
    birds.add(new Bird());
    markTime = t;
  }
  
  rifle.run();
  
  for (int i=birds.size()-1; i>=0; i--) {
    Bird bird = birds.get(i);
    if (bird.alive) {
      bird.run();
    } else {
      birds.remove(i);
    }
  }
  println("Number of bullets: " + rifle.bullets.size());
  
  surface.setTitle("" + frameRate);
}

boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    score++;
    return true;  
  } else {
    return false;
  }
}
