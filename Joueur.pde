// ==================================================== //
class Joueur {
  /*** Attributes ***/
  float x, y;
  float jWidth;
  float jHeight;

  // ==================================================== //
  /*** Methods ***/
  Joueur(float a, float b){   //constructor
          y = a;
          jHeight = b;
  }

  // ==================================================== //
  /*** Functions ***/
  void dessiner(float a, float b){
          x = a;
          jWidth = b;
          rect(x, y, jWidth, jHeight);
  }

  float jwidth(){
          return jWidth;
  }
}
