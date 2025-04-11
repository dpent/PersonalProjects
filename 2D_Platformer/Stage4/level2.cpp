#include "Level2.h"
#include <sgg/graphics.h>
#include "player.h"
#include "util.h"
#include "finishBlock.h"
#include "gamestate.h"
#include "powerupBlock.h"
#include "enemyHorizontalBlock.h"
#include "enemyVertical.h"
#include "carKeyBlock.h"


void Level2::update(float dt)
{
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->update(dt);

	gameLevel* nextLevel = switchLevel();

	if (nextLevel != nullptr) {
		m_state->currNumbLvl += 1;
		m_state->m_current_Level = nextLevel;
	}

	for (int i = 0; i < m_blocks.size(); i++)
	{
		if (m_blocks[i]->blockType() == 4) {
			for (auto& box : m_boxes) {
				if (m_blocks[i]->intersectSideways(box)) {
					reinterpret_cast<enemyHorizontalBlock*>(m_blocks[i])->moveSpeed = -reinterpret_cast<enemyHorizontalBlock*>(m_blocks[i])->moveSpeed;
				}
			}
			float j = 0.0f;
			for (auto block : m_blocks) {
				if (m_blocks[i]->intersectSideways(*block) > j) {
					reinterpret_cast<enemyHorizontalBlock*>(m_blocks[i])->moveSpeed = -reinterpret_cast<enemyHorizontalBlock*>(m_blocks[i])->moveSpeed;
				}
			}
			reinterpret_cast<enemyHorizontalBlock*>(m_blocks[i])->MoveEnemy();
		}		
	}


	//float delta_time = dt / 1000.0f;
	graphics::MouseState mouse;
	graphics::getMouseState(mouse);
	if (mouse.button_left_pressed && m_state->hasSword)
	{

		check_kill();
	}

	

	checkCollisions();

	GameObject::update(dt);
}

void Level2::draw()
{
	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	float offset_x = m_state->m_global_offset_x / 2.0f + w / 2.0f;
	float offset_y = m_state->m_global_offset_y / 2.0f + h / 2.0f;

	//draw background
	graphics::drawRect(offset_x, offset_y, 2.0f * w, 2.0f * h, m_brush_background);

	// draw player
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->draw();
		

	// draw blocks

	for (int i = 0; i < m_boxes.size(); i++)
	{
		drawBox(i);
	}

	for (int i = 0; i < m_blocks.size(); i++)
	{
		drawBlock(i);
	}

	if (calculatePowerupTimeLeft() != -1) {
		graphics::drawText(4.0f, 1.0f, 0.3f, "Low gravity: " + std::to_string(calculatePowerupTimeLeft()) + " secs", m_state->score_brush);
	}

	/*for (int i = 0; i < m_enemies.size(); i++)
	{
		drawEnemy(i);
	}*/
}

void Level2::init()
{

	

	m_state->getPlayer()->m_gravity = 10.0f;
	powerupGrav = false;

	// Stage 1
	for (auto p_gob : m_static_objects)
		if (p_gob) p_gob->init();

	for (auto p_gob : m_dynamic_objects)
		if (p_gob) p_gob->init();

	m_boxes.push_back(Box(-1, 5, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(0, 4, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(1, 2.7, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(2, 2.7, 0.3, 0.6, "citybrick.png"));
	m_boxes.push_back(Box(3, 1, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(4, 0, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(5, 3, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(6, 2, 0.6, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(7, 2, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(8, 2, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(9, 2, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(10, 2, 0.3, 0.3, "citybrick.png"));
	m_boxes.push_back(Box(11, 2, 0.3, 0.3, "citybrick.png"));




	
	starting_pos_x = -1.0f;
	starting_pos_y = 3.0f;
	
	m_state->getPlayer()->m_pos_x = starting_pos_x;
	m_state->getPlayer()->m_pos_y = starting_pos_y;
	m_state->getPlayer()->lastFrame=m_state->getFullAssetPath("flyloR1.png");
	

	m_blocks.push_back(new finishBlock(12, 1, 1, 1, m_state));
	
	



	m_block_brush.outline_opacity = 0.0f;
	m_block_brush_debug.fill_opacity = 0.1f;
	SETCOLOR(m_block_brush_debug.fill_color, 0.1f, 1.0f, 0.1f);
	SETCOLOR(m_block_brush_debug.outline_color, 0.3f, 1.0f, 0.2f);
}

Level2::Level2(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_background.texture = m_state->getFullAssetPath("level2city.png");


}

Level2::~Level2()
{
	for (auto p_go : m_static_objects)
		delete p_go;
	for (auto p_go : m_dynamic_objects)
		delete p_go;
	for (auto p_go : m_blocks)
		delete p_go;
}

gameLevel* Level2::switchLevel()
{
	if ((m_state->getPlayer()->m_pos_y) >= 7.0) {

		gameLevel* nextLevel = m_state->Levels[6];
		nextLevel->init();
		m_state->score = 0;
		return nextLevel;
	}

	if (graphics::getKeyState(graphics::SCANCODE_O)) {
		gameLevel* nextLevel = m_state->Levels[7];
	}

	Player* player = m_state->getPlayer();
	finishBlock* fin = static_cast<finishBlock*>(m_blocks[0]);
	if (player->intersectDown(*fin) || player->intersectSideways(*fin))
	{
		gameLevel* nextLevel = m_state->Levels[6];
		nextLevel->init();
		m_state->score += 500;
		return nextLevel;
	}
	else
	{
		return nullptr;
	}
	

}


