#pragma once
#include "block.h"
#include <vector>
#include <string>
#include "gamestate.h"


class enemyHorizontalBlock : public Block
{
public:
	std::vector<std::string> m_enemies;
	int frameNumber = 0;
    float moveSpeed = 0.01f;

	/** Default ctor
   */
	enemyHorizontalBlock() {}

	/** Basic Box ctor.
   *   \param x is the x coordinate of the box center
   *   \param y is the y coordinate of the box center
   *   \param w is the width of the box
   *   \param h is the height of the box
   */
    
    enemyHorizontalBlock(float x, float y, float w, float h, GameState* m_state)
        : Block(x, y, w, h)
    {
        m_enemies.push_back(m_state->getFullAssetPath("ricta1.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta2.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta1.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta1.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta2.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta1.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta2.png"));
        m_enemies.push_back(m_state->getFullAssetPath("ricta1.png"));
    }

    virtual int blockType() override {
        return 7;
    }

    virtual const std::string getFrame() override {
        frameNumber++;
        return m_enemies[(frameNumber / 8) % m_enemies.size()];
    }

    void MoveEnemy()
    {
        m_pos_x += moveSpeed;
    }
};
