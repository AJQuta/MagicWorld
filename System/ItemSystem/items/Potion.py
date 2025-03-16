from abc import abstractmethod
from .Item import Item

class Potion(Item):

    def __init__(self, name, quantity, effect: str):
        super().__init__(name, quantity)
        self.effect = effect

    @abstractmethod
    def __str__(self):
        pass
    
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
