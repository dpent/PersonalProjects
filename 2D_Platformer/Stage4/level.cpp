#include "Level.h"
#include <sgg/graphics.h>
#include "player.h"
#include "util.h"
#include "finishBlock.h"
#include "gamestate.h"
#include "powerupBlock.h"
#include "knifepowerupBlock.h"
#include "carKeyBlock.h"






void Level::update(float dt)
{
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->update(dt);

	gameLevel* nextLevel = switchLevel();
	
	if (nextLevel != nullptr) {
		m_state->currNumbLvl += 1;
		m_state->m_current_Level = nextLevel;
	}
	graphics::MouseState mouse;
	graphics::getMouseState(mouse);
	if (mouse.button_left_pressed && m_state->hasSword)
	{
		
		check_kill();
	}

	checkCollisions();

	GameObject::update(dt);
}

void Level::draw()
{
	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();
	
	float offset_x = m_state->m_global_offset_x / 2.0f + w/2.0f;
	float offset_y = m_state->m_global_offset_y / 2.0f + h/2.0f;

	//draw background
	graphics::drawRect(offset_x, offset_y, 1.5*w, 1.5*h, m_brush_background);

	// draw player
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->draw();
		/*Player* player = m_state->getPlayer();
		knifeBlock* knife = static_cast<knifeBlock*>(m_blocks[0]);
		if (player->intersectDown(*knife) || player->intersectSideways(*knife)) {
			graphics::drawText(3.0f, 5.5f, 0.5f, "Congratulations!!! You acquired the Fly Lo's Machete (Knife)", m_state->knife_brush);
		}*/

		

	// draw blocks

	for (int i = 0; i < m_boxes.size(); i++)
	{
		drawBox(i);
	}
	
	for (int i = 0; i < m_blocks.size(); i++)
	{
		drawBlock(i);
	}

	/*if (calculatePowerupTimeLeft() != -1) {
		graphics::drawText(4.0f, 1.0f, 0.3f, "Low gravity: " + std::to_string(calculatePowerupTimeLeft()) + " secs", m_state->score_brush);
	}*/
	
	if (calculateTextTimeLeft() != -1) {
		graphics::drawText(2.0f, 1.0f, 0.3f, "Congratulations!!!You acquired the Fly Lo's Machete (Knife)" , m_state->score_brush);
		
	}
	
}

void Level::init()
{

	
	// Stage 1
	for (auto p_gob : m_static_objects)
		if (p_gob) p_gob->init();
	
	for (auto p_gob : m_dynamic_objects)
		if (p_gob) p_gob->init();

	starting_pos_x = 2.0f;
	starting_pos_y = 3.0f;

	m_state->getPlayer()->m_pos_x = starting_pos_x;
	m_state->getPlayer()->m_pos_y = starting_pos_y;
	
	m_boxes.push_back(Box( 5, 6, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 4, 6, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 3, 6, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 2, 5, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 6, 6, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 7, 6, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 8, 5, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 1, 5, 1, 1, "grass1.png"));
	m_boxes.push_back(Box( 9, 4, 1, 1, "grass1.png"));
	m_boxes.push_back(Box(10, 4, 1, 1, "grass1.png"));
	m_boxes.push_back(Box(11, 4, 1, 1, "grass1.png"));

	m_blocks.push_back(new finishBlock(11, 3, 1, 1, m_state));
	m_blocks.push_back(new keyBlock(8, 4, 1, 1, m_state));
	m_blocks.push_back(new knifeBlock(5, 5, 1, 1, m_state));
	


	m_block_brush.outline_opacity = 0.0f;
	m_block_brush_debug.fill_opacity = 0.1f;
	SETCOLOR(m_block_brush_debug.fill_color, 0.1f, 1.0f, 0.1f);
	SETCOLOR(m_block_brush_debug.outline_color, 0.3f, 1.0f, 0.2f);
}

Level::Level(const std::string & name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_background.texture = m_state->getFullAssetPath("morning.png");


}

Level::~Level()
{
	for (auto p_go : m_static_objects)
		delete p_go;
	for (auto p_go : m_dynamic_objects)
		delete p_go;
	for (auto p_go : m_blocks)
		delete p_go;
}

gameLevel* Level::switchLevel()
{
	if ((m_state->getPlayer()->m_pos_y) >= 7.0) {

		gameLevel* nextLevel = m_state->Levels[6];
		nextLevel->init();
		m_state->score = 0;
		return nextLevel;
	}

	if (graphics::getKeyState(graphics::SCANCODE_O)) {
		gameLevel* nextLevel = m_state->Levels[7];
		nextLevel->init();
		return nextLevel;
	}

	Player* player = m_state->getPlayer();
	finishBlock* fin = static_cast<finishBlock*>(m_blocks[0]);
	if (player->intersectDown(*fin) || player->intersectSideways(*fin))
	{
		gameLevel* nextLevel = m_state->Levels[3];
		nextLevel->init();
		m_state->score += 500;
		return nextLevel;
	}
	else
	{
		return nullptr;
	}
	

}


