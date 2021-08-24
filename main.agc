// Project: Project OXX 
// Created: 2021-06-09

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle("Project OXX")
SetWindowSize(640,480,0)
SetWindowAllowResize( 1 ) // allow the user to resize the window
// set display properties
SetVirtualResolution(640 ,480) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60,0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
	
	//Fundo do jogo
		LoadImage(1,"backg.png")
		createsprite(1,1)
		SetSpritePosition(1,-130,0)
	//Menu:
	#include "menu.agc"
		menu=0
		start=LoadImage("start.png")
		BossMenu=LoadImage("BOSSF.PNG")
		BossMenu2=LoadImage("BOSS1.PNG")
		createsprite (BossMenu2)
		createsprite (BossMenu)
		createsprite (start)
		SetSpritePosition (start,-300,20) //move o bossmenu2
		SetSpritePosition (BossMenu,120,0) //
		SetSpritePosition (BossMenu2,200,300) //move o start
	//Sprite dos soldados e boss
		enemiered1 = loadimage ("EnemieRed1.png")
		enemieblue1 = LoadImage ("EnemieBlue1.png")
		enemiegreen1 = loadimage ("EnemieGreen1.png")
	//Criaçao das sprites
		createsprite (enemiered1)
		CreateSprite (enemieblue1)
		createsprite (enemiegreen1)		
	//Posiçao e tamanho dos soldados red
		//red1
		SetSpritePosition (enemiered1,-100,324)
		SetSpriteSize(enemiered1,25,26)	
	//Posiçao e tamanho dos soldados blue
		SetSpritePosition(enemieblue1,124,322)
		SetSpriteSize(enemieblue1,27,27)
	//Posiçao e tamanho dos soldados green
		SetSpritePosition (enemiegreen1,-39,322)
		SetSpritesize(enemiegreen1,27,27)
		SetSpriteVisible(enemiered1,0)
		SetSpriteVisible(enemieblue1,0)
		SetSpriteVisible(enemiegreen1,0)	
	//BOSS1
		BOSS1=LoadImage ("BOSS1.Png")
		createsprite(BOSS1)
		SetSpritePosition(BOSS1,-700,60)
		SetSpriteSize(BOSS1,100,100)
		SetSpriteVisible(BOSS1,0)	
		posicaoBoss1=-225
		count=0
	//BOSS2
		Boss2=LoadImage("BOSSF.png")
		createsprite (Boss2)
		SetSpritePosition(BOSS2,-7000,800)
		SetSpriteSize(BOSS2,100,100 )
		SetSpriteVisible(BOSS2,0)
	//PASSARALHO
		passaro=LoadImage("itachii.png")
		CreateSprite(passaro)
		SetSpriteAnimation(passaro,90,77,2)
		PlaySprite(passaro)
		SetSpriteColor(passaro,255,0,0,255)
		posicaoPassarox=4000
	//Colisao das sprites
		SetSpriteShape (enemiered1,1)
		SetSpriteShape (enemiegreen1,1)
		SetSpriteShape (enemieblue1,1)
		SetSpriteShape (boss1,1)
		SetSpriteShape (boss1,2)
		SetSpriteShape (boss1,3)
	//Criaçao do crosshair
		LoadImage(2,"crosshair.png")
		createsprite(2,2)
		SetSpriteSize(2,30,30)
		SetSpriteVisible(2,0)
	//Criaçao do tiro
		LoadImage(3,"shoot1.png")
		createsprite(3,3)
		setSpritesize(3,26,23)
		SetSpriteShapeCircle(3,0.0,0.0,0.0)
		SetSpriteVisible(3,0)
		SetSpritePosition(3,0,1000)
	//Tirar o mouse
		SetRawMouseVisible(1)
	//Janelinha de respawn
		janela = 0
	// Som do tiro e som geral
		sound = LoadSound("DesertEagle.wav")
		backmusic = loadsound("miggate.wav")
		soundie = loadsound("steve.wav")
		soundamr=LoadSound("Rytec.wav")
		soundit=loadsound("bemtevii.wav")
		nha1=loadsound("nhaa1.wav")
		nha2=loadsound("nhaa2.wav")	
	// Fonte
		fonte=LoadFont("Pixellari.ttf")
	//Vida
	 HP=100
	 //Pause
	/*AddVirtualButton(1,750,10,50)
	SetVirtualButtonActive(1,1)
	SetVirtualButtonText(1,"PAUSAR")
	SetVirtualButtonAlpha(1,20)*/
	//HP
	CreateText(2,"HP")
	SetTextFont(2,fonte)
	settextsize(2,40)
	SetTextColor(2,0,0,0,255)
	SetTextPosition(2,-90,0)
	SetTextVisible(2,0)
	//Sprite de Morte
	morte=LoadImage("mortesao.png")
	createsprite(morte)
	SetSpritePosition(morte,0,50)
	SetSpriteVisible(morte,0)
	//mensagem de renascer
	CreateText(1,"PRESSIONE 'R'PARA COMEÇAR DE NOVO")
	SetTextFont(1,fonte)
	Settextsize(1,40)
	SetTextPosition(1,-60,350)
	SetTextVisible(1,0)
	//PONTUAÇAO
	Pontos=0
	CreateText(3,"PONTOS:")
	SetTextFont(3,fonte)
	Settextsize(3,40)
	SetTextPosition(3,-130,50)
	SetTextVisible(3,0)
	SetTextColor(3,0,0,0,255)
	//Highscore
	HS=0
	CreateText(4,"HIGHSCORE:")
	Settextsize(4,20)
	SetTextFont(4,fonte)
	SetTextPosition(4,610,0)
	SetTextVisible(4,0)
	SetTextColor(4,0,0,0,255)
	//andar
	direcao as integer=0		
	x as float=0.0
	velocidade as float=10.0	
	//MANUAL
	CreateText(5,"Instruçoes: Mova o mouse para controlar a mira e clique com o botao esquerdo do mouse para atirar")
	SetTextFont(5,fonte)
	Settextsize(5,20)
	SetTextPosition(5,-120,0)
	SetTextVisible(5,1)
	SetTextColor(5,0,0,0,255)
	// coraçao
	coracao=LoadImage("heart.png")
	createsprite(coracao)
	SetSpritePosition(coracao,-130,3)
	SetSpriteVisible(coracao,0)
	setspritesize( coracao,40,40)
	// NOME
	CreateText(6,"KILLING CHRONOS")
	SetTextFont(6,fonte)
	Settextsize(6,50)
	SetTextPosition(6,120,200)
	SetTextVisible(6,1)
	SetTextColor(6,0,0,255,255)
