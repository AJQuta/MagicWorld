from .items.Item import Item
from .items.Container import Container

class Inventory:

    def __init__(self, inventory: list[Item | Container] = []):
        self._inventory = inventory
    
    def __str__(self):
        text = "Inventory:"
        for item in self._inventory:
            text += "\n\t"
            text += str(item)
        return text
    
    def __find__(self, value) -> Item | Container | None:
        for item in self._inventory:
            if item == value:
                return item
        return None
    
    @property
    def size(self) -> int:
        return len(self._inventory)
    
    def hasItem(self, item: Item | Container | str) -> bool:
        if self.__find__(item):
            return True
        else:
            return False
    
    def addItem(self, item: Item | Container):
        add_item: Item = self.__find__(item.name)
        if isinstance(item, Item) and add_item:
            add_item.combine(item)
        else:
            self._inventory.append(item)

    def addItemtoContainer(self, item: Item, container: str):
        my_container = self.__find__(container)
        if not my_container or not isinstance(my_container, Container):
            return
        my_container.addItem(item)

    def removeItemAmount(self, item: Item | Container | str, quantity: int):
        rem_item: Item = self.__find__(item)
        if not rem_item:
            return
        remainder: Item = None
        if rem_item.quantity < quantity:
            remainder = rem_item._dup(rem_item.quantity)
            rem_item.quantity = 0
        else:
            remainder = rem_item._dup(quantity)
            rem_item.quantity -= quantity
        return remainder

    def removeItem(self, item: Item | Container | str):
        rem_item: Item = self.__find__(item)
        if not rem_item:
            return
        if isinstance(rem_item, Container):
            self._inventory.remove(item)
        else:
            self._inventory.remove(item)
        return rem_item
    
    def combine(self, value: str):
        for item in self._inventory:
                if isinstance(item, Container):
                    item.combine(value)
        item1 = self.__find__(value)
        if not item1:
            return
        i = 0
        while i < self.size:
            item = self._inventory[i]
            if item == value and item1 != item:
                item1.combine(item)
                self._inventory.remove(item)
                i -= 1
            if isinstance(item, Container):
                find_item = item.__find__(value)
                if find_item and item1 != find_item:
                    item1.combine(find_item)
                    item.removeItem(value)
            i += 1