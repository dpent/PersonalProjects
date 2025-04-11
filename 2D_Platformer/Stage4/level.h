#pragma once

#include "gameLevel.h"
#include <string>


class Level : public gameLevel
{
	float bonusSpeed = 0.0f;
	float m_center_x = 5.0f;
	float m_center_y = 5.0f;

public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	Level(const std::string & name = "Level0");
	~Level() override;


	virtual gameLevel* switchLevel() override;
};