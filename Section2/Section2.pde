import java.io.*;
import java.util.*;

int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Pascal's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    if (levels != 0) {
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
      
      float distX = Math.abs(v2x-v1x)/2;
      float distY = Math.abs(v2y-v1y)/2;
      float p1x = ((v1x+v2x)/2);
      float p1y = ((v1y+v2y)/2);
      float p2x = ((v3x+v2x)/2);
      float p2y = ((v3y+v2y)/2);
      float p3x = ((v1x+v3x)/2);
      float p3y = ((v1y+v3y)/2);
      gasket(levels-1,v1x,v1y,p1x,p1y,p3x,p3y);
      gasket(levels-1,v2x,v2y,p1x,p1y,p2x,p2y);
      gasket(levels-1,v3x,v3y,p2x,p2y,p3x,p3y);
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
