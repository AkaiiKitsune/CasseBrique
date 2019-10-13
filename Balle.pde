// ==================================================== //
class Balle {
  /*** Attributes ***/
  float x, y;
  float velocity;
  float velocitx;
  float size;

  // ==================================================== //
  /*** Methods ***/
  Balle(float a, float b, float c, float d, float e){     //constructor
          x = a;
          y = b;
          velocitx = c;
          velocity = d;
          size = e;
  }

  // ==================================================== //
  /*** Functions ***/
  void dessiner(){     //Draws the player
          ellipse(x, y, size, size);
  }

  void compute(float jposx, float jposy, float jWidth, float jHeight){
          x+=velocitx;
          y+=velocity;
          if (x<0 || x>width) velocitx=-velocitx;
          if (y<0+size) {
            velocity=-velocity;
          }

          if(x + size*0.5 > jposx &&
             y + size*0.5 > jposy &&
             x - size*0.5 < jposx + jWidth &&
             y - size*0.5 < jposy + jHeight) {
                  setVelocity(-velocity);
                  setVelocitx(-((jposx+jWidth/2)-x)*0.1);
          }
  }

  void setVelocity(float a){
          velocity = a;
  }

  void setVelocitx(float a){
          velocitx = a;
  }
}
