# StatCompare v3.0 for World of Warcraft 3.3.5a
StatCompare adds a stats panel for gear checks or comparing your gear to another player.

This fork ports StatCompare v2.0 from 1.12.1 to 3.3.5a and expands the equipment scanner for WotLK stats, gems, enchants, runeforges and inspection data.

## What does it show?

* Your (and other players) base stats, **combat stats**, **spell stats**, **resistances** and other relevant values
* WotLK combat ratings such as **hit**, **critical strike**, **haste** and **armor penetration**
* Equipped **gear**, **enchants**, **gems** and **active socket bonuses**
  * Gems are displayed as compact stat effects rather than item names
  * Empty sockets are hidden unless occupied
  * Enchants are resolved in real time where possible, with compact fallback descriptions for named effects
* WotLK profession effects such as Hyperspeed Accelerators with their activated stat value and duration
* Death Knight **runeforging** with compact effect summaries
* Your (and other players) dominant **talent specialisation** and full point distribution, such as ``Survival (0/15/56)``
* Equipped ammo DPS beside ranged weapons

## Screenshots

<img width="549" height="875" alt="image" src="https://github.com/user-attachments/assets/4193217c-02db-4164-98ca-2bf4d234319a" />


## Installation
Unzip to Interface\Addons, rename from ``StatCompare-3.3.5-master`` to ``StatCompare``

## Commands
/statc help           - Lists the available commands <br />
/statc on | off       - Turns the addon on or off <br />
/statc config         - Opens the configuration window <br />
/statc item           - Opens the item collection window <br />
/statc sets           - Opens the item-set window, where available <br />
/statc debug on | off - Shows debug information, including enchant IDs <br />

## Credits
Original authors:
* slashboy @ Dreamland
* lasthime @ 幻物梵天 艾森纳

Later contributors and maintainers include the Linae-Kronos version, shines77, grimfiendish and the contributors credited in the addon files.

WotLK 3.3.5a port and v3.0 changes maintained in this fork.
