#pragma once
#include "block.h"

class Box: public Block
{
public:
    std::string texture;

    /** Default ctor
    */
    Box() {}

    /** Basic Box ctor.
    *   \param x is the x coordinate of the box center
    *   \param y is the y coordinate of the box center
    *   \param w is the width of the box
    *   \param h is the height of the box
    */
    Box(float x, float y, float w, float h, std::string texture)
        : Block(x, y, w, h) 
    {
        this->texture = texture;
       
    }


};

