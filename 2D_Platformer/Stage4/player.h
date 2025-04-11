#pragma once
#include "gameobject.h"
#include <sgg/graphics.h>
#include "box.h"
#include <cassert>


class Player : public Box, public GameObject
{
	// animated player
	std::vector<std::string> m_leftMovement;
	std::vector<std::string> m_rightMovement;
	std::vector<std::string> m_turnMovement;
	std::vector<std::string> m_carMovement;
	std::vector<std::string> m_swordRMovement;
	std::vector<std::string> m_swordLMovement;

	graphics::Brush m_brush_player;

	const float m_accel_horizontal = 20.0f;
	const float m_accel_vertical = 300.1f;
	const float m_max_velocity = 5.0f;

public:
	float m_gravity = 10.0f;
	float m_vx = 0.0f;
	float m_vy = 0.0f;
	float bonusSpeed = 0.0f;

public:
	std::string lastFrame;
	int frameNumber = 0;
	std::string direction = "left";
	//int counterl = 0;
	//int counterr = 0;
	int turnFrame = 0;
	//bool hasTurned = false;

	void update(float dt) override;
	void draw() override;
	void init() override;
	Player(std::string name) : GameObject(name){}
	virtual const std::string getFrame() override{
		if (graphics::getKeyState(graphics::SCANCODE_A)) {
			frameNumber++;
			lastFrame= m_leftMovement[(frameNumber / 5) % m_leftMovement.size()];
			return lastFrame;
		}
		if (graphics::getKeyState(graphics::SCANCODE_D)) {
			frameNumber++;
			lastFrame = m_rightMovement[(frameNumber / 5) % m_rightMovement.size()];
			return lastFrame;
		}
		if (graphics::getKeyState(graphics::SCANCODE_J)) {
			frameNumber++;
			lastFrame = m_carMovement[(frameNumber / 5) % m_carMovement.size()];
			return lastFrame;
		}
		
		graphics::MouseState mouse;
		graphics::getMouseState(mouse);
		if (mouse.button_left_pressed) {
			frameNumber++;
			lastFrame = m_swordRMovement[(frameNumber / 5) % m_swordRMovement.size()];
			return lastFrame;
		}
		return lastFrame;
	}

	/*const std::string getTurnFrame() {
		//if (lastMove.compare("no move")==0) {
			//return "Boing-turn3.png";
		//}
		std::string temp_str;
		if (graphics::getKeyState(graphics::SCANCODE_A)) {
			temp_str= m_turnMovement[(turnFrame / 3) % m_turnMovement.size()];

			if (counterl%3==0) {
				hasTurned=true;
			}
			else {
				hasTurned = false;
				turnFrame++;
			}
			counterl++;
			lastMove = "left";
			lastFrame = temp_str;
			return temp_str;
		}
		if (graphics::getKeyState(graphics::SCANCODE_D)) {
			temp_str = m_turnMovement[(turnFrame / 3) % m_turnMovement.size()];
			if (counterr%3==0) {
				hasTurned = true;
			}
			else {
				hasTurned = false;
				turnFrame--;
			}
			lastFrame = temp_str;
			lastMove = "right";
			counterr++;
			return temp_str;
		}
			return lastFrame;	
	}*/
	
protected:
	void debugDraw();
	
	// dynamic motion control
	void movePlayer(float dt);


};
