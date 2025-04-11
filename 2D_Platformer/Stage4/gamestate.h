#pragma once

#include <string>
#include <vector>
#include "sgg/graphics.h"
#include <ctime>
#include <iostream>



class gameLevel; //forward declaration

class GameState
{
private:
	static GameState* m_unique_instance;

	const std::string m_asset_path = "assets\\";


	const float m_canvas_width  = 10.0f;
	const float m_canvas_height = 6.0f;
	

	class Player* m_player = 0;
	
	GameState();

public:
	int currNumbLvl = -1;
	bool hasSword = false;
	bool hasKey = false;
	time_t timeAtStart;
	time_t currTime;
	std::string finalTime;
	int score = 0;
	graphics::Brush score_brush;
	graphics::Brush knife_brush;
	graphics::Brush key_brush;
	std::vector<gameLevel*> Levels;
	gameLevel* m_current_Level = nullptr;
	float m_global_offset_x = 0.0f;
	float m_global_offset_y = 0.0f;

	
	bool m_debugging = false;
	float bonusSpeed = 0.0f;



	~GameState();
	static GameState* getInstance();

	bool init();
	void draw();
	void update(float dt);

	std::string getFullAssetPath(const std::string& asset);
	std::string getAssetDir();

	float getCanvasWidth() { return m_canvas_width; }
	float getCanvasHeight() { return m_canvas_height; }

	class Player* getPlayer() { return m_player; }
};
