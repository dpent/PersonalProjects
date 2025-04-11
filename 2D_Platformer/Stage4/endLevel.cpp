#include "endLevel.h"
#include "gamestate.h"
#include "util.h"

endLevel::~endLevel()
{
	delete this;
}


endLevel::endLevel(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_background.texture = m_state->getFullAssetPath(".png");


}


void endLevel::init()
{
	SETCOLOR(m_state->score_brush.fill_color, 1.0f, 1.0f, 0.4f);
	SETCOLOR(m_brush_background.fill_color, 0.8f, 0.8f, 0.8f);
}


void endLevel::draw()
{
	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	//draw background
	graphics::drawRect(5.0f, 2.0f, 1.0f * w, 2.0f * h, m_brush_background);
}

void endLevel::update(float dt)
{
	gameLevel* nextLevel = switchLevel();


	if (graphics::getKeyState(graphics::SCANCODE_E)) {
		exit(0);
	}

	GameObject::update(dt);
}

gameLevel* endLevel::switchLevel()
{
	return m_state->Levels[3];
}
