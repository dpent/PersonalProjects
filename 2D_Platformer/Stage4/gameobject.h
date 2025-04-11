#pragma once
#include <string>

class GameState;

class GameObject 
{
	static int m_next_id;
	
protected:
	GameState* m_state;
	std::string m_name;
	int m_id = 0;
	bool m_active = true;

public:
	GameObject(const std::string& name = "");
	virtual void update(float dt) {}
	virtual void init() {}
	virtual void draw() {}
	virtual ~GameObject() {}
	bool isActive() { return m_active; }
	void setActive(bool a) { m_active = a; }
};
