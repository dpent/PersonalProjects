#pragma once
#include <vector>
#include <list>
#include "enemyHorizontalBlock.h"
#include "box.h"
#include "block.h"
#include "gameobject.h"
#include "sgg/graphics.h"

class gameLevel: public GameObject
{

public:

	bool powerupGrav = false;

	virtual gameLevel* switchLevel() = 0;

	float starting_pos_x = 0.0f;
	float starting_pos_y = 0.0f;


	graphics::Brush m_brush_background;

	std::vector<GameObject*> m_static_objects;
	std::list<GameObject*> m_dynamic_objects;


	graphics::Brush m_brush_photos;

	// add some collidable blocks
	std::vector<Box> m_boxes;
	std::vector<Block*> m_blocks; //ola ta blocks
	const float m_block_size = 1.0f;
	graphics::Brush m_block_brush;
	graphics::Brush m_block_brush_debug;
	time_t powerupEndTime;
	time_t knifeTextTime;
	time_t carTextTime;


	// dedicated method to draw a block
	virtual void drawBox(int i);

	//gia block
	virtual void drawBlock(int i);

	// detect collisions
	virtual void checkCollisions();

	virtual bool check_kill();
	// gia enemies
	//virtual void drawEnemy(int i);

	// powerup given
	//virtual bool givePowerup();

	gameLevel();

	gameLevel(const std::string& name)
		:GameObject(name)
	{

	}

	int calculatePowerupTimeLeft();

	int calculateTextTimeLeft();
};