# LifeSystem Structure

## Base Structure

- LifeForm
    1. Animal
        * No Inventory
        * Cannot Attack
        * No Knowledge
    2. Fighter
        * Can Attack
        1. Player
            * Has an Inventory
            * Has Knowledge
        2. Enemy
            * Has a Weapon
            * No Knowledge
            1. Boss
            2. MiniBoss [very low priority]
    3. NPCs
        1. QuestNPCs
        2. GenericNPCs
        3. ExchangeNPCs