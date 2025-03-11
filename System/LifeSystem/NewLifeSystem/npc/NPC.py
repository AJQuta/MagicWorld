from ..LifeForm import LifeForm

class NPC(LifeForm):

    def __init__(self, name, health, resistance, speed, strength):
        super().__init__(name, health, resistance, speed, strength)