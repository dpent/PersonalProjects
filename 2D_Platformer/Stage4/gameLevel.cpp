#include "gameLevel.h"
#include <string>
#include "block.h"
#include "sgg/graphics.h"
#include "gamestate.h"
#include "player.h"

int gameLevel::calculatePowerupTimeLeft()
{
	time_t currTime = time(nullptr);
	if (currTime <= powerupEndTime) {
		return powerupEndTime - currTime;
	}
	else {
		m_state->getPlayer()->m_gravity = 10.0f;
		return -1;
	}
}

int gameLevel::calculateTextTimeLeft()
{
	time_t currTime = time(nullptr);
	if (currTime <= knifeTextTime) {
		return knifeTextTime - currTime;
	}
	else {
		return -1;
	}
	
}


void gameLevel::drawBox(int i)
{
	Box& box = m_boxes[i];
	std::string& texture = box.texture;

	float x = box.m_pos_x + m_state->m_global_offset_x;
	float y = box.m_pos_y + m_state->m_global_offset_y;

	m_block_brush.texture = m_state->getFullAssetPath(texture);

	graphics::drawRect(x, y, 1.8f * m_block_size, 1.8f * m_block_size, m_block_brush);

	if (m_state->m_debugging)
		graphics::drawRect(x, y, m_block_size, m_block_size, m_block_brush_debug);

}

void gameLevel::drawBlock(int  i) {

	Block* block = m_blocks[i];
	float x = block->m_pos_x + m_state->m_global_offset_x;
	float y = block->m_pos_y + m_state->m_global_offset_y;

	m_block_brush.texture = block->getFrame();

	graphics::drawRect(x, y, 1.3f * m_block_size, 1.3f * m_block_size, m_block_brush);

	if (m_state->m_debugging)
		graphics::drawRect(x, y, m_block_size, m_block_size, m_block_brush_debug);
}

/*void gameLevel::drawEnemy(int  i) {

	enemyHorizontalBlock& enemy = m_enemies[i];

	m_block_brush.texture = enemy.getFrame();

	float x = enemy.m_pos_x + m_state->m_global_offset_x;
	float y = enemy.m_pos_y + m_state->m_global_offset_y;

	graphics::drawRect(x, y, 1.3f * m_block_size, 1.3f * m_block_size, m_block_brush);

	if (m_state->m_debugging)
		graphics::drawRect(x, y, m_block_size, m_block_size, m_block_brush_debug);
}*/

