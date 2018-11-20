
#include <allegro5\allegro.h>
#include <allegro5\allegro_primitives.h>
#include <allegro5\allegro_font.h>
#include <allegro5\allegro_ttf.h>
#include <allegro5/allegro_image.h>
#include "objects.h"
#include<stdio.h>
#include "functions.h"

//GLOBALS==============================


int cont=0;
int timeLevel=0;
int numpulos = 0;
int estagio = 0;

bool fire1 = false;
bool fire2 = false;

enum KEYS {UP, DOWN, LEFT, RIGHT, SPACE, A, S, D, W, ENTER};
bool keys[10] = {false, false, false, false, false, false, false, false, false, false};
/*
                  _
                 (_)
  _ __ ___   __ _ _ _ __
 |  _ ` _ \ / _` | |  _ \
 | | | | | | (_| | | | | |
 |_| |_| |_|\__,_|_|_| |_|

  */
int main(void)
{
    //primitive variable
    const int jj []= {60,55,45,43,38,31,25,15,10,5};
    const int dange []= {30,30,40,43,38,31,25,15,10,5};
    const int tempo[]= {2,4,6,8,12,13,15,16,17,19};
    const float porcDano[] = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.2,1.3,1.35,1.4,1.5,1.6,1.7,1.8,1.9,2};
    bool redraw = true;
    const int FPS = 60;
    //fim do roaund ou do time
    bool isGameOver = false;
    //se esta se movendo e pra qual direção esta apontando
    bool moved = false;
    int direcao=0;
    //se verdade sai do jogo
    bool done = false;
    //numero da janela e região do click mouse
    int pagina =1;
    int clickInicial =0;
    //posição do mouse
    int pos_x;
    int pos_y;


    ALLEGRO_DISPLAY *display = NULL;
    ALLEGRO_EVENT_QUEUE *event_queue = NULL;
    ALLEGRO_TIMER *timer = NULL;
    ALLEGRO_BITMAP *folha_sprite = NULL;
    ALLEGRO_BITMAP *fundoTela = NULL;
    ALLEGRO_BITMAP *luvinha = NULL;
    ALLEGRO_FONT *font18 = NULL;
    ALLEGRO_FONT *font60 = NULL;
    ALLEGRO_BITMAP *selection = NULL;
    ALLEGRO_BITMAP *selection1 = NULL;
    ALLEGRO_BITMAP *selectionMapa = NULL;




    //object variables
    SpaceShip ship[2];
    Bullet bullets0[10];
    Bullet bullets1[10];
    Comet comets[NUM_COMETS];
    Level mapa;



    //Initialization Functions
    if(!al_init())										//initialize Allegro
        return -1;


    display = al_create_display(WIDTH, HEIGHT);			//create our display object
    if (!al_init_image_addon())
    {
        printf("Falha ao inicializar o addon de imagens");
        return 0;
    }
    if(!display)										//test display object
        return -1;
    if (!al_install_mouse())
    {
        printf("Falha ao inicializar o mouse");
        al_destroy_display(display);
        return -1;
    }
    al_init_primitives_addon();
    al_install_keyboard();
    al_init_font_addon();
    al_init_ttf_addon();

    event_queue = al_create_event_queue();
    timer = al_create_timer(1.0 / FPS);
    srand(time(NULL));

    font18 = al_load_font("arial.ttf", 18, 0);
    font60 = al_load_font("arial.ttf", 60, 0);

    fundoTela = al_load_bitmap("telaInicial.jpg");
    luvinha = al_load_bitmap("luvinha.png");
    selection = al_load_bitmap("preto.png");
    selection1 = al_load_bitmap("preto.png");
    selectionMapa = al_load_bitmap("mapa01.jpg");



    if (!fundoTela)
    {
        printf("Falha ao carregar telainicial");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }
    if (!luvinha)
    {
        printf("Falha ao carregar sprites");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }
    if (!selection)
    {
        printf("Falha ao carregar boneco");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }
    if (!selectionMapa)
    {
        printf("Falha ao carregar o mapa");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }
    if (!selection1)
    {
        printf("Falha ao carregar boneco 1");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }



    al_convert_mask_to_alpha(selection,al_map_rgb(255,255,255));
    al_convert_mask_to_alpha(selection1,al_map_rgb(255,255,255));
    al_convert_mask_to_alpha(selectionMapa,al_map_rgb(255,255,255));


    InitShip(ship);
    InitBullet(bullets0);
    InitBullet(bullets1);
    InitComet(comets, NUM_COMETS);
    InitMapa(mapa);




    al_register_event_source(event_queue, al_get_keyboard_event_source());
    al_register_event_source(event_queue, al_get_timer_event_source(timer));
    al_register_event_source(event_queue, al_get_display_event_source(display));
    al_register_event_source(event_queue, al_get_mouse_event_source());
    al_start_timer(timer);


    /*
    _                              _            _             _
    | |                            (_)          (_)           | |
    | | __ _  ___ ___    _ __  _ __ _ _ __   ___ _ _ __   __ _| |
    | |/ _` |/ __/ _ \  |  _ \|  __| |  _ \ / __| |  _ \ / _` | |
    | | (_| | (_| (_) | | |_) | |  | | | | | (__| | |_) | (_| | |
    |_|\__,_|\___\___/  | .__/|_|  |_|_| |_|\___|_| .__/ \__,_|_|
              )_)       | |                       | |
                        |_|                       |_|
    */
    while(!done)
    {
        ALLEGRO_EVENT ev;
        al_wait_for_event(event_queue, &ev);


        if(ev.type == ALLEGRO_EVENT_TIMER)
        {
            printf("%d === %d\n",ship[0].reload,ship[1].reload);
            redraw = true;
            switch(pagina)
            {
            case 2:
                cont++;
                //-------------------------------------------------TEMPO DO MAPA
                if(cont==63){
                    timeLevel ++;
                    cont = 0;
                }

                if(cont%16==0){
                    fire1 =true;
                    fire2 =true;
                }
                if(timeLevel == mapa.Tempo){
                    InitShip(ship);
                    timeLevel = 0;
                }

                //-------------------------------------------------------------------JUMP
                jump(ship,jj,tempo,0);
                jump(ship,jj,tempo,1);
                //-------------------------------------------------------------------GOLPE
                golpe(ship,1,dange,tempo);
                golpe(ship,0,dange,tempo);
                //-------------------------------------------------------------------SOFRE DANO
                hit(ship,dange,tempo,1,porcDano);
                hit(ship,dange,tempo,0,porcDano);
                if(keys[ENTER]){
                     if(ship[0].armaAtual!=9){
                         if(fire1){
                        FireBullet(bullets0,ship,0);
                        fire1=false;
                        }
                    }
                }
                if (keys[SPACE]){
                    if(ship[1].armaAtual!=9){
                         if(fire2){
                        FireBullet(bullets1,ship,1);
                        fire2=false;
                        }
                    }
                }
                if(keys[D])
                    MoveShipRight(ship,1);
                if(keys[A])
                    MoveShipLeft(ship,1);
                if(keys[LEFT])
                    MoveShipLeft(ship,0);
                if(keys[RIGHT])
                    MoveShipRight(ship,0);
                if(!isGameOver)
                {
                    for(int c=0; c<2; c++)
                    {
                        if((!moved) && (!ship[c].jump))
                        {
                            if((ship[c].x>=200)&&(ship[c].x<=800))
                            {
                                if((ship[c].y<=400)||(ship[c].y>=410))
                                {
                                    gravity(ship,c);
                                }
                            }
                            else
                            {
                                gravity(ship,c);
                            }
                        }
                    }

                    UpdateBullet(bullets0,ship,0);
                    CollideBullet(bullets0,ship,0);

                     UpdateBullet(bullets1,ship,1);
                    CollideBullet(bullets1,ship,1);

                    UpdateComet(comets,NUM_COMETS);
                    CollideComet(comets,NUM_COMETS,0,ship);
                    CollideComet(comets,NUM_COMETS,1,ship);


                    for(int c=0; c<2; c++)
                    {
                        if(ship[c].lives <= c)
                        {
                            InitShip(ship);
                            timeLevel = 0;
                        }
                        if(ship[c].y>=HEIGHT)
                        {
                            InitShip(ship);
                            timeLevel = 0;
                        }
                    }


                }
                break;
            }
        }
        else if(ev.type == ALLEGRO_EVENT_DISPLAY_CLOSE)
        {
            done = true;
        }
        else if(ev.type == ALLEGRO_EVENT_KEY_DOWN)
        {
            switch (pagina)
            {
            case 2:
                switch(ev.keyboard.keycode)
                {
                case ALLEGRO_KEY_ESCAPE:
                    done = true;
                    break;
                case ALLEGRO_KEY_UP:
                    keys[UP] = true;
                    ship[0].jump = true;
                    break;
                case ALLEGRO_KEY_DOWN:
                    keys[DOWN] = true;
                    break;
                case ALLEGRO_KEY_LEFT:
                    keys[LEFT] = true;
                    ship[0].direcao=0;
                    break;
                case ALLEGRO_KEY_RIGHT:
                    keys[RIGHT] = true;
                    ship[0].direcao=1;
                    break;
                case ALLEGRO_KEY_W:
                    keys[W] = true;
                    ship[1].jump = true;
                    break;
                case ALLEGRO_KEY_A:
                    keys[A] = true;
                    ship[1].direcao=0;
                    break;
                case ALLEGRO_KEY_S:
                    keys[S] = true;
                    break;
                case ALLEGRO_KEY_D:
                    keys[D] = true;
                    ship[1].direcao=1;
                    break;
                case ALLEGRO_KEY_ENTER:
                    keys[ENTER] = true;
                     if(ship[0].armaAtual==9){
                        ship[0].golped=true;
                    }

                    break;
                case ALLEGRO_KEY_SPACE:
                    keys[SPACE] = true;
                     if(ship[1].armaAtual==9){

                        ship[1].golped=true;
                    }
                    break;
                }
                break;
            }

        }
        else if(ev.type == ALLEGRO_EVENT_KEY_UP)
        {
            switch (pagina)
            {
            case 1:
                switch(ev.keyboard.keycode)
                {
                case ALLEGRO_KEY_ESCAPE:
                    done = true;
                    break;
                }
                break;

            case 2:
                switch(ev.keyboard.keycode)
                {
                case ALLEGRO_KEY_ESCAPE:
                    done = true;
                    break;
                case ALLEGRO_KEY_UP:
                    keys[UP] = false;
                    break;
                case ALLEGRO_KEY_DOWN:
                    keys[DOWN] = false;
                    break;
                case ALLEGRO_KEY_LEFT:
                    keys[LEFT] = false;
                    break;
                case ALLEGRO_KEY_RIGHT:
                    keys[RIGHT] = false;

                    break;
                case ALLEGRO_KEY_W:
                    keys[W] = false;

                    break;
                case ALLEGRO_KEY_A:
                    keys[A] = false;

                    break;
                case ALLEGRO_KEY_S:
                    keys[S] = false;

                    break;
                case ALLEGRO_KEY_D:
                    keys[D] = false;

                    break;
                case ALLEGRO_KEY_SPACE:
                    keys[SPACE] = false;

                    break;
                case ALLEGRO_KEY_ENTER:
                    keys[ENTER] = false;
                    break;
                }
                break;
            case 3:
                switch(ev.keyboard.keycode)
                {
                case ALLEGRO_KEY_ESCAPE:
                    done = true;
                    break;
                }
                break;
            }
        }
        else if(ev.type == ALLEGRO_EVENT_MOUSE_AXES)
        {
            pos_x = ev.mouse.x;
            pos_y = ev.mouse.y;
            clickInicial = 0;
            switch (pagina)
            {
            case 1:
                if((pos_x>=660&&pos_x<=1050)&&(pos_y>=205 && pos_y<=306))
                {
                    clickInicial = 1;

                }
                else if((pos_x>=660&&pos_x<=1050)&&(pos_y>=330 && pos_y<=412))
                {
                    clickInicial = 2;
                }
                else if((pos_x>=660&&pos_x<=1050)&&(pos_y>=450 && pos_y<=540))
                {
                    clickInicial = 3;
                }
                else if((pos_x>=660&&pos_x<=1050)&&(pos_y>=570 && pos_y<=660))
                {
                    clickInicial = 4;
                }
                else
                {
                    clickInicial = 0;
                }
                break;
            case 2:
                break;

            case 3:
                if((pos_x>=52&&pos_x<=91)&&(pos_y>=375 && pos_y<=430))
                {
                    clickInicial = 1;


                }
                else if((pos_x>=195&&pos_x<=256)&&(pos_y>=370 && pos_y<=430))
                {
                    clickInicial = 2;

                }
                else if((pos_x>=318&&pos_x<=373)&&(pos_y>=372 && pos_y<=430))
                {
                    clickInicial = 3;

                }
                else if((pos_x>=474&&pos_x<=530)&&(pos_y>=372 && pos_y<=430))
                {
                    clickInicial = 4;

                }
                else if((pos_x>=340&&pos_x<=366)&&(pos_y>=485 && pos_y<=504))
                {
                    clickInicial = 5;

                }
                else if((pos_x>=340&&pos_x<=366)&&(pos_y>=367 && pos_y<=525))
                {
                    clickInicial = 6;

                }
                else if((pos_x>=412&&pos_x<=438)&&(pos_y>=630 && pos_y<=650))
                {
                    clickInicial = 7;

                }
                else if((pos_x>=412&&pos_x<=438)&&(pos_y>=654 && pos_y<=670))
                {
                    clickInicial = 8;

                }
                else if((pos_x>=721&&pos_x<=770)&&(pos_y>=354 && pos_y<=406))
                {
                    clickInicial = 9;

                }
                else if((pos_x>=877&&pos_x<=930)&&(pos_y>=352 && pos_y<=405))
                {
                    clickInicial = 10;

                }
                else if((pos_x>=966&&pos_x<=1040)&&(pos_y>=612 && pos_y<=684))
                {
                    clickInicial = 11;

                }
            case 4:
                break;

            }
        }
        else if(ev.type == ALLEGRO_EVENT_MOUSE_BUTTON_DOWN)
        {
            redraw = true;
            printf("POS X = %d\n", pos_x);
            printf("POS Y = %d\n", pos_y);

            //printf("% d %d \n",pos_x,pos_y);
            switch (pagina)
            {
            case 1:
                switch (clickInicial)
                {
                case 1:
                    printf("começo\n");
                    pagina = 3;
                    fundoTela = al_load_bitmap("telaSelection.jpg");
                    break;
                case 2:
                    printf("como jogar\n");
                    break;
                case 3:
                    printf("credit\n");
                    break;
                case 4:
                    done = true;
                    break;
                }
                break;
            case 2:

                break;


            case 3:
                switch (clickInicial)
                {
                case 1:

                    if(ship[0].cor > 0)
                    {
                        ship[0].cor--;
                    }
                    printf("%d\n",ship[0].cor);
                    break;

                case 2:
                    if(ship[0].cor < 8)
                    {
                        ship[0].cor++;

                    }
                    printf("%d\n",ship[0].cor);
                    break;

                case 3:

                    printf("<d\n");
                    if(ship[1].cor > 0)
                    {
                        ship[1].cor--;
                    }
                    printf("%d\n",ship[1].cor);
                    break;

                case 4:
                    printf(">d\n");
                    if(ship[1].cor < 8)
                    {
                        ship[1].cor++;

                    }
                    printf("%d\n",ship[0].cor);
                    break;

                case 5://--------------------------------------------------------------------------------------------- AUMENTA O TEMPO
                    printf("g\n");
                    if (mapa.Tempo<81)
                    {
                        mapa.Tempo += 10;
                    }

                    break;

                case 6://---------------------------------------------------------------------------------------------DIMINUI O TEMPO
                    printf("d\n");
                    if (mapa.Tempo>0)
                    {
                        mapa.Tempo -= 10;
                    }

                    break;

                case 7://---------------------------------------------------------------------------------------------AUMENTA O NUMERO DE RODADAS
                    printf("A\n");

                    if(mapa.Rodadas < 5)
                    {
                        mapa.Rodadas++;
                    }
                    printf("Rodada = %d\n", mapa.Rodadas);
                    break;

                case 8://---------------------------------------------------------------------------------------------DIMINUI O NUMERO DE RODADAS
                    printf("B\n");
                    if(mapa.Rodadas > 0)
                    {
                        mapa.Rodadas--;
                    }
                    printf("Rodada = %d\n", mapa.Rodadas);

                    break;

                case 9://---------------------------------------------------------------------------------------------ESCOLHA DO MAPA <
                    printf("C\n");
                    if(mapa.ID > 0)
                    {
                        mapa.ID--;
                    }
                    break;

                case 10://---------------------------------------------------------------------------------------------ESCOLHA DO MAPA >
                    printf("D\n");
                    if(mapa.ID<2)
                    {
                        mapa.ID++;
                    }
                    break;
                case 11:
                    pagina = 2;
                    fundoTela = al_load_bitmap("ceu.jpg");
                    break;
                }

                for (int c = 0; c < 2; c++)
                {
                    if (c==1)
                    {
                        switch(ship[c].cor)//----------------------------------------------------------------------------------CARREGA O PERSONAGEM 1 ESCOLHIDO
                        {

                        case 0:
                            selection = al_load_bitmap("preto.png");
                            al_convert_mask_to_alpha(selection,al_map_rgb(255,255,255));
                            break;
                        case 1:
                            selection = al_load_bitmap("vermelho.png");
                            al_convert_mask_to_alpha(selection,al_map_rgb(255,255,255));
                            break;
                        case 2 :
                            selection = al_load_bitmap("verde.png");
                            al_convert_mask_to_alpha(selection,al_map_rgb(255,255,255));

                            break;
                        default:
                            selection = al_load_bitmap("preto.png");
                            al_convert_mask_to_alpha(selection,al_map_rgb(255,255,255));
                            break;
                        }
                    }
                    else
                    {
                        switch(ship[c].cor)//----------------------------------------------------------------------------------CARREGA O PERSONAGEM 2 ESCOLHIDO
                        {

                        case 0:
                            selection1 = al_load_bitmap("preto.png");
                            al_convert_mask_to_alpha(selection1,al_map_rgb(255,255,255));
                            break;
                        case 1:
                            selection1 = al_load_bitmap("vermelho.png");
                            al_convert_mask_to_alpha(selection1,al_map_rgb(255,255,255));
                            break;
                        case 2 :
                            selection1 = al_load_bitmap("verde.png");
                            al_convert_mask_to_alpha(selection1,al_map_rgb(255,255,255));

                            break;
                        default:
                            selection1 = al_load_bitmap("preto.png");
                            al_convert_mask_to_alpha(selection1,al_map_rgb(255,255,255));
                            break;


                        }
                    }
                }

                switch(mapa.ID)//----------------------------------------------------------------------------------CARREGA O MAPA ESCOLHIDO
                {
                case 0:
                    selectionMapa = al_load_bitmap("mapa01.jpg");
                    al_convert_mask_to_alpha(selectionMapa,al_map_rgb(255,255,255));
                    break;

                case 1:
                    selectionMapa = al_load_bitmap("mapa02.jpg");
                    al_convert_mask_to_alpha(selectionMapa,al_map_rgb(255,255,255));
                    break;

                case 2 :
                    selectionMapa = al_load_bitmap("mapa03.png");
                    al_convert_mask_to_alpha(selectionMapa,al_map_rgb(255,255,255));
                    break;

                default:
                    selectionMapa = al_load_bitmap("mapa01.jpg");
                    al_convert_mask_to_alpha(selectionMapa,al_map_rgb(255,255,255));
                    break;

                }
                break;

            }
        }

        if((redraw && al_is_event_queue_empty(event_queue)) && (pagina==1))
        {
            al_clear_to_color(al_map_rgb(255,255,255));
            al_draw_bitmap(fundoTela,0,0,0);
            switch (clickInicial)
            {

            case 1:
                al_draw_bitmap(luvinha,520,230,0);
                break;
            case 2:
                al_draw_bitmap(luvinha,520,360,0);
                break;
            case 3:
                al_draw_bitmap(luvinha,520,470,0);
                break;
            case 4:
                al_draw_bitmap(luvinha,520,600,0);
                break;

            }
        }
        if((redraw && al_is_event_queue_empty(event_queue)) && (pagina==2))
        {
            //  redraw = false;
            al_clear_to_color(al_map_rgb(255,255,255));

            if(!isGameOver)
            {
                for(int c=0; c<2; c++)
                {
                    if((ship[c].y>=400)&&(ship[c].y<=406))
                    {
                        if((ship[c].x>=200)&&(ship[c].x<=800))
                        {
                            ship[c].numpulos = 0;

                        }
                    }
                }
                al_draw_filled_rectangle(200, 400, 800, 500, al_map_rgb(255, 0, 0));//----------plataforma
                StartComet(comets,NUM_COMETS);
                DrawComet(comets,NUM_COMETS);

                DrawBullet(bullets0,ship,0);
                DrawBullet(bullets1,ship,1);

                al_draw_bitmap(fundoTela,0,0,0);
                DrawShip(ship);
                al_draw_filled_rounded_rectangle(200, 0, 800, 35, 10,10,al_map_rgb(0, 0, 255));
                al_draw_filled_rounded_rectangle(200, 0, (ship[0].lives*1.5)+200, 35, 10,10,al_map_rgb(255, 0, 0));
                al_draw_filled_rounded_rectangle(((ship[1].lives*1.5)+200+((300-ship[1].lives*1.5)*2)), 0, 800, 35, 10,10,al_map_rgb(0, 255, 0));
                al_draw_filled_rectangle(490, 0, 510, 35,al_map_rgb(0, 0, 0));
                al_draw_textf(font18, al_map_rgb(255, 255, 255), 220, 5, 0, "Player 1                              %i     X     %i                                 Player2",ship[0].lives,ship[1].lives);

            }
        }
        if((redraw && al_is_event_queue_empty(event_queue)) && (pagina==3))
        {
            al_clear_to_color(al_map_rgb(255,255,255));
            al_draw_bitmap(fundoTela,0,0,0);
            al_draw_bitmap(selection1,-150,0,0);
            al_draw_bitmap(selection, 125,0,0);
            al_draw_bitmap(selectionMapa, 570,0,0);
            al_draw_textf(font60, al_map_rgb(0, 0, 0), 265, 475, 0, "%d", mapa.Tempo);
            al_draw_textf(font60, al_map_rgb(0, 0, 0), 345, 620, 0, "%d", mapa.Rodadas);
            redraw = false;


        }

        al_flip_display();


    }
    //destroy our display object
    al_destroy_event_queue(event_queue);
    al_destroy_timer(timer);
    al_destroy_bitmap(fundoTela);
    al_destroy_bitmap(luvinha);
    al_destroy_display(display);

    return 0;
}


