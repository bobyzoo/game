//Object IDS
enum IDS{PLAYER, BULLET, ENEMY};

//Our Player

/*           _              _
          | |            | |
  ___  ___| |_ _ __ _   _| |_ _   _ _ __ __ _ ___
 / _ \/ __| __| '__| | | | __| | | | '__/ _` / __|
|  __/\__ \ |_| |  | |_| | |_| |_| | | | (_| \__ \
 \___||___/\__|_|   \__,_|\__|\__,_|_|  \__,_|___/

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
