from .Item import Item

class Container:

    def __init__(self, name: str, items: list[Item] = []):
        self.name = name
        self._contents = items

    def __eq__(self, value):
        if isinstance(value, Container):
            return self.name == value.name
        elif isinstance(value, str):
            return self.name == value
        else:
            return False
        
    def __ne__(self, value):
        return not self.__eq__(value)
        
    def __find__(self, value) -> Item | None:
        for item in self._contents:
            if item == value:
                return item
        return None

    def __str__(self):
        text = f"{self.name}:"
        for item in self._contents:
            text += "\n\t\t"
            text += str(item)
        if self.size() == 0:
            text += "\n\t\t(empty)"
        return text
    
    def hasItem(self, item: Item | str) -> bool:
        if self.__find__(item):
            return True
        else:
            return False
    
    def addItem(self, item: Item):
        add_item: Item = self.__find__(item.name)
        if add_item:
            add_item.quantity += item.quantity
        else:
            self._contents.append(item)

    def removeItemAmount(self, item: Item | str, quantity: int) -> Item | None:
        rem_item: Item = self.__find__(item)
        if not rem_item:
            return None
        remainder: Item = None
        if rem_item.quantity < quantity:
            remainder = rem_item._dup(rem_item.quantity)
            self._contents.remove(item)
        else:
            remainder = rem_item._dup(quantity)
            rem_item.quantity -= quantity
        return remainder
    
    def removeItem(self, item: str) -> Item | None:
        rem_item = self.__find__(item)
        if not rem_item:
            return None
        self._contents.remove(item)
        return rem_item
    
    def size(self) -> int:
        return len(self._contents)
    
    def look(self):
        text = f"{self.name}:"
        for item in self._contents:
            text += "\n\t"
            text += str(item)
        if self.size() == 0:
            text += "\n\t(empty)"
        return text
    
    def combine(self, value):
        item1 = self.__find__(value)
        if not item1:
            return
        for item in self._contents:
            if item1 != item and item1 == item.name:
                item1.combine(item)
                self._contents.remove(item)