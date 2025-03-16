from ..LifeSystem.fighter.Fighter import Fighter
from .KnowledgeSystem.Knowledge import Knowledge

class Player(Fighter):

    dirs = [
        "north", # 0
        "west", # 1
        "south", # 2
        "east" # 3
    ]

    def __init__(self, name, health, resistance, speed, strength, mana, fov, armor):
        super().__init__(name, health, resistance, speed, strength, mana, fov, armor)
        self.level = 1
        self._pos = [0,0,0] # TODO: check dimensions of full world and either put in middle
                            #  or in some predetermined place.
        self._dir = 0 # north
        self.knowledge = Knowledge([self.name, self.level])
    
    def move(self, dir: str):
        dir = dir.lower()
        if dir == "up":
            self._pos[2] += 1
        elif dir == "down":
            self._pos[2] -= 1
        elif dir == "north":
            self._pos[0] -= 1
            self._dir = 0
        elif dir == "south":
            self._pos[0] += 1
            self._dir = 2
        elif dir == "west":
            self._pos[1] -= 1
            self._dir = 1
        elif dir == "east":
            self._pos[1] += 1
            self._dir = 3
        elif dir == "left":
            self._dir = (self._dir - 1) % 4
            self.move(Player.dirs[self._dir])
        elif dir == "right":
            self._dir = (self._dir + 1) % 4
            self.move(Player.dirs[self._dir])

    