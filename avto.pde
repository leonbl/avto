Vehicle v;
PImage myImage;
boolean obrni = true;
int cnt = 0;
float heading;
float posX, posY;
float h;

void setup() {
  size(600, 600);
  myImage = loadImage("labirint.jpg");
  v = new Vehicle(50, 50);
  heading = v.getHeading();
  v.setHeading(-90);
  v.printHeading();
}

void draw() {
  background(255);
  image(myImage, 0, 0);

  posX = v.position.x;
  posY = v.position.y;

  int razdaljaY=0;
  while(get((int)posX,(int)posY)!=0xff000000){
    point(posX,posY);
    posY++;
    razdaljaY++;
  } //<>//
  
  posX = v.position.x;
  posY = v.position.y;
  int razdaljaX=0;
  while(get((int)posX,(int)posY)!=0xff000000){
    point(posX,posY);
    posX++;
    razdaljaX++;
  }
  //println("dx="+razdaljaX+" dy="+razdaljaY);
  
  if(razdaljaX<20){
      v.setHeading(95);
      h = v.getHeading();
  }
    
  v.update();
  v.display();
  text(h, 10,40);
  text("x: ",0,50);
  text(razdaljaX, 10,50);
  text("y: ",0,60);
  text(razdaljaY, 10,60);
}
