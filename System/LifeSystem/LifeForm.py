from .conf import MIN_RESISTANCE, MAX_RESISTANCE, MIN_SKILL, MAX_SKILL

class _Skill:
    def __set_name__(self, owner, name):
        self._name = name

    def __get__(self, instance, owner):
        return instance.__dict__[self._name]
    
    def __set__(self, instance, value: int):
        value = max(value, MIN_SKILL)
        value = min(value, MAX_SKILL)
        instance.__dict__[self._name] = value

class LifeForm:

    speed = _Skill()
    strength = _Skill()

    def __init__(self, name: str, health: int, resistance: float, speed: int, strength: int):
        self._name = name
        self._health = health
        self._max_health = health
        self._resistance = resistance
        self.speed = speed
        self.strength = strength
        self._dead = False
        self.__verify__()

    def __verify__(self):
        if self._health < 0:
            self._death()
        
        self._resistance = max(self._resistance, MIN_RESISTANCE)
        self._resistance = min(self._resistance, MAX_RESISTANCE)
    
    def _death(self):
        self._health = 0
        self._max_health = 0
        self._resistance = 0
        self.speed = 0
        self.strength = 0
        self._dead = True

    @property
    def name(self):
        return self._name
    
    @name.setter
    def name(self, name: str):
        self._name = name
    
    @property
    def health(self):
        return self._health
    
    @health.setter
    def health(self, newHealth: int):
        if newHealth < 0:
            self._death()
        elif newHealth > self._max_health:
            self.recoverAllHealth()
        else:
            self._health = newHealth
    
    @property
    def max_health(self):
        return self._max_health
    
    @property
    def resistance(self):
        return self._resistance
    
    @property
    def isDead(self):
        return self._dead
    
    def takeDamage(self, damage: int):
        self.health -= damage
    
    def recoverAllHealth(self):
        self.health = self.max_health
    
    def recoverHealth(self, health):
        self.health += health