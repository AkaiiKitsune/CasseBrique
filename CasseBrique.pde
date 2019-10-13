import gifAnimation.*;

GifMaker objet;
boolean gif = false;

// ==================================================== //
//Variables
int giff=0;
float briqueWidth = 70;
int briqueHeight = 20;
int minBriques = 50;
int maxBriques = 50;
float dispertion = 5;
float ballSize = 10;
float speedb = 0.2;

//Sets
int nombre;
Brique [] briques = new Brique[maxBriques];
Joueur player1;
Balle ball1;


// ==================================================== //
void setup(){
        objet = new GifMaker(this, "fichier.gif");
        objet.setRepeat(0);

        println("Started Setup");
        size(1000, 600);
        frameRate(120);
        nombre = (int)random(minBriques, maxBriques);
        player1 = new Joueur(600-20, 10);
        ball1 = new Balle(width/2, height/2, 0, 0, ballSize);
        println("This batch will have "+nombre+" bricks");

        //Init the block objects
        float tempx=briqueWidth, tempy=briqueHeight; //temp vars
        println("Temp vars has been set");

        for (int i = 0; i < nombre; i++) { //Init all the blocks
                if (tempx+briqueWidth>width-briqueWidth) { //Checks if the temp position has reached the end of the screen
                        if(tempy % 2 != 0)tempx = briqueWidth; //Starts at the start of the line again
                        else tempx = briqueWidth+briqueWidth/2;
                        tempy += briqueHeight+dispertion; //Increments the temp y position
                }

                briques[i] = new Brique(tempx, tempy, briqueWidth, briqueHeight, true); //Inits the block
                tempx+=briqueWidth+ briqueWidth/2; //Increments the temp position
        }
}


// ==================================================== //
void draw() {
        //BG Color
        background(50);

        //Draws player 1
        player1.dessiner((mouseX-player1.jwidth()/2), 100);

        //Draws the ball
        ball1.dessiner();
        ball1.compute(player1.x, player1.y, player1.jWidth, player1.jHeight);
        //Draws the blocks
        for (int i = 0; i< nombre; i++) {
                briques[i].dessiner();
                briques[i].compute(ball1.x, ball1.y, speedb, ball1.velocity, ball1.velocitx);
        }


        if(giff<10) giff++;
        else gif();
}

void mousePressed(){
        if(mouseButton == LEFT && ball1.velocitx==0) {
                ball1.setVelocity(3);
        }else{
                setup();
                draw();
        }
}

void gif(){
        if(gif){
                giff=0;
                objet.addFrame();
              }
}
