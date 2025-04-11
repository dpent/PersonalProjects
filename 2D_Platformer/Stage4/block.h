#pragma once
#include <string>


class Block
{
public:
    int frameNumber;
    float m_pos_x;
    float m_pos_y;
    float m_width=1.0f;
    float m_height=1.0f;

    virtual const std::string getFrame() {
        return "";
    }

    virtual int blockType() {
        return 1;
    }

    /** Detects intersection (overlap) between this Box and another Box instance.
*   \param other is a reference to another Box instance to check for collision with
*   \return true if the two boxes overlap
*/
    bool intersect(Block& other)
    {
        return (fabs(m_pos_x - other.m_pos_x) * 2.0f < (m_width + other.m_width)) &&
            (fabs(m_pos_y - other.m_pos_y) * 2.0f < (m_height + other.m_height));
    }

    /** Detects an intersection when this Box is "above" (smaller y values) a target box (other)
    *   and reports the adjustment offset so that the two boxes are separated.
    *
    *   \param other is the second (target) Box to test collision on the vertical axis with.
    *   \return the offset this Box needs to move in the y axis, so that it does not collide
    *   anymore with the target Box (other), or 0.0f if no collision is found.
    */
    float intersectDown(Block& other)
    {
        if (m_pos_x + (m_width / 2) < other.m_pos_x - (other.m_width / 2)) {
            return 0.0f;
        }
        if (other.m_pos_x + (other.m_width / 2) < m_pos_x - (m_width / 2)) {
            return 0.0f;
        }
        if (other.m_pos_y <= m_pos_y + (m_height / 2)) {
            return 0.0f;
        }
        if (m_pos_y + (m_height / 2) <= other.m_pos_y - (other.m_height / 2)) {
            return 0.0f;
        }
        return (float)fabs(other.m_pos_y - (other.m_height / 2) - (m_pos_y + (m_height / 2)));


        /*if (fabs(m_pos_x - other.m_pos_x) * 2.0f >= (m_width + other.m_width) || (m_pos_y > other.m_pos_y))
            return 0.0f;
        return std::min<float>(0.0f, other.m_pos_y - (other.m_height / 2.0f) - m_pos_y - (m_height / 2.0f));*/
    }

    /** Detects a horizontal intersection this Box is beside a target box (other).
    *   and reports the adjustment offset so that the two boxes are separated.
    *
    *   \param other is the second (target) Box to test collision on the horizontal axis with.
    *   \return the offset this Box needs to move in the x axis, so that it does not collide
    *   anymore with the target Box (other), or 0.0f if no collision is found.
    */
    float intersectSideways(Block& other)
    {
        if (fabs(m_pos_y - other.m_pos_y) * 2.0f >= (m_width + other.m_width))
            return 0.0f;
        if (m_pos_x > other.m_pos_x)
            return std::max<float>(0.0f, other.m_pos_x + (other.m_width / 2.0f) - m_pos_x + (m_width / 2.0f));
        else
            return std::min<float>(0.0f, other.m_pos_x - (other.m_width / 2.0f) - m_pos_x - (m_width / 2.0f));
    }

    Block() {}

    Block(float x, float y, float w, float h)
    {
        this->m_pos_x = x;
        this->m_pos_y = y;
        this->m_width = w;
        this->m_height = h;
    }
};