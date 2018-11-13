
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
int numpulos = 0;
int estagio = 0;

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
    bool redraw = true;
    const int FPS = 60;
    bool isGameOver = false;
    bool moved = false;
    int direcao=0;
    bool done = false;
    int pagina =1;
    int clickInicial =0;
    int pos_x;
    int pos_y;


    ALLEGRO_DISPLAY *display = NULL;
    ALLEGRO_EVENT_QUEUE *event_queue = NULL;
    ALLEGRO_TIMER *timer = NULL;
    ALLEGRO_BITMAP *folha_sprite = NULL;
    ALLEGRO_BITMAP *telaInicial = NULL;
    ALLEGRO_BITMAP *luvinha = NULL;


     //object variables
    SpaceShip ship[2];
    Bullet bullets[NUM_BULLETS];
    Comet comets[NUM_COMETS];
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

    telaInicial = al_load_bitmap("telaInicial.jpg");
    luvinha = al_load_bitmap("luvinha.png");
    if (!telaInicial)
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

    InitShip(ship);
    InitBullet(bullets, NUM_BULLETS);
    InitComet(comets, NUM_COMETS);

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
            redraw = true;
            switch(pagina)
            {
            case 2:
                //JUMP
                jump(ship,jj,tempo,0);
                jump(ship,jj,tempo,1);
                //GOLPE
                golpe(ship,1,dange,tempo);
                golpe(ship,0,dange,tempo);

                hit(ship,dange,tempo,1);
                hit(ship,dange,tempo,0);
                if(keys[DOWN])
                    FireBullet(bullets,5,ship);
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
                    UpdateBullet(bullets, NUM_BULLETS);
                    CollideBullet(bullets, NUM_BULLETS, comets, NUM_COMETS, ship);


                    for(int c=0; c<2; c++)
                    {
                        if(ship[c].lives <= c)
                        {
                            ship[c].y = HEIGHT/4;
                            ship[c].x = WIDTH/2;
                            ship[c].lives = 3;
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
                ship[0].golped=true;

                // FireBullet(bullets, NUM_BULLETS, ship);
                break;
            case ALLEGRO_KEY_SPACE:
                keys[SPACE] = true;
                ship[1].golped=true;

                break;
            }
                break;
            }

        }else if(ev.type == ALLEGRO_EVENT_KEY_UP){
            switch (pagina)
            {
                case 2:
                    switch(ev.keyboard.keycode){
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
            }
        }
        else if(ev.type == ALLEGRO_EVENT_MOUSE_BUTTON_DOWN)
        {
            switch (pagina)
            {
            case 1:
                switch (clickInicial)
                {
                case 1:
                    printf("começo\n");
                    pagina = 2;
                    break;
                case 2:
                    printf("como jogar\n");
                    break;
                case 3:
                    printf("credit\n");
                    break;
                case 4:
                    printf("sair\n");
                    break;
                }
                break;

            }
        }

        if((redraw && al_is_event_queue_empty(event_queue)) && (pagina==1))
        {
            al_draw_bitmap(telaInicial,0,0,0);
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
                al_draw_filled_rectangle(200, 400, 800, 500, al_map_rgb(255, 0, 0));
                DrawShip(ship);
        }
        }

        al_flip_display();
        al_clear_to_color(al_map_rgb(255,255,255));

    }
    //destroy our display object
    al_destroy_event_queue(event_queue);
    al_destroy_timer(timer);
    al_destroy_bitmap(telaInicial);
    al_destroy_bitmap(luvinha);
    al_destroy_display(display);

    return 0;
}


