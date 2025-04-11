#include "highwaylvl.h"
#include <sgg/graphics.h>
#include "player.h"
#include "util.h"
#include "finishBlock.h"
#include "gamestate.h"
#include "powerupBlock.h"




void highwaylvl::update(float dt)
{
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->update(dt);

	gameLevel* nextLevel = switchLevel();

	if (nextLevel != nullptr) {
		m_state->currNumbLvl += 1;
		m_state->m_current_Level = nextLevel;
	}

	checkCollisions();

	GameObject::update(dt);
}

void highwaylvl::draw()
{
	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	float offset_x = m_state->m_global_offset_x / 2.0f + w / 2.0f;
	float offset_y = m_state->m_global_offset_y / 2.0f + h / 2.0f;

	//draw background
	graphics::drawRect(offset_x, offset_y, 1.0f * w, 1.5f * h, m_brush_background);

	// draw player
	if (m_state->getPlayer()->isActive())
		m_state->getPlayer()->draw();


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
}
	



void highwaylvl::init()
{
	


	for (auto p_gob : m_static_objects)
		if (p_gob) p_gob->init();

	for (auto p_gob : m_dynamic_objects)
		if (p_gob) p_gob->init();

	m_boxes.push_back(Box(-2, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(0, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(-1, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(1, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(2, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(3, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(4, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(5, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(6, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(7, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(8, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(9, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(10, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(11, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(12, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(13, 8, 1, 1, "transparent.png"));
	m_boxes.push_back(Box(14, 8, 1, 1, "transparent.png"));
	
	starting_pos_x = 1.0f;
	starting_pos_y = 7.0f;

	m_blocks.push_back(new finishBlock(12, 7, 1, 1, m_state));

	m_state->getPlayer()->m_pos_x = starting_pos_x;
	m_state->getPlayer()->m_pos_y = starting_pos_y;

	m_block_brush.outline_opacity = 0.0f;
	m_block_brush_debug.fill_opacity = 0.1f;
	SETCOLOR(m_block_brush_debug.fill_color, 0.1f, 1.0f, 0.1f);
	SETCOLOR(m_block_brush_debug.outline_color, 0.3f, 1.0f, 0.2f);
}

highwaylvl::highwaylvl(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_background.texture = m_state->getFullAssetPath("highway.png");

}



highwaylvl::~highwaylvl()
{
	for (auto p_go : m_static_objects)
		delete p_go;
	for (auto p_go : m_dynamic_objects)
		delete p_go;
	for (auto p_go : m_blocks)
		delete p_go;
}

gameLevel* highwaylvl::switchLevel()
{

	if (graphics::getKeyState(graphics::SCANCODE_O)) {
		gameLevel* nextLevel = m_state->Levels[7];
		nextLevel->init();
		return nextLevel;
	}
	Player* player = m_state->getPlayer();
	finishBlock* fin = static_cast<finishBlock*>(m_blocks[0]);
	if (player->intersectDown(*fin) || player->intersectSideways(*fin))
	{
		gameLevel* nextLevel = m_state->Levels[5];
		nextLevel->init();
		m_state->score += 500;
		return nextLevel;
	}
	else
	{
		return nullptr;
	}

}
