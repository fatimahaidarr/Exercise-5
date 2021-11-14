class Bullet {
  
  float velocity = 10;
  int timestamp;
  boolean alive = true;
  int lifetime = 1000;
  PVector position;
  
  Bullet(float x, float y){
    position = new PVector(x,y );
    timestamp = millis();
  }
  
  void update(){
    position.y -= velocity;
    println("Updating bullet");
    if (alive && millis()>timestamp + lifetime) alive=false;
   
    }
  
 
  
  void draw(){
    ellipse(position.x, position.y, 10, 10);
    stroke(255);
    if (random(1) < 0.5) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
  }
  
  void run(){
    update();
    draw();
  }

  
}
