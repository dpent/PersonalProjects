#pragma once
#include "block.h"
#include <string>
#include "gamestate.h"


class powerupBlock : public Block
{
	std::vector<std::string> m_powerups;
	int frameNumber = 0;
    

public:
	powerupBlock() {}

    int code = 0;

	powerupBlock(float x, float y, float w, float h,GameState* m_state)
		:Block(x, y, w, h)
	{
        
            m_powerups.push_back(m_state->getFullAssetPath("knife0.png"));
            m_powerups.push_back(m_state->getFullAssetPath("knife1.png"));
            m_powerups.push_back(m_state->getFullAssetPath("knife2.png"));
            m_powerups.push_back(m_state->getFullAssetPath("knife3.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup4.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup5.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup6.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup7.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup8.png"));
            m_powerups.push_back(m_state->getFullAssetPath("powerup9.png"));
        
	}

    virtual const std::string getFrame() override{
        frameNumber++;
        return m_powerups[(frameNumber / 5) % m_powerups.size()];
    }

    virtual int blockType() {
        delete this;
        return 3;
    }
};