#include "pause.h"
#include "gamestate.h"
#include "util.h"
#include "sgg/graphics.h"

pause::~pause()
{
	delete this;
}


pause::pause(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_photos.outline_opacity = 0.0f;


}



void pause::init()

{
	
	m_brush_background.texture = m_state->getFullAssetPath("pause.png");
	

}
void pause::draw()
{

	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	//draw background
	graphics::drawRect(5.0f, 3.0f, w, h, m_brush_background);

	

}

void pause::update(float dt)
{



	if (graphics::getKeyState(graphics::SCANCODE_R)|| graphics::getKeyState(graphics::SCANCODE_T) || graphics::getKeyState(graphics::SCANCODE_E)){
		gameLevel* nextLevel = switchLevel();

		if (nextLevel != nullptr) {
			m_state->m_current_Level = nextLevel;
		}

	}

	

	GameObject::update(dt);
}

gameLevel* pause::switchLevel()

{
	if (graphics::getKeyState(graphics::SCANCODE_R)) {
		gameLevel* nextLevel = m_state->Levels[m_state->currNumbLvl];
		m_state->currNumbLvl -= 1;
		nextLevel->init();
		return nextLevel;
	}

	if (graphics::getKeyState(graphics::SCANCODE_T)) {
		gameLevel* nextLevel = m_state->Levels[1];
		nextLevel->init();
		return nextLevel;
	}

	if (graphics::getKeyState(graphics::SCANCODE_E)) {
		{
			exit(0);
		}
	return nullptr;
	}	


}

