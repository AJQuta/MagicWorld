# LifeSystem Structure

## Base Structure

1. LifeForm
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
        * Has an Inventory
        1. QuestNPCs
            * Has Money (and maybe some items)
        2. GenericNPCs
            * Has Money (and maybe some items)
        3. ExchangeNPCs
            * Has Money and Items