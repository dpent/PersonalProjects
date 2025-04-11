#include "player.h"
#include "util.h"
#include <cmath>
#include "gamestate.h"

void Player::update(float dt)
{
	float delta_time = dt / 1000.0f;
	
	movePlayer(dt);

	// update offset for other game objects
	m_state->m_global_offset_x = m_state->getCanvasWidth() / 2.0f - m_pos_x;
	m_state->m_global_offset_y = m_state->getCanvasHeight() / 2.0f - m_pos_y;

	if (m_brush_player.texture == m_state->getFullAssetPath("flyloR1.png")|| m_brush_player.texture == m_state->getFullAssetPath("flyloR2.png")) {
		direction = "right";
	}
	else if (m_brush_player.texture == m_state->getFullAssetPath("flyloL1.png") || m_brush_player.texture == m_state->getFullAssetPath("flyloL2.png")) {
		direction = "left";
	}

	GameObject::update(dt);

}

void Player::draw()
{    
	graphics::MouseState mouse;
	graphics::getMouseState(mouse);
	if (graphics::getKeyState(graphics::SCANCODE_A)) {
			m_brush_player.texture = getFrame();
			graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);
	}
	else if (graphics::getKeyState(graphics::SCANCODE_D)) {
			m_brush_player.texture = getFrame();
			graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);	
	}
	else if (graphics::getKeyState(graphics::SCANCODE_J) && m_state->hasKey) {
		m_brush_player.texture = getFrame();
		graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);
	}
	
		
	else if (mouse.button_left_pressed && m_state->hasSword) {
		if (direction == "right") {
			m_brush_player.texture = getFrame();
			graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);
		}
		else {

			m_brush_player.texture = getFrame();
			graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);
		}
	}
	else if (m_state->m_debugging) {
		debugDraw();
	}
	else {
		m_brush_player.texture=lastFrame;
		graphics::drawRect(m_state->getCanvasWidth() * 0.5f, m_state->getCanvasHeight() * 0.5f, 1.0f, 1.0f, m_brush_player);
	}
}

void Player::init()
{
	m_pos_x = 5.0f;
	m_pos_y = 5.0f;
	
	m_state->m_global_offset_x = m_state->getCanvasWidth() / 2.0f - m_pos_x;
	m_state->m_global_offset_y = m_state->getCanvasHeight() / 2.0f - m_pos_y;

	m_brush_player.fill_opacity = 1.0f;
	m_brush_player.outline_opacity = 0.0f;

	lastFrame = m_state->getFullAssetPath("flyloR1.png");


	m_leftMovement.push_back(m_state->getFullAssetPath("flyloR1.png"));
	
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL1.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL2.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL1.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL2.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL1.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL2.png"));
	m_leftMovement.push_back(m_state->getFullAssetPath("flyloL1.png"));


	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR1.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR2.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR1.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR2.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR1.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR2.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR1.png"));
	m_rightMovement.push_back(m_state->getFullAssetPath("flyloR2.png"));

    m_carMovement.push_back(m_state->getFullAssetPath("flylocar1.png"));
	m_carMovement.push_back(m_state->getFullAssetPath("flylocar2.png"));

	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR1.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR2.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR1.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR2.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR1.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR2.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR1.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR2.png"));
	m_swordRMovement.push_back(m_state->getFullAssetPath("flyloknifeR1.png"));

	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL1.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL2.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL1.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL2.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL1.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL2.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL1.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL2.png"));
	m_swordLMovement.push_back(m_state->getFullAssetPath("flyloknifeL1.png"));




	// Adjust width for finer collision detection
	m_width = 0.5f;
}

void Player::debugDraw()
{
	graphics::Brush debug_brush;
	SETCOLOR(debug_brush.fill_color, 1, 0.3f, 0);
	SETCOLOR(debug_brush.outline_color, 1, 0.1f, 0);
	debug_brush.fill_opacity = 0.1f;
	debug_brush.outline_opacity = 1.0f;
	graphics::drawRect(m_state->getCanvasWidth()*0.5f, m_state->getCanvasHeight() * 0.5f, m_width, m_height, debug_brush);
	
	char s[20];
	sprintf_s(s,"(%5.2f, %5.2f)", m_pos_x, m_pos_y);
	SETCOLOR(debug_brush.fill_color, 1, 0, 0);
	debug_brush.fill_opacity = 1.0f;
	graphics::drawText(m_state->getCanvasWidth() * 0.5f - 0.4f, m_state->getCanvasHeight() * 0.5f - 0.6f, 0.15f, s, debug_brush);
}

void Player::movePlayer(float dt)
{
	float delta_time = dt / 1000.0f;

	// Stage 2 code: Acceleration-based velocity
	float move = 0.0f;
	if (graphics::getKeyState(graphics::SCANCODE_A))
		move -= 5.0f;
	if (graphics::getKeyState(graphics::SCANCODE_D))
		move = 5.0f;
	if (graphics::getKeyState(graphics::SCANCODE_J) && (m_state->hasKey))
		move = 5.0f;

	m_vx = std::min<float>(m_max_velocity, m_vx + delta_time * move * m_accel_horizontal);
	m_vx = std::max<float>(-m_max_velocity, m_vx);

	// friction
	m_vx -= 0.2f * m_vx / (0.1f + fabs(m_vx));

	// apply static friction threshold
	if (fabs(m_vx) < 0.01f)
		m_vx = 0.0f;

	// adjust horizontal position
	m_pos_x += m_vx * delta_time;

	// jump only when not in flight:
	if (m_vy == 0.0f)
		m_vy -= (graphics::getKeyState(graphics::SCANCODE_W) ? m_accel_vertical : 0.0f) * 0.02f;// not delta_time!! Burst 

	if (graphics::getKeyState(graphics::SCANCODE_W)) {
		if (m_gravity == 0.0f) {
			m_gravity = 10.0f;
		}		
	}

	// add gravity
	m_vy += delta_time * m_gravity;

	// adjust vertical position
	m_pos_y += m_vy * delta_time;

	
}

