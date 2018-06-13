/*****************************
Dídac Bosch i Antonio Charneco
*****************************/

//Definint els noms de les imatges per al programa
PImage fons;
PImage jugador1guanyar;
PImage jugador2guanyar;
PImage inici;
PImage inici_comencar;
PImage inici_controls;
PImage inici_opcions;
PImage controls_clicant;
PImage controls_sense_clicar;
PImage ajud_espai;
PImage imatge_fons;
PImage opcions_sense_clicar;
PImage opcions_clicant_enrere;
PImage opcions_clicant_facil;
PImage opcions_clicant_normal;
PImage opcions_clicant_dificil;
PImage guardat;

//Definim el nom de la font que volem utilitzar
PFont f;

//Booleans que ens permetràn ensenyar o treure les imatges
boolean imatge_inici;
boolean iniciar;
boolean controls;
boolean espai_ajuda;
boolean opcions;

boolean clics_inici = true;

//Booleans que ens permetràn activar o desactivar les funcions de les diferents tecles
boolean teclaW = false;
boolean teclaS = false;
boolean teclaI = false;
boolean teclaK = false;
boolean espacio = false;

//Floats (Números amb decimals) que definiràn els moviments de les raquetes i la pilota dintre del joc
float posX;
float posY;
float movimentY;
float movimentX;
float movimentP;
float moviment2;
float vel=7;

//Int (Números sense decimals) que definiràn la puntuació dels dos jugadors.
int puntuacioB;
int puntuacioV;

/*****************************
   INICIALITZEM EL PROGRAMA
*****************************/
void setup() { 
  //Donem una mida a la pantalla
  size(500, 300); 
  
  //Donem uns valors a la posició i el moviment de la pilota
  posX= 250;
  posY= 150;
  movimentY = 0;
  movimentX = 0;
  
  //Donem uns valors de posició a les dos raquetes
  movimentP = 100;
  moviment2 = 100;
  
  //Carreguem la font que utilitzarem en el programa
  f = createFont ("Source Sans Pro Light",36,true);
  
  //Definim el valor de la puntuació
  puntuacioB = 0;
  puntuacioV = 0;
 
  //Carreguem totes les imatges que volem utilitzar en el programa
  fons = loadImage("media/processing/pong/fons.jpg");
  jugador1guanyar = loadImage("media/processing/pong/jugador1guanyar.jpg");
  jugador2guanyar = loadImage("media/processing/pong/jugador2guanyar.jpg");
  inici = loadImage("media/processing/pong/inici.jpg");
  inici_comencar = loadImage("media/processing/pong/inici_comencar.jpg");
  inici_controls = loadImage("media/processing/pong/inici_controls.jpg");
  inici_opcions = loadImage("media/processing/pong/inici_opcions.jpg");
  controls_clicant = loadImage("media/processing/pong/controls_clicant.jpg");
  controls_sense_clicar = loadImage("media/processing/pong/controls_sense_clicar.jpg");
  ajud_espai = loadImage("media/processing/pong/ajud_espai.png");
  opcions_sense_clicar = loadImage("media/processing/pong/opcions_sense_clicar.jpg");
  opcions_clicant_enrere = loadImage("media/processing/pong/opcions_clicant_enrere.jpg");
  opcions_clicant_facil = loadImage("media/processing/pong/opcions_clicant_facil.jpg");
  opcions_clicant_normal = loadImage("media/processing/pong/opcions_clicant_normal.jpg");
  opcions_clicant_dificil = loadImage("media/processing/pong/opcions_clicant_dificil.jpg");
  guardat = loadImage("media/processing/pong/guardat.png");
  
  //Definim que la PImage "imatge_fons" (que no té una imatge assignada) tingui la imatge "inici" assignada
  imatge_fons= inici;
}

