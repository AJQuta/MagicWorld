from ..conf import MIN_MANA, MIN_FOV, MAX_FOV, MIN_ARMOR
from ..LifeForm import LifeForm

class Fighter(LifeForm):

    def __init__(self, 
                 name: str, 
                 health: int, 
                 resistance: float, 
                 speed: int, 
                 strength: int, 
                 mana: int, 
                 fov: float,
                 armor: int
                 ):
        super().__init__(name, health, resistance, speed, strength)
        self._mana = mana
        self._max_mana = mana
        self._field_of_view = fov
        self._armor = armor
        self.__verify__()
    
    def __verify__(self):
        self._mana = max(self._mana, MIN_MANA)
        self._max_mana = self._mana

        self._field_of_view = max(self._field_of_view, MIN_FOV)
        self._field_of_view = min(self._field_of_view, MAX_FOV)

        self._armor = max(self._armor, MIN_ARMOR)
        

    def _death(self):
        super()._death()
    
    def attack(self) -> int:
        from random import random
        if not self.isDead():
            return round( random()*self.speed + random()*self.strength )
        else:
            return 0
    
    @property
    def mana(self):
        return self._mana

    @mana.setter
    def mana(self, newMana: int):
        if newMana > self._max_mana:
            self.recoverAllMana()
        elif newMana < MIN_MANA:
            self._mana = MIN_MANA
        else:
            self._mana = newMana
    
    @property
    def max_mana(self):
        return self._max_mana
    
    @property
    def FOV(self):
        return self._field_of_view
    
    def recoverAllMana(self):
        self._mana = self._max_mana
    
    def recoverMana(self, mana: int):
        self.mana += mana