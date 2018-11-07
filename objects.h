//Object IDS
enum IDS {PLAYER, BULLET, ENEMY};

//Our Player

/*           _              _
          | |            | |
  ___  ___| |_ _ __ _   _| |_ _   _ _ __ ____  ___
 / _ \/ __| __|  __| | | | __| | | |  __/ _   / __|
|  __/\__ \ |_| |  | |_| | |_| |_| | | | (_|  \__ \
 \___||___/\__|_|   \____|\__|\____|_|  \____ |___/

                                                  */

struct SpaceShip
{
    int ID;
    int x;
    int y;
    int lives;
    int speed;
    int boundx;
    int boundy;
    int score;

    bool jump;
    int cont;
    int numpulos;
    int estagio;

    int direcao;
//    struct Bullet bullets;
};

struct Bullet
{
    int ID;
    int x;
    int y;
    bool live;
    int speed;
};

struct Comet
{
    int ID;
    int x;
    int y;
    bool live;
    int speed;
    int boundx;
    int boundy;
};

struct Sprites
{


    int altura_sprite;
    int largura_sprite;

    int colunas_folha;
    int coluna_atual;

    int linha_atual;
    int  linhas_folha;

    int regiao_x_folha;
    int  regiao_y_folha;

    int frames_sprite;
    int  cont_frames;

    int pos_x_sprite;
    int  pos_y_sprite;

    int vel_x_sprite;
    int vel_y_sprite;


};
