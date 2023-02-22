int pointX = 0;
int pointY = 0;
int pointSize = 30;
int pointCorner = 10;
color pointColor = color(255, 255, 255);

int crosshairSize = 10;
color crosshairColor = color(255, 0, 0);

PFont scoreFont;
int scoreFontSize = 32;
String scoreFontPath = "/usr/share/fonts/TTF/Noto Sans SemiBold Nerd Font Complete.ttf";
int score = 0;
int scoreX = 15;
int scoreY = 10 + scoreFontSize;
color scoreColor = color(0, 408, 612);

boolean pointOnCircle(int pointX, int pointY, int circleX, int circleY, int circleR) {  
  return ((pointX - circleX) * (pointX - circleX) + (pointY - circleY) * (pointY - circleY)) <= (circleR * circleR);
}
void randomizePoint() {
  pointX = int(random(int(pointCorner + pointSize), int(640 - pointCorner - pointSize)));
  pointY = int(random(int(pointCorner + pointSize), int(480 - pointCorner - pointSize)));
}
void setup() {
  size(640, 480);  
  scoreFont = createFont(scoreFontPath, scoreFontSize);
  randomizePoint();
}
void draw() {
  background(0); // clear screen
  fill(pointColor); // target
  circle(pointX, pointY, pointSize); 
  fill(crosshairColor); // crosshair
  circle(mouseX, mouseY, crosshairSize); 
  fill(scoreColor); // score
  textFont(scoreFont);
  text("Score: " + str(score), scoreX, scoreY); 
}
void mouseClicked() {
  if (pointOnCircle(mouseX, mouseY, pointX, pointY, pointSize)) {
    score++;
    randomizePoint();
  }
}
