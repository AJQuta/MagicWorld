from abc import abstractmethod
from .Item import Item

class Potion(Item):

    def __init__(self, name, quantity, effect: str, strength: int):
        super().__init__(name, quantity)
        self.effect = effect
        self.strength = strength

    @abstractmethod
    def __str__(self):
        pass

    @abstractmethod
    def __eq__(self, value) -> bool:
        if isinstance(value, str):
            if "+" not in value:
                return super().__eq__(value)
            else:
                try:
                    return super().__eq__(value.split("+")[0]) and int(value.split("+")[1]) == self.strength
                except ValueError:
                    return False
        return super().__eq__(value) and self.strength == value.strength
    
    @abstractmethod
    def description(self):
        return f"{self.name} is a {self.effect} potion that increases your "
    
    @abstractmethod
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    @abstractmethod
    def look(self):
        return super().look()
    
    @abstractmethod
    def _dup(self, quantity):
        pass

class HealthPotion(Potion):

    POTION_NAME = "Loyal"
    POTION_EFFECT = "health"


    def __init__(self, quantity, strength):
        super().__init__(HealthPotion.POTION_NAME, quantity, HealthPotion.POTION_EFFECT, strength)

    def __str__(self):
        return f"{self.name} +{self.strength} x{self.quantity}"
    
    def __eq__(self, value):
        return super().__eq__(value)
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def description(self):
        return super().description() + f"health.\nThis increases it by +{self.strength}."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def look(self):
        return super().look()


class ManaPotion(Potion):

    POTION_NAME = "Soul"
    POTION_EFFECT = "mana"

    def __init__(self, quantity, strength):
        super().__init__(ManaPotion.POTION_NAME, quantity, ManaPotion.POTION_EFFECT, strength)

    def __str__(self):
        return f"{self.name} +{self.strength} x{self.quantity}"
    
    def __eq__(self, value):
        return super().__eq__(value)
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def description(self):
        return super().description() + f"mana.\nThis increases it by +{self.strength}."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def look(self):
        return super().look()


class StrengthPotion(Potion):

    POTION_NAME = "Feral"
    POTION_EFFECT = "strength"

    def __init__(self, quantity, strength):
        super().__init__(StrengthPotion.POTION_NAME, quantity, StrengthPotion.POTION_EFFECT, strength)

    def __str__(self):
        return f"{self.name} +{self.strength} x{self.quantity}"
    
    def __eq__(self, value):
        return super().__eq__(value)
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def description(self):
        return super().description() + f"mana.\nThis increases it by +{self.strength}."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def look(self):
        return super().look()


class SpeedPotion(Potion):

    POTION_NAME = "Wisp"
    POTION_EFFECT = "speed"

    def __init__(self, quantity, strength):
        super().__init__(SpeedPotion.POTION_NAME, quantity, SpeedPotion.POTION_EFFECT, strength)

    def __str__(self):
        return f"{self.name} +{self.strength} x{self.quantity}"
    
    def __eq__(self, value):
        return super().__eq__(value)
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def description(self):
        return super().description() + f"mana.\nThis increases it by +{self.strength}."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def look(self):
        return super().look()


class SightPotion(Potion):

    POTION_NAME = "See"
    POTION_EFFECT = "mana"

    def __init__(self, quantity, strength):
        super().__init__(SightPotion.POTION_NAME, quantity, SightPotion.POTION_EFFECT, strength)

    def __str__(self):
        return f"{self.name} +{self.strength} x{self.quantity}"
    
    def __eq__(self, value):
        return super().__eq__(value)
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def description(self):
        return super().description() + f"mana.\nThis increases it by +{self.strength}."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def look(self):
        return super().look()

    