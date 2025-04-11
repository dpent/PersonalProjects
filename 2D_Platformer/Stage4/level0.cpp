#include "level0.h"
#include "gamestate.h"
#include "util.h"
#include "sgg/graphics.h"



level0::~level0()
{
	delete this;
}


level0::level0(const std::string& name)
	: gameLevel(name)
{
	m_brush_background.outline_opacity = 0.0f;
	m_brush_photos.outline_opacity = 0.0f;


	//m_brush_background.texture = m_state->getFullAssetPath("gamemenu.png");
	//m_brush_photos.texture = m_state->getFullAssetPath("supertrappermultiverse2.png");


	//graphics::playMusic(m_state->getFullAssetPath("song0.wav"), 100.0f, true, 0);

	//graphics::playSound(m_state->getFullAssetPath("song0.wav"), 18.0f);
}



void level0::init()

{


	//SETCOLOR(m_brush_background.fill_color, 2.0f, 2.0f, 2.0f);
	m_brush_background.texture = m_state->getFullAssetPath("gamemenu.png");
	m_brush_photos.texture = m_state->getFullAssetPath("supertrappermultiverse2.png");
	graphics::playMusic(m_state->getFullAssetPath("song0.wav"), 1.0f, false, 0);

}
void level0::draw()
{
	
	float w = m_state->getCanvasWidth();
	float h = m_state->getCanvasHeight();

	//draw background
	graphics::drawRect(5.0f, 5.0f, w, h, m_brush_background);


	graphics::drawRect(5.0f, 1.8f, 0.5f * w, 0.5f * h, m_brush_photos);
	


	//graphics::drawRect(2.0f, 1.0f, 0.5f * w, 0.5 * h, m_brush_background);


	//graphics::drawText(4.0f, 1.0f, 0.3f, "Super Trapper Multiverse");


	//graphics::playSound(std::string  , float volume, bool looping = false);
	
}

void level0::update(float dt)
{
	float p = 0.5f + fabs(cos(graphics::getGlobalTime()/1000.0f));
	SETCOLOR(m_brush_photos.fill_color, p, p, p);

	


	gameLevel* nextLevel = switchLevel();


	if (graphics::getKeyState(graphics::SCANCODE_H)) {
		gameLevel* nextLevel = switchLevel();

		if (nextLevel != nullptr) {
			m_state->currNumbLvl += 1;
			m_state->m_current_Level = nextLevel;
		}
	
	}

	GameObject::update(dt);
}

gameLevel* level0::switchLevel()
{
	if (graphics::getKeyState(graphics::SCANCODE_O)) {
		gameLevel* nextLevel = m_state->Levels[7];
		nextLevel->init();
		return nextLevel;
	}

	if (graphics::getKeyState(graphics::SCANCODE_H)) {
		{
			graphics::stopMusic(0);
			gameLevel* nextLevel = m_state->Levels[1];
			nextLevel->init();
			return nextLevel;
		}
	return nullptr;
	}
	

	
}
