//------------------------------------------------------------------------------------
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::::::  DÍDAC BOSCH I ANTONIO CHARNECO  ::::::::::::::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//------------------------------------------------------------------------------------


// CARREGUEM DEL DOCUMENT HTML, TOTS ELS ID'S QUE FAREM SERVIR \\
var vid = document.getElementById("vid");

var boto_PlayPause = document.getElementById("play_pause");
var seekslider = document.getElementById("seekslider");
var curtimetext = document.getElementById("curtimetext");
var durtimetext = document.getElementById("durtimetext");
var mutebtn = document.getElementById("mutebtn");
var volumeslider = document.getElementById("volumeslider");
var fullscreenbtn = document.getElementById("fullscreenbtn");
var forwardbtn = document.getElementById("forwardbtn");
var backwardbtn = document.getElementById("backwardbtn");

// FEM QUE ESTIGUI ATENT A CANVIS ESTABLERTS \\
seekslider.addEventListener("change",vidSeek,false);

vid.addEventListener("timeupdate",seektimeupdate,false);

volumeslider.addEventListener("change",setvolume,false);

// QUAN ES CLIQUI CADA UN DELS SEGÜENTS BOTONS, QUE CARREGUI LA FUNCIÓ \\
boto_PlayPause.onclick = function() { 
    PlayPause();
}

mutebtn.onclick = function() {
    mute();
}

fullscreenbtn.onclick = function() {
    toggleFullScreen();
}

// QUAN ES CLIQUI UN DELS DOS BOTONS, QUE AVANCI O RETROCEDEIXI 10 SEGONS DEL VÍDEO \\
forwardbtn.onclick = function(){
    vid.currentTime = vid.currentTime + 10;
}

backwardbtn.onclick = function(){
    vid.currentTime = vid.currentTime - 10;
}  

// FEM QUE POSI PAUSA O PLAY AL VÍDEO AMB EL MATEIX BOTÓ, A LA VEGADA QUE CANVIA VISUALMENT \\
function PlayPause(){
    if(vid.paused){
        vid.play();
        boto_PlayPause.style.backgroundImage = "url(media/bPausa.png)";
    }
    else{
        vid.pause();
        boto_PlayPause.style.backgroundImage = "url(media/bPlay.png)";
    }
}

// FEM QUE LA BARRA DEL VÍDEO AVANCI AMB EL MATEIX I SI L'USUARI LA TOCA, RESPONGUI EN CONSEQÜÈNCIA \\
function vidSeek(){
    var seekto = vid.duration * (seekslider.value / 100);
    vid.currentTime = seekto;
}

// FEM QUE ESCRIGUI ELS SEGONS QUE DURA EL VÍDEO I ELS SEGONS QUE PORTA REPRODUITS \\
function seektimeupdate(){
    var nt = vid.currentTime * (100 / vid.duration);
    seekslider.value = nt;
    //Utilitzarem la mateixa variable per saber els segons i minuts que portem de vídeo
    var curmins = Math.floor(vid.currentTime / 60);
    var cursecs = Math.round(vid.currentTime - curmins * 60);
    //Utilitzarem la mateixa variable per saber els segons i minuts que dura el vídeo
    var durmins = Math.floor(vid.duration / 60);
    var dursecs = Math.round(vid.duration - durmins * 60);
    
    if (cursecs < 10){
        cursecs = "0" + cursecs;
    }
    
    if(dursecs < 10){
        dursecs = "0" + dursecs;
    }
    
    if (curmins < 10){
        curmins = "0" + curmins;
    }
    
    if(durmins < 10){
        durmins = "0" + durmins;
    }
    
    curtimetext.innerHTML = curmins+":"+cursecs;
    durtimetext.innerHTML = durmins+":"+dursecs;
    
    //Fem que quan el vídeo arribi al final, la imatge de "Play/Pause" sigui la de Play
    if(vid.currentTime == vid.duration){
        boto_PlayPause.style.backgroundImage = "url(media/bPlay.png)";
    }
}

// FEM QUE QUAN ES CLIQUI EL BOTÓ, ES POSI O ES TREGUI EL SO DEL VÍDEO \\
function mute(){
    if(vid.muted){
        vid.muted = false;
        mutebtn.style.backgroundImage = "url(media/bVolum.png)";
        volumeslider.value = 70;
    }
    else{
        vid.muted = true;
        mutebtn.style.backgroundImage = "url(media/bMute.png)";
        volumeslider.value = 0;
    }
}

// FEM QUE SI BAIXES LA BARRA DEL VOLUM A 0, ES CANVII LA IMATGE PER LA DE MUTEJAT \\
function setvolume(){
    vid.volume = volumeslider.value / 100;
    
    if(vid.volume == 0){
        mutebtn.style.backgroundImage = "url(media/bMute.png)";
    }
    else{
        mutebtn.style.backgroundImage = "url(media/bVolum.png)"
    }
}

// SI ES CLICA EL BOTÓ, ES POSA EN PANTALLA COMPLETA \\
function toggleFullScreen(){
    if (vid.requestFullScreen){
        vid.requestFullScreen();
        fullscreenbtn.style.backgroundImage = "url(media/bPantCompl.png)";
    }
    else if(vid.webkitRequestFullScreen){
        vid.webkitRequestFullScreen();
        fullscreenbtn.style.backgroundImage = "url(media/bPantCompl.png)";
    }
    else if (vid.mozRequestFullScreen){
        vid.mozRequestFullScreen();
        fullscreenbtn.style.backgroundImage = "url(media/bPantCompl.png)";
    }
}

