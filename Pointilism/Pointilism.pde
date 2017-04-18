
PImage image;

void setup(){
  size(600,800);
  image = loadImage("IMG_0040.JPG");
 // image(image,0,0);
 // image.load.Pixels();
  //println(image.pixels.length);

}
void draw() {
  randomPointilism();
}
void randomPointilism() {
int x = (int)random(0, width);
int y = (int)random(0, height);
color c = image.get(x,y);
fill(c);
noStroke();
ellipse(x, y, 15, 15);
}

void pointilism() {
  for (int y = 0; y < height; y = y + 30) {
  for (int x = 0; x < width; x = x +30) {
  color c = image.get(x, y);
  fill(c);
  ellipse(x, y, 30, 30);
    }
  }
}