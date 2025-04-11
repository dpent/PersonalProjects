#include "gamestate.h"
#include "Level1.h"
#include "level2.h"
#include "endLevel.h"
#include "player.h"
#include <thread>
#include <chrono>
#include <ctime>
#include "gameLevel.h"
#include "level.h"
#include "level0.h"
#include "highwaylvl.h"
#include "guide.h"
#include "pause.h"

using namespace std::chrono_literals;

GameState::GameState()
{
}

GameState::~GameState()
{
	if (m_current_Level)
		delete m_current_Level;
}

GameState* GameState::getInstance()
{
	if (!m_unique_instance)
	{
		m_unique_instance = new GameState();
	}
	return m_unique_instance;
}

bool GameState::init()
{
	
	Levels.push_back(new level0());   //0
	Levels.push_back(new guide());    //1
	Levels.push_back(new Level());    //2
	Levels.push_back(new Level1());   //3
	Levels.push_back(new highwaylvl()); //4
	Levels.push_back(new Level2());     //5
	Levels.push_back(new endLevel());   //6
	Levels.push_back(new pause());      //7
	m_current_Level = Levels[0];
	m_current_Level->init();
	m_player = new Player("Player");
	m_player->init();

	graphics::preloadBitmaps(getAssetDir());
	graphics::setFont(m_asset_path + "OpenSans-Regular.ttf");
	
	timeAtStart = time(nullptr);
	return true;
}

void GameState::draw()
{
	if (!m_current_Level)
		return;
	if (m_current_Level != Levels[6] && m_current_Level != Levels[0] && m_current_Level != Levels[1]) {
		m_current_Level->draw();
		graphics::drawText(0, 0.2f, 0.2f, "Score: " + std::to_string(score), score_brush);
		std::string gametime;
		if ((currTime - timeAtStart) % 60 < 10) {
			if (currTime - timeAtStart < 60) {
				gametime = "00:0" + std::to_string(currTime - timeAtStart);
			}
			else {
				if ((currTime - timeAtStart / 60) < 10) {
					gametime = "0" + std::to_string((currTime - timeAtStart) / 60) + ":0" + std::to_string((currTime - timeAtStart) % 60);
				}
				else {
					gametime = std::to_string((currTime - timeAtStart) / 60) + ":0" + std::to_string((currTime - timeAtStart) % 60);
				}
			}
		}
		else {
			if (currTime - timeAtStart < 60) {
				gametime = "00:" + std::to_string(currTime - timeAtStart);
			}
			else {
				if ((currTime - timeAtStart / 60) < 10) {
					gametime = "0" + std::to_string((currTime - timeAtStart) / 60) + ":" + std::to_string((currTime - timeAtStart) % 60);
				}
				else {
					gametime = std::to_string((currTime - timeAtStart) / 60) + ":" + std::to_string((currTime - timeAtStart) % 60);
				}
			}
		}
		finalTime = gametime;
		graphics::drawText(0, 0.4f, 0.2f, "Time: " + gametime, score_brush);
	}
	else {
		if (m_current_Level == Levels[1]){
			m_current_Level->draw();
			graphics::drawText(2.0f, 5.5f, 0.5f, "Press \"S\" to continue and \"O\" to pause", score_brush);
		}
		if (m_current_Level != Levels[0] && m_current_Level != Levels[1]){
			m_current_Level->draw();
			if (score > 0.0) {
				graphics::drawText(3, 1, 1, "YOU WIN", score_brush);
				graphics::drawText(3.4f, 3, 0.7f, "Score: " + std::to_string(score), score_brush);
				graphics::drawText(3.4f, 4, 0.7f, "Time: " + finalTime, score_brush);
				graphics::drawText(3.5f, 5.5f, 0.5f, "Press \"E\" to exit", score_brush);
			}
			else {
				graphics::drawText(3, 1, 1, "YOU LOSE", score_brush);
				//graphics::drawText(3.4f, 3, 0.7f, "Score: " + std::to_string(score), score_brush);
				//graphics::drawText(3.4f, 4, 0.7f, "Time: " + finalTime, score_brush);
				//graphics::drawText(3.5f, 5.5f, 0.5f, "Press \"E\" to exit", score_brush);
			}
		}else{
			if (m_current_Level != Levels[1]) {
				m_current_Level->draw();
					graphics::drawText(3.0f, 5.5f, 0.5f, "Press \"H\" to continue", score_brush);
			}
		}
	}
}

void GameState::update(float dt)
{
	// Skip an update if a long delay is detected 
	// to avoid messing up the collision simulation
	if (dt > 500) // ms
		return;
	
	// Avoid too quick updates
	float sleep_time = std::max(17.0f - dt, 0.0f);
	if (sleep_time > 0.0f)
	{
		std::this_thread::sleep_for(std::chrono::duration<float, std::milli>(sleep_time));
	}

	if (!m_current_Level)
		return;

	m_current_Level->update(dt);

	m_debugging = graphics::getKeyState(graphics::SCANCODE_0);
	
	currTime = time(nullptr);

}

std::string GameState::getFullAssetPath(const std::string& asset)
{
	return m_asset_path + asset;
}

std::string GameState::getAssetDir()
{
	return m_asset_path;
}

GameState* GameState::m_unique_instance = nullptr;