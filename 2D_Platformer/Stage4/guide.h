#pragma once
#include "gameLevel.h"
#include <string>


class guide : public gameLevel
{
public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	guide(const std::string& name = "guide");
	~guide() override;

	virtual gameLevel* switchLevel() override;
};