void gameLevel::checkCollisions()
{
	bool intersection = false;
	int counter = 0;
	//gia boxes
	for (auto& box : m_boxes)
	{
		float offset = 0.0f;
		if (offset = m_state->getPlayer()->intersectDown(box))
		{


			m_state->getPlayer()->m_gravity = 0.0f;

			// add sound event
			if (m_state->getPlayer()->m_vy > 1.0f)
				graphics::playSound(m_state->getFullAssetPath("walking.mp3"), 1.0f);

			m_state->getPlayer()->m_vy = -m_state->getPlayer()->m_vy / 3;

			if (fabs(m_state->getPlayer()->m_vy) < 1.0f) {
				m_state->getPlayer()->m_vy = 0.0f;
				m_state->getPlayer()->m_pos_y -= offset / 10;
			}
			bool intersection = true;
			break;
		}
		else {
			if (m_state->getPlayer()->m_gravity == 0.0f && powerupGrav == false) {
				m_state->getPlayer()->m_gravity = 10.0f;
			}
			else if (powerupGrav == true) {
				m_state->getPlayer()->m_gravity = 5.0f;
			}
		}
	}

	for (auto& box : m_boxes)
	{
		if (intersection == false) {
			float offset = 0.0f;
			if (offset = m_state->getPlayer()->intersectSideways(box))
			{
				m_state->getPlayer()->m_pos_x += offset;
				m_state->getPlayer()->m_vx = -m_state->getPlayer()->m_vx;


				break;
			}
		}
		else {
			break;
		}

	}
	//gia blocks
	intersection = false;

	for (auto block : m_blocks)
	{
		float offset = 0.0f;
		if (offset = m_state->getPlayer()->intersectDown(*block))
		{


			m_state->getPlayer()->m_vy = 0.0f;
			int type = block->blockType();
			if (type == 3) {
				m_blocks.erase(m_blocks.begin() + counter);
				powerupEndTime = time(nullptr) + 5;
				m_state->getPlayer()->m_gravity = 5.0f;
				powerupGrav = true;
			}
			if (type == 4) {
				if (m_state->hasSword) {
					m_blocks.erase(m_blocks.begin() + counter);
					m_state->score += 200;
				}
			
				m_state->score -= 100;
				m_state->getPlayer()->m_pos_x = starting_pos_x;
				m_state->getPlayer()->m_pos_y = starting_pos_y;
			}
			if (type == 5) {
				m_blocks.erase(m_blocks.begin() + counter);
				m_state->hasSword = true;
				knifeTextTime = time(nullptr) + 2;
				graphics::playSound(m_state->getFullAssetPath("machete.wav"), 1.0f);
			}
			if (type == 6) {
				m_blocks.erase(m_blocks.begin() + counter);
				m_state->hasKey = true;
				
			}
			if (m_state->getPlayer()->m_vx > 1.0f)
				graphics::playSound(m_state->getFullAssetPath("walking.mp3"), 1.0f);
			counter = 0;

			intersection = true;
			break;
		}
		counter++;
	}

	counter = 0;

	for (auto block : m_blocks)
	{
		if (intersection == false) {
			float offset = 0.0f;
			if (offset = m_state->getPlayer()->intersectSideways(*block))
			{


				int type = block->blockType();
				if (type == 3) {
					m_blocks.erase(m_blocks.begin() + counter);
					powerupEndTime = time(nullptr) + 5;
					m_state->getPlayer()->m_gravity = 5.0f;
					powerupGrav = true;
				}
				if (type == 4) {
					if (m_state->hasSword) {
						m_blocks.erase(m_blocks.begin() + counter);
						m_state->score += 200;
					}
					else {
						m_state->score -= 100;
						m_state->getPlayer()->m_pos_x = starting_pos_x;
						m_state->getPlayer()->m_pos_y = starting_pos_y;
					}
				}
				if (type == 5) {
					m_blocks.erase(m_blocks.begin() + counter);
					m_state->hasSword = true;
					knifeTextTime = time(nullptr) + 2;
					graphics::playSound(m_state->getFullAssetPath("machete.wav"), 1.0f);
				
				}
				if (type == 6) {
					m_blocks.erase(m_blocks.begin() + counter);
					m_state->hasKey = true;
					/*carTextTime = time(nullptr) + 4;
					graphics::playSound(m_state->getFullAssetPath(".wav"), 1.0f);*/
				}
				if (type == 7) {
					if (m_state->hasSword) {
						m_blocks.erase(m_blocks.begin() + counter);
						m_state->score += 200;
					}
					else {
						m_state->score -= 100;
						m_state->getPlayer()->m_pos_x = starting_pos_x;
						m_state->getPlayer()->m_pos_y = starting_pos_y;
					}
				}


				m_state->getPlayer()->m_pos_x += offset;
				m_state->getPlayer()->m_vx = 0.0f;

				if (m_state->getPlayer()->m_vy > 1.0f)
				{
					m_state->getPlayer()->m_vy = 10.0f;
				}
				else {
					m_state->getPlayer()->m_vy = 0.0f;
				}
				counter = 0;
				break;
			}
			counter++;
		}
		else {
			break;
		}
	}
}



bool gameLevel::check_kill() {
	int res = m_state->getPlayer()->direction.compare("right");
	if ((((m_state->getPlayer()->m_pos_x) - (m_state->m_current_Level->m_blocks[1]->m_pos_x)) >= -0.35) && (((m_state->getPlayer()->m_pos_x) - (m_state->m_current_Level->m_blocks[1]->m_pos_x)) < 0.0)) {
		if (res == 0) {
			return true;
		}
	}
	else if (fabs((m_state->getPlayer()->m_pos_x) - (m_state->m_current_Level->m_blocks[1]->m_pos_x)) <= 0.35) {
		if (res != 0){
			return false;
	    }
	}

}
