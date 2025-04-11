#pragma once
#include "block.h"
#include <string>
#include "gamestate.h"
#include "powerupBlock.h"


class keyBlock : public Block
{

    std::vector<std::string> m_powerups;
    int frameNumber = 0;

public:
    keyBlock() {}


    keyBlock(float x, float y, float w, float h, GameState* m_state)

    {
        this->m_pos_x = x;
        this->m_pos_y = y;
        this->m_width = w;
        this->m_height = h;

        m_powerups.push_back(m_state->getFullAssetPath("key1.png"));
        m_powerups.push_back(m_state->getFullAssetPath("key2.png"));

    }

    virtual const std::string getFrame() override {
        frameNumber++;
        return m_powerups[(frameNumber / 5) % m_powerups.size()];
    }

    virtual int blockType() {
        delete this;
        return 6;
    }
};
