PImage myImage; //<>//
boolean obrni = true;
int cnt = 0;
float heading;
float posX, posY;
float h;
Vehicle v = new Vehicle(60, 60);
float R = 15; // Referenca - željena oddaljenost od stene
float e, u, up ,ui, ud, et, es;
float Kp = -0.06;
float Ki = -0.01;
float Kd = -0.03;
float T = 0.02;
float kot = 0;

void setup() {
  size(600, 600);
  myImage = loadImage("labirint.jpg");

  heading = v.getHeading();
  //v.setHeading(90);
  v.printHeading();
}

void draw() {
  background(255);
  image(myImage, 0, 0);

  PVector p = new PVector();
  PVector s = v.distanceV(); // enotin vektor v smeri vožnje
  PVector d = v.distanceV();
  d.rotate(PI/2);            // enotin vektor pravokoten na smer vožnje

  p = v.position.copy();
  p.add(s);
  int dFront=0;
  while (get((int)p.x, (int)p.y)!=0xff000000) {
    point(p.x, p.y);
    p.add(s);
    //println(d.x+" "+d.y);
    dFront++;
    if (dFront > 400) break;
  }

  p = v.position.copy();
  p.add(d);
  int dRight=0;
  while (get((int)p.x, (int)p.y)!=0xff000000) {
    point(p.x, p.y);
    p.add(d);
    dRight++;
    if (dRight > 400) break;
  }

  e = R - dRight;
  up = Kp*e;
  es = es + e;
  ui = Ki*T*es;
  ud = Kd*(e-et)/T;
  u = up + ui + ud;
  
  if(dFront<20)
     v.setHeading(-50);
     
  v.setHeading(u);
  et = e;

  v.update();
  v.display();

  text("up: ", 50, 50);
  text(up, 80, 50);
  text("dFront: ", 50, 60);
  text(dFront, 90, 60);
  text("dRight: ", 50, 70);
  text(dRight, 90, 70);
}
