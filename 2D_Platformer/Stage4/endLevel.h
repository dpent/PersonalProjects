#pragma once
#include "gameLevel.h"
#include <string>


class endLevel : public gameLevel
{
public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	endLevel(const std::string& name = "endLevel");
	~endLevel() override;

	virtual gameLevel* switchLevel() override;
};