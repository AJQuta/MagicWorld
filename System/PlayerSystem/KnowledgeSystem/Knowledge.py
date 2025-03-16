class Knowledge:

    elements = { # * knowledge of elements between runs
        "Fire" : 0,
        "Water" : 0,
        "Rock" : 0,
        "Wind" : 0,
        "Light" : 0,
        "Dark" : 0,
        "Null" : 0,
        "Ki" : 0
    }

    readings = { # * knowledge of readings between runs
        "Book of Fire" : 0,
        "Book of Water" : 0,
        "Book of Rock" : 0,
        "Book of Wind" : 0,
        "Novel of Light" : 0,
        "An Inquiry into the Darkest Parts of Magic" : 0,
        "Void" : 0,
        "A Dying Wish or a New Form of Magic?" : 0,
        "The Magic Circle" : 0,
        "The Three Conflicts" : 0,
        "The Spirits and the Origin of Magic" : 0,
        "The Incantations of Old" : 0,
        "The Scholar" : 0 # To Be Added to...
    }
    # TODO: Add Special Characters!

    def __init__(self, player_info: list):
        self._player_name: str = player_info[0]
        self._player_level: int = player_info[1]
        # ? Do we want to randomize beginning mastery of elements ?
        self.elements = { # * mastery of elements
            "Fire" : -1,
            "Water" : -1,
            "Rock" : -1,
            "Wind" : -1,
            "Light" : -1,
            "Dark" : -1,
            "Null" : -1,
            "Ki" : -1
        }

    @classmethod
    def increaseElementKnowledge(cls, element: str):
        cls.elements[element] += 1 # * Increasing knowledge of element between runs
    
    @classmethod
    def increaseReadingKnowledge(cls, reading: str):
        cls.readings[reading] += 1 # * Increasing knowledge of reading between runs

    @classmethod
    def elementKnown(cls, element: str) -> str:
        if element not in cls.elements or cls.elements[element] == 0:
            return False
        return True

    def increaseElementMastery(self, element: str):
        self.elements[element] += 1 # TODO make sure mastery hasn't exceeded maximum when max is decided

    def getElementMastery(self, element: str) -> str:
        if not self.elementKnown(element):
            return f"You don't know about the {element} element."
        if self.elements[element] < 0:
            return f"You don't know how to cast {element} spells."
        if self.elements[element] == 0:
            return f"You can cast generic {element} spells."
        text = f"You know how to cast up to {self.elements[element]}"
        if self.elements[element] == 11:
            text += "th "
        elif self.elements[element] == 12:
            text += "th "
        elif self.elements[element] % 10 == 1:
            text += "st "
        elif self.elements[element] % 10 == 2:
            text += "nd "
        else:
            text += "th "
        text += "level spells."
        return text