/*****************************
   INICIALITZEM EL BUCLE
*****************************/
void draw() {
  //Definim la imatge del menú
  image (imatge_fons,0,0);
  
  //Si el ratolí passa per les coordenades del botó "Començar", cambia la imatge del fons.
  if((mouseX>182)&&(mouseY>136)&&(mouseX<318)&&(mouseY<169)){
    image(inici_comencar,0,0);}
  
  //Si el ratolí passa per les coordenades del botó "Controls", cambia la imatge del fons.
  if((mouseX>182)&&(mouseY>174)&&(mouseX<318)&&(mouseY<206)){
    image(inici_controls,0,0);}
  
  //Si el ratolí passa per les coordenades del botó "Opcions", cambia la imatge del fons.
  if((mouseX>182)&&(mouseY>212)&&(mouseX<318)&&(mouseY<244)){
    image(inici_opcions,0,0);}
  
  //Si controls és "true" posarà la imatge dels controls, i si el ratolí està en aquestes coordenades, cambiarà la imatge de fons.
  if(controls==true){
    image (controls_sense_clicar,0,0);
    if((mouseX>358)&&(mouseY>262)&&(mouseX<494)&&(mouseY<294)){
      image (controls_clicant,0,0);}
  }
  
  
  if(opcions==true){
    image (opcions_sense_clicar,0,0);
    if((mouseX>358)&&(mouseY>262)&&(mouseX<494)&&(mouseY<294)){
      image (opcions_clicant_enrere,0,0);}
    
    if((mouseX>29)&&(mouseY>106)&&(mouseX<140)&&(mouseY<138)){
      image (opcions_clicant_facil,0,0);}
    
    if((mouseX>29)&&(mouseY>145)&&(mouseX<140)&&(mouseY<177)){
      image (opcions_clicant_normal,0,0);}
    
    if((mouseX>29)&&(mouseY>184)&&(mouseX<140)&&(mouseY<216)){
      image (opcions_clicant_dificil,0,0);}
  }
  
    //Si en el menú principal, cliques el botó "començar", la variable "iniciar" és posarà "true" i s'iniciarà el joc.
  if(iniciar==true){
      
    //Definim la imatge de fons
    background(fons);
    
    //Definim la font, la mida i el color i el tamany
    textFont(f,26);
    fill(255);
    textSize(36.6);
    
    //Definim la posició de la puntuació dels dos jugadors
    textAlign(RIGHT);
    text(puntuacioB, 245,32);
    textAlign(LEFT);
    text(puntuacioV, 255,32);
    
    //Prohibim que hi hagi vores als objectes que dibuixem a partir d'aqui
    noStroke();
  
    //Raqueta del jugador 1 
    fill(118,172,284);
    rect(10,movimentP,10,50);
  
    //Raqueta del jugador 2
    fill(118,172,284);
    rect(480,moviment2,10,50); 
  
    //Dibuxem la pilota  
    fill(118,172,284);
    ellipse( posX, posY, 10,10); 
    
    //Quan la pilota toqui el marge superior o inferior definim que "reboti" i vagi en direcció contrària
    if (posY < 47){
      posY = 47;
      movimentY=3;}
    
    if (posY > 290){ 
      posY =290;
      movimentY =-3;}
    
    //Definim els rebots que tindrà la pilota en les diferents paletes
    if ((posX-5<20)&&(posY+5>movimentP)&&(posY+1<movimentP+50)){ 
      movimentX= +vel;}
  
    if ((posX+5>480)&&(posY-5>moviment2)&&(posY-1<moviment2+50)){
      movimentX = -vel;}
  
    //Fem que les paletes del jugador 1 i 2 no es surtin del camp de joc 
    if(movimentP<41){
      teclaW = false;}
  
    if(movimentP>245){
      teclaS = false;}
  
    if(moviment2<41){
      teclaI = false;}
  
    if(moviment2>245){
      teclaK = false;}
      
    //Definim que abans d'iniciar el joc surti un avís, per a clicar la tecla espai
    if(espai_ajuda==true){
      image(fons,0,0);
      filter(BLUR, 2);
      image(ajud_espai,0,0);}

    //Quan la "pilota" surti per l'esquerra, suma un punt a la puntuacio del jugador 2
    if (posX < 0){ 
      posX = 250;
      posY = 150;
      movimentX=3;
      puntuacioV = puntuacioV + 1;}
    
    //Quan la "pilota" surti per la dreta, suma un punt a la puntuacio del jugador 1
    if (posX > 500){
      posX = 250;
      posY = 150;
      movimentX = -3;
      puntuacioB = puntuacioB + 1;}
  
    //Quan el jugador 1 aconsegueix 10 punts, se sobreposa una imatge
    if(puntuacioB == 10){
      movimentX = 0 ;
      movimentY = 0 ;
      image (jugador1guanyar,0,0);}
    
    //Quan el jugador 2 aconsegueix 10 punts, se sobreposa una altre imatge
    if(puntuacioV == 10){
      movimentX = 0 ;
      movimentY = 0 ;
      textSize(36);
      image (jugador2guanyar,0,0);}
    
    //Definim unes variables perque la pilota "reboti"
    posX = posX+movimentX; 
    posY = posY+movimentY;
  
    //Moviment cap amunt de la paleta del jugador 1
    if (teclaW == true) { 
      movimentP = movimentP - 7;}
    
    //Moviment cap avall de la paleta del jugador 1
    if (teclaS == true) { 
      movimentP = movimentP + 7;}
    
    //Moviment cap amunt de la paleta del jugador 2
    if (teclaI == true) { 
      moviment2 = moviment2 - 7;}
    
    //Moviment cap avall de la paleta del jugador 2
    if (teclaK == true) { 
      moviment2 = moviment2 + 7;}

    //Quan cliquem "SPACE" fem que el joc es reinicií (la puntuacio torna a 0 i la pilota i les paletes tornen a la pocicio definida)
    if (espacio == true) {
      movimentX = 3;
      movimentY = 3;
      puntuacioV = 0;
      puntuacioB = 0;
      posX = 250;
      posY = 150;
      movimentP = 150;
      moviment2 = 150;}
  }
}


