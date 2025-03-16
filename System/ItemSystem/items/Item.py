from abc import abstractmethod

class Item:

    def __init__(self, name: str, quantity: int):
        self.name = name
        self.quantity = quantity
        if self.quantity < 0:
            self.quantity = 0

    @abstractmethod
    def __eq__(self, value):
        if isinstance(value, Item):
            return self.name == value.name
        elif isinstance(value, str):
            return self.name == value
        else:
            return False
    
    @abstractmethod
    def __ne__(self, value):
        return not self.__eq__(value)

    @abstractmethod
    def __str__(self) -> str:
        pass

    @abstractmethod
    def description(self) -> str:
        pass

    @abstractmethod
    def quantity_to_str(self) -> str:
        if self.quantity == 1:
            return "You only have 1."
        else:
            return f"You have {self.quantity} of them."

    @abstractmethod
    def look(self) -> str: # template for look
        return f"You look at your {self.name}.\n" + self.description() + "\n" + self.quantity_to_str()
    
    @abstractmethod
    def _dup(self, quantity):
        pass

    def combine(self, item):
        if not isinstance(item, self.__class__) or self.name != item.name:
            return
        self.quantity += item.quantity
        item.quantity = 0

