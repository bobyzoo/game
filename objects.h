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

    bool jump;  //SE ESTA PULANDO
    int cont;      //CONTADOR DO MOVIMENTO JUMP
    int numpulos;   //NUMEROS DE PULOS GASTOS-----MAXIMO 2 PULOS
    int estagio;     //ESTAGIOS DE PULOS PARA FAZER UM PULO COM PONTOS INTERPOLADOS

    int direcao;  //0-ESQUERDA 1-DIREITA
    bool golped; //SE O GOLPE FOI ATIVO
    bool hit;   //SE O PLAYER ENCOSTOU NO OPONENTE
    int contGolp; //CONTADOR DO MOVIMENTO DE ATAQUE

    bool hitme;//SE O PLAYER FOI GOLPEADO

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
