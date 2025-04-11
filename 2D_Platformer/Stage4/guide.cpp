#include "guide.h"
#include "gamestate.h"
#include "util.h"
#include "sgg/graphics.h"

guide::~guide()
{
	delete this;
}


guide::guide(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	

}



void guide::init()

{
	//SETCOLOR(m_brush_background.fill_color, 2.0f, 2.0f, 2.0f);
	m_brush_background.texture = m_state->getFullAssetPath("tutorial.png");
	

}
void guide::draw()
{

	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	//draw background
	graphics::drawRect(5.0f, 3.0f, w, h, m_brush_background);


	



	//graphics::drawRect(2.0f, 1.0f, 0.5f * w, 0.5 * h, m_brush_background);


	//graphics::drawText(4.0f, 1.0f, 0.3f, "Super Trapper Multiverse");


	//graphics::playSound(std::string  , float volume, bool looping = false);

}

void guide::update(float dt)
{
	//float p = 0.5f + fabs(cos(graphics::getGlobalTime() / 1000.0f));
	//SETCOLOR(m_brush_photos.fill_color, p, p, p);




	gameLevel* nextLevel = switchLevel();


	if (graphics::getKeyState(graphics::SCANCODE_S)) {
		gameLevel* nextLevel = switchLevel();

		if (nextLevel != nullptr) {
			m_state->m_current_Level = nextLevel;
		}

	}

	GameObject::update(dt);
}

gameLevel* guide::switchLevel()

{
	if (graphics::getKeyState(graphics::SCANCODE_S)) {
		{
			gameLevel* nextLevel = m_state->Levels[2];
			nextLevel->init();
			return nextLevel;
		}
		return nullptr;
	}

}