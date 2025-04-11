#pragma once
#include "gameLevel.h"
#include <string>


class level0 : public gameLevel
{
public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	level0(const std::string& name = "Level0");
	~level0() override;

	virtual gameLevel* switchLevel() override;
};