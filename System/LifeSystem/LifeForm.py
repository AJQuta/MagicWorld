from .conf import MIN_RESISTANCE, MAX_RESISTANCE, MIN_SKILL, MAX_SKILL

class LifeForm:

    def __init__(self, name: str, health: int, resistance: float, speed: int, strength: int):
        self._name = name
        self._health = health
        self._max_health = health
        self._resistance = resistance
        self._speed = speed
        self._strength = strength
        self._dead = False
        self.__verify__()

    def __verify__(self):
        if self._health < 0:
            self._death()
        
        self._resistance = max(self._resistance, MIN_RESISTANCE)
        self._resistance = min(self._resistance, MAX_RESISTANCE)
        
        self._speed = max(self._speed, MIN_SKILL)
        self._speed = min(self._speed, MAX_SKILL)

        self._strength = max(self._strength, MIN_SKILL)
        self._strength = min(self._strength, MAX_SKILL)
    
    def _death(self):
        self._health = 0
        self._max_health = 0
        self._resistance = 0
        self._speed = 0
        self._strength = 0
        self._dead = True

    @property
    def name(self):
        return self._name
    
    @property
    def health(self):
        return self._health
    
    @health.setter
    def health(self, newHealth: int):
        if newHealth < 0:
            self._death()
        elif newHealth > self.max_health:
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
    def speed(self):
        return self._speed
    
    @property
    def strength(self):
        return self._strength
    
    @property
    def isDead(self):
        return self._dead
    
    def takeDamage(self, damage: int):
        self.health -= damage
    
    def recoverAllHealth(self):
        self.health = self.max_health
    
    def recoverHealth(self, health):
        self.health += health