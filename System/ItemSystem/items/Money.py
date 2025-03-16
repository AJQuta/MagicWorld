from .Item import Item

class Money(Item): 

    global CURRENCY, CURRENCY_SHORT
    CURRENCY = "Loyan"
    CURRENCY_SHORT = "lan"

    def __init__(self, quantity):
        super().__init__(CURRENCY, quantity)

    def __str__(self) -> str:
        return f"{self.quantity} {CURRENCY_SHORT}"
    
    def __eq__(self, value):
        if isinstance(value, str):
            return super().__eq__(value)
        return super().__eq__(value) and self.quantity == value.quantity
    
    def __ne__(self, value):
        return not self.__eq__(value)
    
    def _dup(self, quantity):
        return Money(quantity)

    def description(self) -> str:
        return f"{self.name} is currency that can be exchanged for items."
    
    def quantity_to_str(self):
        return f"You have {self.quantity} {CURRENCY_SHORT}."
    
    def look(self) -> str:
        return super().look()
    
    def combine(self, item):
        if not isinstance(item, self.__class__) or self.name != item.name:
            return
        self.quantity += item.quantity
        item.quantity = 0