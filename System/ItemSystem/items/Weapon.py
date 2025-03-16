from .Item import Item

class Weapon(Item):

    # * consider adding durability
    def __init__(self, name, quantity, damage): 
        super().__init__(name, quantity)
        self.damage = damage
    
    def __str__(self):
        text = f"{self.name} ({self.damage} dmg) "
        if self.quantity > 1:
            text += f"x{self.quantity}"
        return text
    
    def __eq__(self, value):
        if isinstance(value, str):
            return super().__eq__(value)
        return super().__eq__(value) and self.quantity == value.quantity and self.damage == value.damage
    
    def __ne__(self, value):
        return not self.__eq__(value)

    def description(self):
        return f"{self.name} is a weapon that can deal {self.damage} damage."
    
    def quantity_to_str(self):
        return super().quantity_to_str()
    
    def _dup(self, quantity):
        return Weapon(self.name, quantity, self.damage)
