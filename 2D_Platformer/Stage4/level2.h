#pragma once
#include "gameLevel.h"
#include <vector>
#include <list>
#include <string>


class Level2 : public gameLevel
{

	float bonusSpeed = 0.0f;

	float m_center_x = 5.0f;
	float m_center_y = 5.0f;

public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	Level2(const std::string& name = "Level2");
	~Level2() override;

	virtual gameLevel* switchLevel() override;

};