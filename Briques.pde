// ==================================================== //
class Brique {
  /*** Attributes ***/
  float x, y;
  float bWidth;
  float bHeight;
  boolean isAlive;

  // ==================================================== //
  /*** Methods ***/
  Brique(float a, float b, float c, float d, boolean e){     //constructor
          x = a;
          y = b;
          bWidth = c;
          bHeight = d;
          isAlive = e;
  }

  // ==================================================== //
  /*** Functions ***/
  void dessiner(){     //Draws the player
          if(isAlive) rect(x, y, bWidth, bHeight);
  }

  void compute(float bposx, float bposy, float speedb, float velocity, float velocitx){
          if(isAlive &&
            bposx + 2 > x &&
            bposx - 2 < x + bWidth &&
             ((bposy + 2 > y-2 &&
               bposy - 2 < y+2) ||
              (bposy + 2 > y+bHeight-2 &&
               bposy - 2 < y+bHeight+2))) {
                  ball1.velocity=(-velocity+speedb);
                  isAlive=false;
          }
          if(isAlive &&
            ((bposx + 2 > x-1 &&
            bposx - 2 < x+1) ||
            (bposx + 2 > x+bWidth-2 &&
            bposx - 2 < x+bWidth+2)) &&
            bposy + 2 > y &&
            bposy - 2 < y+bHeight) {
                  ball1.velocitx=(-velocitx);
                  ball1.velocity+=speedb;
                  isAlive=false;
          }
  }

  boolean isAlive(){      //Is the player alive ?
          return isAlive;
  }
}
