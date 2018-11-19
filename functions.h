
/*
   __                  /\/|
  / _|                |/\/
 | |_ _   _ _ __   ___ ___   ___  ___
 |  _| | | |  _ \ / __/ _ \ / _ \/ __|
 | | | |_| | | | | (_| (_) |  __/\__ \
 |_|  \__,_|_| |_|\___\___/ \___||___/
                   )_)
                                     */

const int WIDTH = 1080;
const int HEIGHT = 720;
const int NUM_BULLETS = 5;
const int NUM_COMETS = 1;

void InitMapa(Level &mapa)
{
    mapa.ID = 0;
    mapa.Tempo = 0;
    mapa.Rodadas = 0;
}
void InitShip(SpaceShip ship[])
{

    ship[0].x = WIDTH/2;
    ship[0].y = HEIGHT / 3;
    ship[0].ID = PLAYER;
    ship[0].lives = 200;
    ship[0].speed = 5;
    ship[0].boundx = 20;
    ship[0].boundy = 20;
    ship[0].score = 0;
    ship[0].jump = false;
    ship[0].cont = 0;
    ship[0].numpulos=0;
    ship[0].estagio = 0;
    ship[0].golped = false;
    ship[0].contGolp = 0;
    ship[0].hit = false;
    ship[0].hitme = false;
    ship[0].direcao = 1;
    ship[0].numDano = 0;
    ship[0].cor = 0;
    ship[0].armaAtual = 9;

    ship[1].direcao = 1;
    ship[1].x = WIDTH/4;
    ship[1].y = HEIGHT / 4;
    ship[1].ID = PLAYER;
    ship[1].lives = 200;
    ship[1].speed = 5;
    ship[1].boundx = 20;
    ship[1].boundy = 20;
    ship[1].score = 0;
    ship[1].jump = false;
    ship[1].cont = 0;
    ship[1].numpulos=0;
    ship[1].estagio = 0;
    ship[1].golped = false;
    ship[1].contGolp = 0;
    ship[1].hit = false;
    ship[1].hitme = false;
    ship[1].numDano = 0;
    ship[1].numDano = 0;
    ship[1].cor = 0;
    ship[1].armaAtual = 9;
}
void DrawShip(SpaceShip ship[])
{
    al_draw_filled_rectangle(ship[1].x, ship[1].y, ship[1].x+10, ship[1].y+10, al_map_rgb(0, 255, 0));
    al_draw_filled_rectangle(ship[0].x, ship[0].y, ship[0].x + 10, ship[0].y + 10, al_map_rgb(0, 0, 0));

}

