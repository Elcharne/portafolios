int cols = 9;
int rows =5;
int mov3=1;
int movy2=1;
int movY=0;
int y3;
boolean direccion = true;
boolean bajar = false;

PImage ajud_espai;
PImage nave;
PImage enemigo;
PImage fondo;
PImage portada;
PImage guardado;

boolean espacio = false;
boolean inicio = true;
boolean juego = false;
boolean p_perder = false;
boolean p_ganar = false;

PFont fuente;

boolean viu=true;

int vidas = 5;
int puntuacio;
naves player;
enemigos[][] enemigos1 = new enemigos[cols][rows];

//ArrayList enemigo = new ArrayList();
ArrayList balas = new ArrayList();
ArrayList <balaE> balasE = new ArrayList<balaE>();



void setup() {
  size(1000, 600);
  portada = loadImage("media/processing/space_web/images/portada.png");
  nave = loadImage("media/processing/space_web/images/SI_Nau.png");
  enemigo = loadImage("media/processing/space_web/images/SI_Enemic.png");
  fondo = loadImage("media/processing/space_web/images/SI_Fons.png");
  ajud_espai = loadImage("media/processing/space_web/images/ganar.png");
  guardado = loadImage("media/processing/space_web/images/perder.png");
  
  fuente = createFont ("Letter Gothic Std",32,true);
  

  player = new naves();
  crear_enemigos();
}
void crear_enemigos(){
  
for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      enemigos1[i][j]= new enemigos((i*50)+50, (j*50)+50);
    }
  }


}

void draw() {

  



  if (inicio==true) {
    image (portada, 0, 0);
    
  }
  if (p_perder == true){
    image (guardado, 0, 0);
    inicio = false;
    crear_enemigos();
    }
    
    if (p_ganar == true){
    image (ajud_espai, 0, 0);
    inicio = false;
    crear_enemigos();
    }

  if (juego == true) {
    background(fondo);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        enemigos1[i][j].createE();
        enemigos1[i][j].movimientoE(mov3);
        enemigos1[i][j].bajarE(movY);
        enemigos1[i][j].morirE();
        enemigos1[i][j].dispararE();

        if (enemigos1[i][j].ENE_x + enemigos1[i][j].ENE_w > width) {
          direccion= false;
          bajar=true;
        }

        if (enemigos1[i][j].ENE_x - enemigos1[i][j].ENE_w < -50) {
          direccion= true;
          bajar= true;}
          
          if (enemigos1[i][j].ENE_y - enemigos1[i][j].ENE_w > 400) {
          viu = false;
        }
      }
    } 
    
    
    
    textFont(fuente,26);
    fill(183,183,183);
    textSize(16);
    
    
    
    textAlign(RIGHT);
    text(puntuacio, 985,582);
  
    textAlign(RIGHT);
    text(vidas, 223,582);
    
    if(vidas == 0){
    juego = false;
    p_perder = true;
    }
    
    if(viu == false){
    juego = false;
    p_perder = true;
    }
    
    if(puntuacio == 450){
    juego = false;
    p_ganar = true;
    }
    
    
    
    if (direccion == false) {
      mov3 = - 3;
    } else if ( direccion== true) {
      mov3 = 3;
    }


    if (bajar == true) {
      movY = movY + 10;
      bajar = false;
    } else if (bajar == false) {
      movY = 0;
    }

  player.drawN();
    player.morirN();
    

    for (int i = 0; i < balas.size(); i++) {
      bala bala = (bala) balas.get(i);
      bala.drawB();
    }
    
    for (int i = 0; i < balasE.size(); i++) {
      balaE bala = (balaE) balasE.get(i);
      bala.drawBE();
    }
  }
}

void keyPressed() { 
  
  if (key ==' ') {
    inicio = false;
    juego = true;
     p_perder = false;
    vidas = 5;
    viu = true;
    p_ganar = false;
    puntuacio = 0;
    
  }
}

class bala {
  int BALA_x, BALA_y;

  bala(int xpos, int ypos) {
    BALA_x = xpos + 22;
    BALA_y = ypos - 12;
  }

  void drawB() {
    fill(255,252,182);
    noStroke();
    rect(BALA_x, BALA_y, 4, 15);
    
    BALA_y -= 10;
  }
}

class balaE {
  int BALAE_x, BALAE_y;

  balaE(int xpos, int ypos) {
    BALAE_x = xpos + 20;
    BALAE_y = ypos - 25;
  }

  void drawBE() {
    fill(255,252,182);
    noStroke();
    rect(BALAE_x, BALAE_y, 4, 15);
    
    BALAE_y += 10;
  }
}

class enemigos {
  int ENE_x, ENE_w, ENE_h, ENE_mov, ENE_in;
  int ENE_movy, ENE_y;
  boolean viue = true;
  boolean ENE_dispara = true;
  enemigos(int  x2, int y2) {
    ENE_x = x2;
    ENE_y = y2;
    ENE_w = 50;
    
    
  }
  void createE() {
    if (viue == true) {
      fill(255);
      image(enemigo, ENE_x, ENE_y, ENE_w, ENE_w);
    }
  }
  void movimientoE(int mov2) {

    ENE_mov = mov2;
    ENE_x= ENE_x+ mov2;
  }

  void bajarE(int movBajar) {
    ENE_movy = movBajar;
    ENE_y = ENE_y+ ENE_movy;
  }
  void morirE() {
    if (viue == true) {
      for (int i=0; i<balas.size(); i++) {
        bala b = (bala) balas.get(i);
        float distancia=dist(b.BALA_x, b.BALA_y, ENE_x+40, ENE_y+20);
        if (distancia<25) {
          viue=false;
          balas.remove(i);
          puntuacio = puntuacio + 10;
        }
      }
    }
  }
  void dispararE() {
    if (viue){
      ENE_in=round(random(1000));
      if (ENE_in==50) {
        ENE_dispara = true;
        if (ENE_dispara == true) {
          balasE.add(new balaE(ENE_x, ENE_y));
          ENE_dispara = false;
        }
      }
    }
  }
}



class naves {
  int NAVE_x = 500, NAVE_y;
  boolean Dispara = true;
  
  int delay = 0;
  

  void drawN() {
    if (viu == true) {
      moverseN();
      dibujaN(NAVE_x, NAVE_y);
      NAVE_y=500;
    }
  }
  void moverseN() {
    if (keyPressed && keyCode == LEFT && NAVE_x>0+5) NAVE_x -= 5;
    if (keyPressed && keyCode == RIGHT && NAVE_x<width-50) NAVE_x += 5;
    if (keyPressed && keyCode == CONTROL && Dispara) {
      balas.add(new bala(NAVE_x, NAVE_y));
      Dispara = false;
      delay = 0;
    }

    delay++;
    if (delay >= 35) {
      Dispara = true;
    }
  }


  void dibujaN(int DIV_x, int DIV_y) {
    image(nave, DIV_x, DIV_y, 50, 50 );
  }
  void morirN() {
    if (viu) {
      for (int i=0; i<balasE.size(); i++) {
        balaE b = (balaE) balasE.get(i);
        float distancia=dist(b.BALAE_x, b.BALAE_y, NAVE_x+40, NAVE_y+20);
        if (distancia<25) {
          vidas = vidas - 1;
          balasE.remove(i);}
          if (vidas == 0){
          viu=false;}
         
          
        }
      }
    }
  }