do
	SetSpritePosition(passaro,posicaoPassarox,125)
	posicaoPassarox=posicaoPassarox-18		
//MENU FUNCIONAR
	gosub menu	
	//APARECER VIDA
	SetSpriteVisible(coracao,1)
	SetTextString(2,":"+str(hp))
	SetTextVisible(2,1)
	SetTextVisible(5,0)
	SetTextVisible(6,0)
	//APARECER PONTOS
	SetTextString(3,"PONTOS:"+str(Pontos))
	SetTextVisible(3,1)
	//APARECER HIGHSCORE
	SetTextString(4,"HIGHSCORE:"+str(HS))
	SetTextVisible(4,1)
	if GetPointerReleased()=1 and GetSpriteHitTest(start,GetPointerX(),GetPointerY()) then menu=1
//Instrucoes do jogador
		SetSpritePosition (BossMenu,-1000,300) //move o help	
		SetSpritePosition (start,-1000,0) //move o bossmenu
		SetSpritePosition (BossMenu2,-1000,0) //move o bossmenu
		//inimigos visiveis
		SetSpriteVisible(enemiered1,1)
		SetSpriteVisible(enemieblue1,1)
		SetSpriteVisible(enemiegreen1,1)
		//Crosshair e tiro visivel
		SetSpriteVisible(2,1)
		SetSpriteVisible(3,1)
		SetRawMouseVisible(0)
//mover o crosshair

//Muda p uma nova posicao em X e Y do crosshair
	
		SetSpritePosition ( 2,GetRawMouseX()-15,GetRawMouseY()-15)	
//Limite do passaro
	if 	posicaoPassarox=-250
		posicaoPassarox=4000
		SetSpritePosition(passaro,posicaoPassarox,125)
		posicaoPassarox=posicaoPassarox-18
	endif
//MECANICA BOSS1 x=415max
	if pontos=225 or pontos=250 or pontos=2000
		SetSpritePosition(boss1,415,149)
		setspritevisible(boss1,1) 
	endif
	if pontos=700
		SetSpritePosition(boss1,415,149)
		setspritevisible(boss1,1) 
	endif
//MECANICA BOSS2
	 if pontos=1000 or pontos=1050
		setspriteposition(boss2,500,350)
		setspritevisible(boss2,1) 
	endif
	 if pontos=1800 or pontos=1850 or pontos= 3000
		setspriteposition(boss2,500,350)
		setspritevisible(boss2,1) 
	endif


//Atirar com a arma
	if (GetPointerPressed ( )= 1 ) // se for vdd retorna 1
		i=0
		PlaySound(sound)
		x#=GetPointerX()            // Retorna o x do clique
		y#=GetPointerY()           // Retorna o y do lcique
	
