#pragma once
#include "block.h"
#include <vector>
#include <string>
#include "gamestate.h"



class finishBlock :public Block
{
public:
    std::vector<std::string> m_portals;
    int frameNumber = 0;

public:
    /** Default ctor
    */
    finishBlock() {}

    /** Basic Box ctor.
    *   \param x is the x coordinate of the box center
    *   \param y is the y coordinate of the box center
    *   \param w is the width of the box
    *   \param h is the height of the box
    */
    finishBlock(float x, float y, float w, float h, GameState* m_state)
        : Block(x, y, w, h)
    {
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("transparent.png"));
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("transparent.png"));
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("transparent.png"));
        m_portals.push_back(m_state->getFullAssetPath("next.png"));
        m_portals.push_back(m_state->getFullAssetPath("transparent.png"));
    }

    virtual const std::string getFrame() override {
        frameNumber++;
        return m_portals[(frameNumber/5)%m_portals.size()];
    }

    virtual int blockType() override {
        return 2;
    }

};
