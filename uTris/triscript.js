var turno1pEnum = {
    PLAYER: "PLAYER",
    PC: "PC",
}
var turno2pEnum = {
    P1: "P1",
    P2: "P2",
}
var turno1p = turno1pEnum.PLAYER
var turno2p = turno2pEnum.P1

var rowA2p = 0      //-> to array?
var rowB2p = 0
var rowC2p = 0
var col12p = 0
var col22p = 0
var col32p = 0
var diagX2p = 0
var diagY2p = 0

var victory2p = false
var victory1p = false


function click2p(idCell, idImg, row, col, diag) {
    //if someone has already won - se qualcuno ha già vinto
    if (!victory2p) {

        //first player's turn - turno giocatore 1
        if (turno2p === turno2pEnum.P1) {
            if (idImg.source+"-" === "-") {
                idImg.source = "logo-ubuntu.svg"
                turno2p = turno2pEnum.P2
                textTurn2p.text = turno2p === turno2pEnum.P1 ? i18n.tr("It's the turn of the player 1") : i18n.tr("It's the turn of the player 2")
                if (row === "A") {rowA2p++; textA.text = "A: "+rowA2p}
                else if (row === "B") {rowB2p++; textB.text = "B: "+rowB2p}
                else if (row === "C") {rowC2p++; textC.text = "C: "+rowC2p}
                if (col === 1) {col12p++; text1.text = "1: "+col12p}
                else if (col === 2) {col22p++; text2.text = "2: "+col22p}
                else if (col === 3) {col32p++; text3.text = "3: "+col32p}
                if (diag === "DX-Y") {diagX2p++; diagY2p++; textX.text = "X: "+diagX2p; textY.text = "Y: "+diagY2p}
                else if (diag === "DX") {diagX2p++; textX.text = "X: "+diagX2p}
                else if (diag === "DY") {diagY2p++; textY.text = "Y: "+diagY2p}
                checkVictory2p1()
            }
            else wrong.start()
        }

        //second player's turn - turno giocatore 2
        else if (turno2p === turno2pEnum.P2) {
            if (idImg.source+"-" === "-") {
                idImg.source = "logo-ubuntuW.svg"
                turno2p = turno2pEnum.P1
                textTurn2p.text = turno2p === turno2pEnum.P1 ? i18n.tr("It's the turn of the player 1") : i18n.tr("It's the turn of the player 2")
                if (row === "A") {rowA2p--; textA.text = "A: "+rowA2p}
                else if (row === "B") {rowB2p--; textB.text = "B: "+rowB2p}
                else if (row === "C") {rowC2p--; textC.text = "C: "+rowC2p}
                if (col === 1) {col12p--; text1.text = "1: "+col12p}
                else if (col === 2) {col22p--; text2.text = "2: "+col22p}
                else if (col === 3) {col32p--; text3.text = "3: "+col32p}
                if (diag === "DX-Y") {diagX2p--; diagY2p--; textX.text = "X: "+diagX2p; textY.text = "Y: "+diagY2p}
                else if (diag === "DX") {diagX2p--; textX.text = "X: "+diagX2p}
                else if (diag === "DY") {diagY2p--; textY.text = "Y: "+diagY2p}
                checkVictory2p2()
            }
            else wrong.start()
        }
    }
}

