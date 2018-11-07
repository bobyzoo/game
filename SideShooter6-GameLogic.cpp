#include <allegro5\allegro.h>
#include <allegro5\allegro_primitives.h>
#include <allegro5\allegro_font.h>
#include <allegro5\allegro_ttf.h>
#include <allegro5/allegro_image.h>
#include "objects.h"
#include<stdio.h>

//GLOBALS==============================
const int WIDTH = 1080;
const int HEIGHT = 720;
const int NUM_BULLETS = 5;
const int NUM_COMETS = 10;


int cont=0;
int numpulos = 0;
int estagio = 0;

enum KEYS {UP, DOWN, LEFT, RIGHT, SPACE, A, S, D, W};
bool keys[9] = {false, false, false, false, false, false, false, false, false};

//prototypes


void InitShip(SpaceShip ship[]);
void DrawShip(SpaceShip ship[]);

void MoveShipLeft(SpaceShip ship[],int num);
void MoveShipRight(SpaceShip ship[],int num);

void InitBullet(Bullet bullet[], int size);
void DrawBullet(Bullet bullet[], int size);
void FireBullet(Bullet bullet[], int size, SpaceShip &ship);
void UpdateBullet(Bullet bullet[], int size);
void CollideBullet(Bullet bullet[], int bSize, Comet comets[], int cSize, SpaceShip &ship);

void InitComet(Comet comets[], int size);
void DrawComet(Comet comets[], int size);
void StartComet(Comet comets[], int size);
void UpdateComet(Comet comets[], int size);
void CollideComet(Comet comets[], int cSize, SpaceShip &ship);

void jump(SpaceShip ship[],const int jj[],const int tempo[],int i);
void gravity(SpaceShip ship[],int num);
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
    const int tempo[]= {2,4,6,8,12,13,15,16,17,19};
    bool redraw = true;
    const int FPS = 60;
    bool isGameOver = false;
    bool moved = false;



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

            jump(ship,jj,tempo,0);
            jump(ship,jj,tempo,1);
            redraw = true;
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
                // CollideBullet(bullets, NUM_BULLETS, comets, NUM_COMETS, ship);
                //CollideComet(comets, NUM_COMETS, ship);

                if(ship[0].lives <= 0)
                    isGameOver = true;
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

                break;
            case ALLEGRO_KEY_RIGHT:
                keys[RIGHT] = true;

                break;
            case ALLEGRO_KEY_W:
                keys[W] = true;
                ship[1].jump = true;
                break;
            case ALLEGRO_KEY_A:
                keys[A] = true;

                break;
            case ALLEGRO_KEY_S:
                keys[S] = true;

                break;
            case ALLEGRO_KEY_D:
                keys[D] = true;

                break;
            case ALLEGRO_KEY_SPACE:
                keys[SPACE] = true;

                FireBullet(bullets, NUM_BULLETS, ship[0]);
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

                DrawBullet(bullets, NUM_BULLETS);
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

/*
   __                  /\/|
  / _|                |/\/
 | |_ _   _ _ __   ___ ___   ___  ___
 |  _| | | |  _ \ / __/ _ \ / _ \/ __|
 | | | |_| | | | | (_| (_) |  __/\__ \
 |_|  \__,_|_| |_|\___\___/ \___||___/
                   )_)
                                     */
void InitShip(SpaceShip ship[])
{

    ship[0].x = WIDTH/2;
    ship[0].y = HEIGHT / 3;
    ship[0].ID = PLAYER;
    ship[0].lives = 3;
    ship[0].speed = 5;
    ship[0].boundx = 6;
    ship[0].boundy = 7;
    ship[0].score = 0;
    ship[0].jump = false;
    ship[0].cont = 0;
    ship[0].numpulos=0;
    ship[0].estagio = 0;


    ship[1].x = WIDTH/4;
    ship[1].y = HEIGHT / 4;
    ship[1].ID = PLAYER;
    ship[1].lives = 3;
    ship[1].speed = 5;
    ship[1].boundx = 6;
    ship[1].boundy = 7;
    ship[1].score = 0;
    ship[1].jump = false;
    ship[1].cont = 0;
    ship[1].numpulos=0;
    ship[1].estagio = 0;

}
void DrawShip(SpaceShip ship[])
{
    al_draw_filled_rectangle(ship[1].x, ship[1].y, ship[1].x+10, ship[1].y+10, al_map_rgb(0, 255, 0));
    al_draw_filled_rectangle(ship[0].x, ship[0].y, ship[0].x + 10, ship[0].y + 10, al_map_rgb(0, 0, 0));

}


