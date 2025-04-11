#pragma once
#include "gameLevel.h"
#include <vector>
#include <list>
#include <string>

class highwaylvl : public gameLevel
{
	float m_center_x = 5.0f;
	float m_center_y = 5.0f;

public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	highwaylvl(const std::string& name = "highwaylvl");
	~highwaylvl() override;

	virtual gameLevel* switchLevel() override;
};