function click1p(idCell, idImg, row, col, diag) {
    //if someone has already won - se qualcuno ha già vinto
    if (!victory1p) {
        
        //player's turn - turno giocatore
        if (turno1p === turno1pEnum.PLAYER) {
            if (idImg.source+"-" === "-") {
                idImg.source = "logo-ubuntu.svg"
                turno1p = turno1pEnum.PC
                textTurn1p.text = turno1p === turno1pEnum.PLAYER ? i18n.tr("It's your turn") : i18n.tr("It's the turn of the PC")
                if (row === "A") {rowA1p++; }//textA.text = "A: "+rowA2p}
                else if (row === "B") {rowB1p++; }//textB.text = "B: "+rowB2p}
                else if (row === "C") {rowC1p++; }//textC.text = "C: "+rowC2p}
                if (col === 1) {col11p++; }//text1.text = "1: "+col12p}
                else if (col === 2) {col21p++; }//text2.text = "2: "+col22p}
                else if (col === 3) {col31p++; }//text3.text = "3: "+col32p}
                if (diag === "DX-Y") {diagX1p++; diagY2p++; }//textX.text = "X: "+diagX2p; textY.text = "Y: "+diagY2p}
                else if (diag === "DX") {diagX1p++; }//textX.text = "X: "+diagX2p}
                else if (diag === "DY") {diagY1p++; }//textY.text = "Y: "+diagY2p}
                checkVictory2p1()
            }
            else wrong.start()
        }
        
        //pc's turn - turno pc
        /*?else*/ if (turno1p === turno1pEnum.PC) {
            //chech maggiore -> how?
            if (rowA1p != 3 && rowA1p > rowB1p && rowB1p > rowC1p) {
                //controllo spazi liberi
                if (imgpA1.source+"-" === "-") {
                    imgpA1.source = "logo-ubuntuW.svg"
                    turno1p = turno1pEnum.PLAYER
                    textTurn1p.text = turno1p === turno1pEnum.PLAYER ? i18n.tr("It's your turn") : i18n.tr("It's the turn of the PC")
                }
            if (rowB1p != 3 && rowB1p > rowA1p && rowA1p > rowC1p) {
                else if (imgpB1.source+"-" === "-") {
                    imgpB1.source = "logo-ubuntuW.svg"
                    turno1p = turno1pEnum.PLAYER
                    textTurn1p.text = turno1p === turno1pEnum.PLAYER ? i18n.tr("It's your turn") : i18n.tr("It's the turn of the PC")
                }
            }
        }
    }
}

function checkVictory2p1() {
    if (rowA2p === 3) {player1Won2p(); ppA1.color=ppA2.color=ppA3.color=UbuntuColors.green}
    else if (rowB2p === 3) {player1Won2p(); ppB1.color=ppB2.color=ppB3.color=UbuntuColors.green}
    else if (rowC2p === 3) {player1Won2p(); ppC1.color=ppC2.color=ppC3.color=UbuntuColors.green}
    else if (col12p === 3) {player1Won2p(); ppA1.color=ppB1.color=ppC1.color=UbuntuColors.green}
    else if (col22p === 3) {player1Won2p(); ppA2.color=ppB2.color=ppC2.color=UbuntuColors.green}
    else if (col32p === 3) {player1Won2p(); ppA3.color=ppB3.color=ppC3.color=UbuntuColors.green}
    else if (diagX2p === 3) {player1Won2p(); ppA1.color=ppB2.color=ppC3.color=UbuntuColors.green}
    else if (diagY2p === 3) {player1Won2p(); ppA3.color=ppB2.color=ppC1.color=UbuntuColors.green}
}
function player1Won2p() {
    textVictory2p.text = i18n.tr("Player 1 has win"); victory2p = true; textTurn2p.text=i18n.tr("Game ended")
}

function checkVictory2p2() {
    if (rowA2p === -3) {player2Won2p();ppA1.color=ppA2.color=ppA3.color=UbuntuColors.green}
    else if (rowB2p === -3) {player2Won2p();ppB1.color=ppB2.color=ppB3.color=UbuntuColors.green}
    else if (rowC2p === -3) {player2Won2p();ppC1.color=ppC2.color=ppC3.color=UbuntuColors.green}
    else if (col12p === -3) {player2Won2p();ppA1.color=ppB1.color=ppC1.color=UbuntuColors.green}
    else if (col22p === -3) {player2Won2p();ppA2.color=ppB2.color=ppC2.color=UbuntuColors.green}
    else if (col32p === -3) {player2Won2p();ppA3.color=ppB3.color=ppC3.color=UbuntuColors.green}
    else if (diagX2p === -3) {player2Won2p();ppA1.color=ppB2.color=ppC3.color=UbuntuColors.green}
    else if (diagY2p === -3) {player2Won2p();ppA3.color=ppB2.color=ppC1.color=UbuntuColors.green}
}
function player2Won2p() {
    textVictory2p.text = i18n.tr("Player 2 has win"); victory2p = true; textTurn2p.text=i18n.tr("Game ended")
}

function reset2p() {
    ppA1.color=ppA2.color=ppA3.color=ppB1.color=ppB2.color=ppB3.color=ppC1.color=ppC2.color=ppC3.color=UbuntuColors.blue
    imgppA1.source=imgppA2.source=imgppA3.source=imgppB1.source=imgppB2.source=imgppB3.source=imgppC1.source=imgppC2.source=imgppC3.source=""
    turno2p=turno2pEnum.P1
    textVictory2p.text=""
    textTurn2p.text = turno2p === turno2pEnum.P1 ? i18n.tr("It's the turn of the player 1") : i18n.tr("It's the turn of the player 2")
    turno1p = "player"; turno2p = turno2pEnum.P1
    rowA2p = 0; rowB2p = 0; rowC2p = 0
    textA.text="A: 0"; textB.text="B: 0"; textC.text="C: 0";
    col12p = 0; col22p = 0; col32p = 0
    text1.text="1: 0"; text2.text="2: 0"; text3.text="3: 0";
    diagX2p = 0; diagY2p = 0
    textX.text="X: 0"; textY.text="Y: 0";
    victory2p = false
}

function toOnePlayer() {
    toOneP.start(); rumbleEffect.start(); img1p.source = "g1-vs-cpu-blue.svg"; img2p.color = UbuntuColors.ash
}

function toTwoPlayers() {
    toTwoP.start(); rumbleEffect.start(); img2p.color = UbuntuColors.blue; img1p.source = "g1-vs-cpu.svg"
}