/**************************
   UTILITZACIÓ DE TECLES
**************************/
void keyPressed() { 
  
  //Definim quines tecles utilitzarem i què faràn quan es mantinguin pulsades
  if ((key == 'W') || (key == 'w')) { 
    teclaW = true;}
    
  if ((key == 'S') || (key == 's')) {
    teclaS = true;}
    
  if ((key == 'I') || (key == 'i')) {
    teclaI = true;}
    
  if ((key == 'K') || (key == 'k')) {
    teclaK = true;}
  
  if ((key == 'q') || (key == 'Q')) {
    iniciar=false;
    clics_inici = true;}
  
  if (key ==' '){
    espacio = true;
    espai_ajuda = false;}
}


void keyReleased() {
  
  //Definim que faran les tecles al deixarles anar
  if ((key == 'W') || (key == 'w')) {
    teclaW = false;}
  
  if ((key == 'S') || (key == 's')) {
    teclaS = false;}
  
  if ((key == 'I') || (key == 'i')) {
    teclaI = false;}
  
  if ((key == 'K') || (key == 'k')) {
    teclaK = false;}
  
  if (key ==' '){
    espacio = false;}
}


/*****************************
   UTILITZACIÓ DE RATOLÍ 
*****************************/
void mousePressed(){
  if(clics_inici == true){
  
    //Si el ratolí clica sobre el botó "Començar", la variable "iniciar" es posi en "true" i per tant, s'inicia el joc
    if((mouseX>182)&&(mouseY>136)&&(mouseX<318)&&(mouseY<169)){
        iniciar = true;
        espai_ajuda=true;
        clics_inici=false;}
  
    //Si el ratolí clica sobre el botó "Començar", la variable "controls" es posa en "true" i per tant, es sobreposa la imatge dels controls
    if((mouseX>182)&&(mouseY>174)&&(mouseX<318)&&(mouseY<206)){
        imatge_fons = inici;
        controls = true;
        clics_inici = false;}
  
    //Si cliques al botó de tornar enrere en la pantalla de controls, la variable "controls" es posa en "false" i per tant, es sobreposa la imatge del menú principal
    if((mouseX>358)&&(mouseY>262)&&(mouseX<494)&&(mouseY<294)){
        controls = false;
        clics_inici=false;}
    
    
    if((mouseX>182)&&(mouseY>212)&&(mouseX<318)&&(mouseY<244)){
        opcions = true;}
  }
  
  if(clics_inici == false){
   
    if((mouseX>358)&&(mouseY>262)&&(mouseX<494)&&(mouseY<294)){
      controls = false;    
      opcions = false;
      clics_inici= true;}
    
    if((mouseX>29)&&(mouseY>106)&&(mouseX<140)&&(mouseY<138)){
       controls = false;    
      opcions = false;
      clics_inici= true;
      vel = 5;
    }
    
    if((mouseX>29)&&(mouseY>145)&&(mouseX<140)&&(mouseY<177)){
       controls = false;    
      opcions = false;
      clics_inici= true;
      vel = 7;
    }
    
    if((mouseX>29)&&(mouseY>184)&&(mouseX<140)&&(mouseY<216)){
       controls = false;    
      opcions = false;
      clics_inici= true;
      vel = 9;
    }
  }
}