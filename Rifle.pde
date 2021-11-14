class Rifle {
  
  int width = 210;
  int height = 331;
  PImage rifleImage;
  float posx = mouseX;
  float posy = 450;
  ArrayList<Bullet> bullets;
   
  Rifle(float y){
   posy = y;
   rifleImage = loadImage("rifle.png");
   bullets = new ArrayList<Bullet>();
  }
  
   void shoot(){
     bullets.add(new Bullet(posx, posy));
   }
   
   void update(){
     posx = mouseX; 
     // remove dead bullets
     println("Updating rifle");
     for (int i=bullets.size()-1; i>=0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.alive) {
        println("Updating bulllet");
        bullet.run();
      } else {
        bullets.remove(i);
      }
     }
   }
   
   
   
   void draw(){
     image(rifleImage, mouseX-105, posy, 210, 331);
   }
   
   void run(){
     update();
     draw();
   }
}
  