void gravity(SpaceShip ship[],int num)
{
    ship[num].y+= 7;
    if(ship[num].y > HEIGHT)
        ship[num].y = HEIGHT/3;
}
void MoveShipLeft(SpaceShip ship[],int num)
{
    ship[num].x -= ship[num].speed;
    if(ship[num].x < 0)
        ship[num].x = 0;
}
void MoveShipRight(SpaceShip ship[],int num)
{
    ship[num].x += ship[num].speed;

}
void jump(SpaceShip ship[],const int jj[],const int tempo[],int i)
{

    if(ship[i].jump)
    {
        if(ship[i].numpulos<=1)
        {




            if(ship[i].cont == tempo[ship[i].estagio])
            {
                ship[i].estagio++;

                ship[i].y = ship[i].y - jj[ship[i].estagio];
                if(ship[i].y<=0)
                {

                    ship[i].cont=19;
                }


            }
            ship[i].cont++;
            if(ship[i].cont>=19)
            {
                ship[i].cont = 0;
                ship[i].estagio = 0;
                ship[i].numpulos++;
                ship[i].jump = false;
            }

        }
        else
        {
            ship[i].jump = false;
        }
    }

}












/*void initSprite(Sprites sprite,SpaceShip ship[])
{

    sprite.altura_sprite=298;
    sprite.largura_sprite=171;

    sprite.colunas_folha=6;
    sprite.coluna_atual=0;

    sprite.linha_atual=2;
    sprite.linhas_folha=0;

    sprite.regiao_x_folha=0;
    sprite.regiao_y_folha=0;

    sprite.frames_sprite=6;
    sprite.cont_frames=0;

    sprite.pos_x_sprite=ship[0].x;
    sprite.pos_y_sprite=ship[0].y;

    sprite.vel_x_sprite=4;
    sprite.vel_y_sprite=0;
}




*/



















void InitBullet(Bullet bullet[], int size)
{
    for(int i = 0; i < size; i++)
    {
        bullet[i].ID = BULLET;
        bullet[i].speed = 10;
        bullet[i].live = false;
    }
}
void DrawBullet(Bullet bullet[], int size)
{
    for( int i = 0; i < size; i++)
    {
        if(bullet[i].live)
            al_draw_filled_circle(bullet[i].x, bullet[i].y, 2, al_map_rgb(0, 0, 0));
    }
}
void FireBullet(Bullet bullet[], int size, SpaceShip &ship)
{
    for( int i = 0; i < size; i++)
    {
        if(!bullet[i].live)
        {
            bullet[i].x = ship.x + 17;
            bullet[i].y = ship.y;
            bullet[i].live = true;
            break;
        }
    }
}
void UpdateBullet(Bullet bullet[], int size)
{
    for(int i = 0; i < size; i++)
    {
        if(bullet[i].live)
        {
            bullet[i].x += bullet[i].speed;
            if(bullet[i].x > WIDTH)
                bullet[i].live = false;
        }
    }
}
void CollideBullet(Bullet bullet[], int bSize, Comet comets[], int cSize, SpaceShip &ship)
{
    for(int i = 0; i < bSize; i++)
    {
        if(bullet[i].live)
        {
            for(int j =0; j < cSize; j++)
            {
                if(comets[j].live)
                {
                    if(bullet[i].x > (comets[j].x - comets[j].boundx) &&
                            bullet[i].x < (comets[j].x + comets[j].boundx) &&
                            bullet[i].y > (comets[j].y - comets[j].boundy) &&
                            bullet[i].y < (comets[j].y + comets[j].boundy))
                    {
                        bullet[i].live = false;
                        comets[j].live = false;

                        ship.score++;
                    }
                }
            }
        }
    }
}

void InitComet(Comet comets[], int size)
{
    for(int i = 0; i < size; i++)
    {
        comets[i].ID = ENEMY;
        comets[i].live = false;
        comets[i].speed = 5;
        comets[i].boundx = 18;
        comets[i].boundy = 18;
    }
}
void DrawComet(Comet comets[], int size)
{
    for(int i = 0; i < size; i++)
    {
        if(comets[i].live)
        {
            al_draw_filled_circle(comets[i].x, comets[i].y, 20, al_map_rgb(255, 0, 0));
        }
    }
}
void StartComet(Comet comets[], int size)
{
    for(int i = 0; i < size; i++)
    {
        if(!comets[i].live)
        {
            if(rand() % 500 == 0)
            {
                comets[i].live = true;
                comets[i].x = WIDTH;
                comets[i].y = 30 + rand() % (HEIGHT - 60);

                break;
            }
        }
    }
}
void UpdateComet(Comet comets[], int size)
{
    for(int i = 0; i < size; i++)
    {
        if(comets[i].live)
        {
            comets[i].x -= comets[i].speed;
        }
    }
}
void CollideComet(Comet comets[], int cSize, SpaceShip &ship)
{
    for(int i = 0; i < cSize; i++)
    {
        if(comets[i].live)
        {
            if(comets[i].x - comets[i].boundx < ship.x + ship.boundx &&
                    comets[i].x + comets[i].boundx > ship.x - ship.boundx &&
                    comets[i].y - comets[i].boundy < ship.y + ship.boundy &&
                    comets[i].y + comets[i].boundy > ship.y - ship.boundy)
            {
                ship.lives--;
                comets[i].live = false;
            }
            else if(comets[i].x < 0)
            {
                comets[i].live = false;
                ship.lives--;
            }
        }
    }
}
