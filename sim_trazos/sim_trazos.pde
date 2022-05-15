PImage trazos[];
int cantidad = 4;
PImage mascara;
Paleta paleta;

void setup() {
  //size (750, 495);
  size (900, 594);

  paleta = new Paleta ("pintura.jpeg");
  //paleta = new Paleta ("paletaRec.png");
  trazos = new PImage[cantidad];
  mascara = loadImage ("mascara1.png");

  //colorMode(HSB, 360, 100, 100);

  for (int i=0; i<cantidad; i++) {
    String nombre = "trazo" + nf(i, 2) + ".png";
    mascara = loadImage (nombre);
    mascara.filter (INVERT);
    trazos[i] = createImage(280, 900, RGB);
    trazos[i].filter(INVERT);
    trazos[i].mask(mascara);

    /*trazos[i] = loadImage(nombre);
     trazos[i].filter(INVERT);
     trazos[i].mask(trazos[i]);*/
  }
  background(70, 200, 180);
}

void draw() {

  //image (trazos[2], 100, 100);
  int cual = int (random(cantidad));
  float x = random(width-150);
  float y = random(height-370);
  float w = 150;
  float h = random(200, 370);

  tint (paleta.darUnColor());
  image (trazos[cual], x, y, w, h);

  //tint(random(255), random(255), random(255)); -> RGB
  //tint (160, random(250), random(250)); -> HSB
  /*if (random(100)<80){
   tint (160, random(160,70), random(250));
   }else{
   tint (random(200 , 100), 120, 70);
   } -> HSB */

  /*for (int i=0; i<10; i++){
   int cual = int (random(cantidad));
   float x = random(width-150);
   float y = random(height-370);
   float w = 150;
   float h = random(200,370);
   tint (paleta.darUnColor());
   pushMatrix();
   float angulo = radians(map (x,100,width,45,190));
   angulo += radians(random(-10,10));
   translate(x,y);
   rotate(angulo);
   scale(random(0.2,0.5));
   image (trazos[cual], x, y, w, h);
   popMatrix();*/
}
