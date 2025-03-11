from .NPC import NPC

class GenericNPC(NPC):

    def __init__(self, name, health, resistance, speed, strength):
        super().__init__(name, health, resistance, speed, strength)