void gravity(SpaceShip ship[],int num)
{
    ship[num].y+= 7;
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
void CollidePlayer(SpaceShip ship[],int num)
{
    if(ship[0].x - ship[0].boundx < ship[1].x + ship[1].boundx &&
            ship[0].x + ship[0].boundx > ship[1].x - ship[1].boundx &&
            ship[0].y - ship[0].boundy < ship[1].y + ship[1].boundy &&
            ship[0].y + ship[0].boundy > ship[1].y - ship[1].boundy)
    {
        if(num ==0)
        {
            if (ship[num].direcao==1)
            {
                ship[0].hit=true;
                ship[1].hitme=true;

            }
            else
            {
                ship[0].hit=true;
                ship[1].hitme=true;

            }

            ship[1].lives-=10;
        }
        else
        {
            if (ship[num].direcao==1)
            {
                ship[1].hit=true;
                ship[0].hitme=true;

            }
            else
            {
                ship[1].hit=true;

                ship[0].hitme=true;

            }
            ship[0].lives-=10;
        }

    }


}











void golpe(SpaceShip ship[],int num,const int dange[],const int tempo[])
{
    if(ship[num].golped)
    {
        if(ship[num].direcao==0)
        {
            if(ship[num].contGolp == tempo[ship[num].estagio])
            {
                ship[num].estagio++;

                ship[num].x = ship[num].x - dange[ship[num].estagio];
                CollidePlayer(ship,num);
                if(ship[num].hit)
                    ship[num].contGolp=19;
            }
            ship[num].contGolp++;

        }

        else if(ship[num].direcao==1)
        {
            if(ship[num].contGolp == tempo[ship[num].estagio])
            {
                ship[num].estagio++;

                ship[num].x = ship[num].x + dange[ship[num].estagio];
                CollidePlayer(ship,num);
                if(ship[num].hit)
                    ship[num].contGolp=19;
            }
            ship[num].contGolp++;
        }
    }
    if(ship[num].contGolp>=19)
    {
        ship[num].contGolp = 0;
        ship[num].estagio = 0;
        ship[num].golped = false;
        ship[num].hit=false;



    }









}
void hit(SpaceShip ship[],const int dange[],const int tempo[],int num,const float porcDano[])
{
    int adv = (num+11)%2;
    float dano =( dange[ship[num].estagio]);
    dano = dano*(porcDano[ship[num].numDano]);
    if(ship[num].hitme)
    {

        if(ship[adv].direcao==0)
        {
            if(ship[num].contGolp == tempo[ship[num].estagio])
            {
                ship[num].estagio++;

                ship[num].x = ship[num].x - dano;

            }
            ship[num].contGolp++;
        }


        else if(ship[adv].direcao==1)
        {

            if(ship[num].contGolp == tempo[ship[num].estagio])
            {
                ship[num].estagio++;
                ship[num].x = (ship[num].x + dano);


            }
            ship[num].contGolp++;
        }



        //printf("%d\n",ship[num].contGolp);
        if(ship[num].contGolp>=19)
        {

            ship[num].contGolp = 0;
            ship[num].estagio = 0;
            ship[num].golped = false;
            ship[num].hitme=false;
            ship[num].numDano++;
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
void FireBullet(Bullet bullet[], int size, SpaceShip ship[])
{
    for( int i = 0; i < size; i++)
    {
        if(!bullet[i].live)
        {
            bullet[i].x = ship[0].x + 17;
            bullet[i].y = ship[0].y;
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
void CollideBullet(Bullet bullet[], int bSize, Comet comets[], int cSize, SpaceShip ship[])
{
    for(int i = 0; i < bSize; i++)
    {
        if(bullet[i].live)
        {
            for(int j =0; j < 2; j++)
            {

                if(bullet[i].x > (ship[j].x - ship[j].boundx) &&
                        bullet[i].x < (ship[j].x + ship[j].boundx) &&
                        bullet[i].y > (ship[j].y - ship[j].boundy) &&
                        bullet[i].y < (ship[j].y + ship[j].boundy))
                {
                    bullet[i].live = false;

                    ship[j].lives --;

                    ship[j].score++;

                }
            }
        }
    }
}

void InitComet(Comet comets[], int size)
{   //printf("OI");
    for(int i = 0; i < size; i++)
    {
        comets[i].ID = ENEMY;
        comets[i].live = false;
        comets[i].speed = 10;
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
            switch(comets[i].idArm){

        case 0:
             al_draw_filled_circle(comets[i].x, comets[i].y, 20, al_map_rgb(25, 255, 0));
            break;
        case 1:
             al_draw_filled_circle(comets[i].x, comets[i].y, 20, al_map_rgb(255, 25, 0));
            break;
        case 2:
             al_draw_filled_circle(comets[i].x, comets[i].y, 20, al_map_rgb(255, 255, 95));
            break;
        case 3:
         al_draw_filled_circle(comets[i].x, comets[i].y, 20, al_map_rgb(5, 25, 45));
            break;
            }
        }
    }
}
void StartComet(Comet comets[], int size)
{
    bool on = false;

    for(int i = 0; i < size; i++)
    {

        if(!comets[i].live)
        {
            if(rand() % 250 == 0)
            {
                comets[i].live = true;
                comets[i].x = 200+rand()%(WIDTH-500);

                printf("\n %d",i);
                comets[i].y = 0;
                comets[i].idArm = rand()%4;

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
            comets[i].y += comets[i].speed;
        }
        if(comets[i].y >=400)
            {
                comets[i].y = 400;

            }

    }
}
void CollideComet(Comet comets[], int cSize,int num,SpaceShip ship [])
{
    for(int i = 0; i < cSize; i++)
    {
        if(comets[i].live)
        {
            if(comets[i].x - comets[i].boundx < ship[num].x + ship[num].boundx &&
                   comets[i].x + comets[i].boundx > ship[num].x - ship[num].boundx &&
                   comets[i].y - comets[i].boundy < ship[num].y + ship[num].boundy &&
                   comets[i].y + comets[i].boundy > ship[num].y - ship[num].boundy)
          {
                    comets[i].live = false;
                    ship[num].armaAtual = comets[i].idArm;

            }
             if(comets[i].y >=HEIGHT)
            {
                comets[i].live = false;

            }
        }
    }
}
