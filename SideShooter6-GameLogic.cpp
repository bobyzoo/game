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
    bool done = false;
    const int jj []= {60,55,45,43,38,31,25,15,10,5};
    const int dange []= {30,30,40,43,38,31,25,15,10,5};
    const int tempo[]= {2,4,6,8,12,13,15,16,17,19};
    bool redraw = true;
    const int FPS = 60;
    bool isGameOver = false;
    bool moved = false;
    int direcao=0;


    //object variables
    SpaceShip ship[2];
    Bullet bullets[NUM_BULLETS];
    Comet comets[NUM_COMETS];
    //Sprites sprite;

    //Allegro variables
    ALLEGRO_DISPLAY *display = NULL;
    ALLEGRO_EVENT_QUEUE *event_queue = NULL;
    ALLEGRO_TIMER *timer = NULL;
    ALLEGRO_FONT *font18 = NULL;
    ALLEGRO_BITMAP *folha_sprite = NULL;

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

    al_init_primitives_addon();
    al_install_keyboard();
    al_init_font_addon();
    al_init_ttf_addon();

    event_queue = al_create_event_queue();
    timer = al_create_timer(1.0 / FPS);

    srand(time(NULL));
    InitShip(ship);
    InitBullet(bullets, NUM_BULLETS);
    InitComet(comets, NUM_COMETS);

    font18 = al_load_font("arial.ttf", 18, 0);
    folha_sprite = al_load_bitmap("sprite.png");
    if (!folha_sprite)
    {
        printf("Falha ao carregar sprites");
        al_destroy_timer(timer);
        al_destroy_display(display);
        al_destroy_event_queue(event_queue);
        return 0;
    }
    al_register_event_source(event_queue, al_get_keyboard_event_source());
    al_register_event_source(event_queue, al_get_timer_event_source(timer));
    al_register_event_source(event_queue, al_get_display_event_source(display));

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
            //JUMP
            jump(ship,jj,tempo,0);
            jump(ship,jj,tempo,1);
            //GOLPE
            golpe(ship,1,dange,tempo);
            golpe(ship,0,dange,tempo);

            hit(ship,dange,tempo,1);
            hit(ship,dange,tempo,0);
            // printf("vida 1- %d ||vida 2-%d\n\n",ship[0].lives,ship[1].lives);
            redraw = true;
            //MOVE
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
                //al_draw_filled_rectangle(200, 400, 800, 500, al_map_rgb(255, 0, 0));
                //StartComet(comets, NUM_COMETS);
                //UpdateComet(comets, NUM_COMETS);
                CollideBullet(bullets, NUM_BULLETS, comets, NUM_COMETS, ship);
                //CollideComet(comets, NUM_COMETS, ship);

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

        }
        else if(ev.type == ALLEGRO_EVENT_DISPLAY_CLOSE)
        {
            done = true;
        }
        else if(ev.type == ALLEGRO_EVENT_KEY_DOWN)
        {
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
        }
        else if(ev.type == ALLEGRO_EVENT_KEY_UP)
        {
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
        }

        if(redraw && al_is_event_queue_empty(event_queue))
        {
            redraw = false;

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

                //DrawComet(comets, NUM_COMETS);
                al_draw_filled_rectangle(200, 400, 800, 500, al_map_rgb(255, 0, 0));

                // DrawBullet(bullets, NUM_BULLETS);
                al_draw_bitmap_region(folha_sprite,0,0,170,280,ship[0].x-60,ship[0].y-260,0);
                DrawShip(ship);

                // al_draw_textf(font18, al_map_rgb(255, 0, 255), 5, 5, 0, "Player has %i lives left. Player has destroyed %i objects", ship.lives, ship.score);
            }
            else
            {
                //al_draw_textf(font18, al_map_rgb(0, 255, 255), WIDTH / 2, HEIGHT / 2, ALLEGRO_ALIGN_CENTRE, "Game Over. Final Score: %i", ship.score);
            }

            al_flip_display();
            al_clear_to_color(al_map_rgb(255,255,255));
        }
    }

    al_destroy_event_queue(event_queue);
    al_destroy_timer(timer);
    al_destroy_font(font18);
    al_destroy_display(display);						//destroy our display object

    return 0;
}
