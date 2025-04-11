#pragma once
#include "gameLevel.h"
#include <string>


class pause : public gameLevel
{
public:
	void update(float dt) override;
	void draw() override;
	void init() override;

	pause(const std::string& name = "pause");
	~pause() override;

	virtual gameLevel* switchLevel() override;
};
#pragma once