//Muda p uma nova posicao em X e Y do tiro
	
		SetSpritePosition ( 3,x#-13,y#-13)
		
//Colisao do tiro com as sprites
			
			if 	GetSpriteCollision (3,enemiered1)=1
				PlaySound(soundie)  
				setspritevisible(enemiered1,0)
				setspritevisible(enemiered1,1)
				SetSpritePosition(enemiered1,escolhaDeJanelas(),324)
				hp=hp-200
				Pontos=pontos+20
			endif 
			
			if 	GetSpriteCollision (3,enemieblue1)=1
				PlaySound(soundie)  
				setspritevisible(enemieblue1,0)						
				SetSpriteVisible(enemieblue1,1)
				SetSpritePosition(enemieblue1,escolhaDeJanelas(),324) 		
				hp=hp-200
				Pontos=pontos+20	
			endif
			if	GetSpriteCollision (3,enemiegreen1)=1
				PlaySound(soundie) 
				setspritevisible(enemiegreen1,0)
				setspritevisible(enemiegreen1,1) 
				SetSpritePosition(enemiegreen1,escolhaDeJanelas(),324)
				hp=hp-200
				Pontos=pontos+20
			endif
			if 	GetSpriteCollision (3,passaro)=1
				PlaySound(soundit)  
				setspritevisible(passaro,0)
				setspritevisible(passaro,1)
				posicaoPassarox=6500
				SetSpritePosition(passaro,posicaoPassarox,125)
				hp=hp-300
				Pontos=pontos+100
				posicaoPassarox=posicaoPassarox-18
			endif 
			if GetSpriteCollision(3,boss1)=1
				playsound(nha1)
				setspritevisible(boss1,0)
				setspritevisible(boss1,1) 
				SetSpritePosition(boss1,-170,149)
				hp=hp-0
				Pontos=pontos+5
				if GetSpriteCollision(3,boss1)=1
					playsound(nha2)
					setspritevisible(boss1,0)
					setspritevisible(boss1,1)
					SetSpritePosition(boss1,-2000,149) 
					hp=hp-400
					Pontos=pontos+200
				endif
			endif	
			if GetSpriteCollision(3,boss2)=1
				playsound(nha1)
				playsound(nha1)
				setspritevisible(boss2,0)
				setspritevisible(boss2,1) 
				SetSpritePosition(boss2,-170,350)
				hp=hp-0
				Pontos=pontos+10
				if GetSpriteCollision(3,boss2)=1
					playsound(nha2)
					playsound(nha2)
					setspritevisible(boss2,0)
					setspritevisible(boss2,1)
					SetSpritePosition(boss2,-2000,350) 
					hp=hp-600
					Pontos=pontos+1000
				endif
			endif		
						
		endif		
			//MECANICA DE VIDA
			if (GetPointerPressed ( )=1 and GetSpriteCollision (3,enemiered1)=0 or GetSpriteCollision (3,enemieblue1)=0 or GetSpriteCollision (3,enemiegreen1)=0)
			hp=hp+10
			else 
			hp=hp
			endif
			if hp=1000
				if pontos>HS
					HS=pontos
				endif
				pontos=0
				playsound(soundamr)
			endif
			if hp>1000 
				hp=1001
				SetSpriteVisible(morte,1)
				SetTextVisible(1,1)
				SetSpritePosition(enemiered1,escolhaDeJanelas(),3240)
				SetSpritePosition(enemieblue1,escolhaDeJanelas(),3240)
				SetSpritePosition(enemiegreen1,escolhaDeJanelas(),3240)
				SetSpritePosition(passaro,1000,125)
				if GetRawKeyPressed(82)=1 then hp=0 and pontos=0
			endif
			if hp=0
				posicaoPassarox=4000
				SetSpriteVisible(morte,0)
				SetTextVisible(1,0)	
				SetSpritePosition(enemiered1,escolhaDeJanelas(),324)
				SetSpritePosition(enemieblue1,escolhaDeJanelas(),324)
				SetSpritePosition(enemiegreen1,escolhaDeJanelas(),324)
				SetSpritePosition(passaro,posicaoPassarox,125)
				posicaoPassarox=posicaoPassarox-18									
			endif
sync()                                                                                                                                                                                                        
loop
	//JANELA1=-100,324 JANELA 2=-39,322 JANELA 3=81,324 JANELA 4= 124,322 Janela 5=195
	function escolhaDeJanelas ( )				
      
		sorteio=Random(1,8)
		janela=0
       
		if sorteio=1
			janela=-100
		endif
		if sorteio=2
			janela=-39
		endif
		if sorteio=3
			janela=81
		endif
		if sorteio=4
			janela=124
		endif
		if sorteio=5
			janela=195
		endif
		if sorteio=6
			janela=237
		endif
		if sorteio=7
			janela=366
		endif
		if sorteio=8
			janela=428
		endif
	
	endfunction	janela									
	
