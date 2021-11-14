class Bird {
  PVector position, target;
  float movementSpeed = 0.01;
  float xMargin = 200;
  float yMargin = 155;
  boolean alive = true;
  boolean isLeft;
  PVector birdSize = new PVector (72, 109);
  PImage birdGif[];
  int birdFrame;
  int N = 12;
  
  
  Bird(){
    birdGif = new PImage[12];
    for(int i=0;i<birdGif.length;i++){
      birdGif[i] = loadImage("bird_frame_rates/ezgif.com-gif-maker-" + str(i) + ".png");
      birdGif[i].resize(72, 109);
    }
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin*2);
    float x1, x2;
    if (pickSide < 0.5) {
      isLeft = true;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      isLeft = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  
    target = new PVector(x2, y);  
  }
  
  void update(){
    if (position.dist(target) < 5) alive = false;
    
    for (Bullet bullet : rifle.bullets) {
      if (alive && hitDetectRect(position, bullet.position, birdSize)) {
        alive = false;
      }
        
      if (alive) position.lerp(target, movementSpeed);;
      }
  }
      
  void draw(){
    birdFrame = (birdFrame + 1) % N;
    image (birdGif[birdFrame],position.x,position.y);
  }
  
  void run(){
    update();
    draw();
  }
  
}
        
        
    
