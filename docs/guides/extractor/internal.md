#  How to find files you want to export  

To find the files you want to export you first have to find out the path that it is stored in, to get that path we can either browse the files to try and find it ourselves or use some tools other members of the warframe community has made. 
An easier way to search for these paths is with the frontend for [browse.wf](https://browse.wf/), however these results refer to `/Lotus/Upgrades/`, `/Lotus/Types/` and `/Lotus/Powersuits` which are **not model paths**, we will have to extrapolate them.  
To turn these paths into ones that we can use
For warframes we look inside the `/Lotus/Characters/Tenno/` directory for whatever came up after `/Lotus/Powersuits/`, for example searching Sevagoth shows us that the path is `/Lotus/Powersuits/Wraith/Wraith` so we would search in the `/Tenno/` directory for a folder called `Wraith`, there are however quite a lot of exceptions to that, for example searching for Saryn only results in `/Saryn/` paths whereas Saryn is actually located under `Medusa`. 

Searching the last part of the path of the accessory inside the `./../Characters/` directory should get you goind in the right direction.  

For weapons its a similar process, but we search in `/Lotus/Weapons/` etc.  
### Warframes 
As browse.wf doesnt show model paths a table with what folders to look in for warframes has been put together.  

| Display Name                                           | Internal Name  |
|:------------------------------------------------------ |:-------------- |
| Archwings                                              | JetPacks       |
| Ash                                                    | Ninja          |
| Atlas                                                  | Brawler        |
| Banshee                                                | Decree         |
| Baruuk                                                 | Pacifist       |
| Caliban                                                | Caliban        |
| Chroma                                                 | Dragon         |
| Citrine                                                | Stalactis      |
| Contains Attatchments, Ephemeras and Sayandanas        | Acsessory      |
| Cyte-09                                                | Frumentarius   |
| Dagath                                                 | Dagath         |
| Dante                                                  | Pagemaster     |
| Ember                                                  | Ember          |
| Equinox                                                | Anima          |
| Excalibur , Also includes Nyx, Nyx Prime, Nyx alt helm | Excalibur      |
| Excalibur Proto Skins                                  | ProtoArmor     |
| Friendly Dax, e.g. Varzia, Teshin                      | Outcast        |
| Frost                                                  | Frost          |
| Gara                                                   | Glass          |
| Garuda                                                 | Garuda         |
| Gauss                                                  | Sapient        |
| Grendel                                                | Devourer       |
| Gyre                                                   | Gyre           |
| Harrow                                                 | Priest         |
| Hildryn                                                | Shield         |
| Hydroid                                                | Hydroid        |
| Inaros                                                 | Mummy          |
| Ivara                                                  | Archer         |
| Jade                                                   | Choir          |
| Khora                                                  | Quill          |
| Koumei                                                 | Koumei         |
| Kullervo                                               | PaxDuviricus   |
| Lavos                                                  | Alchemist      |
| Limbo                                                  | Magician       |
| Loki                                                   | Loki           |
| Lotus                                                  | Lotus          |
| Mag                                                    | Mag            |
| Mesa                                                   | Gunslinger     |
| Mirage                                                 | Harlequin      |
| Nekros                                                 | Necromancer    |
| Nezha                                                  | Nezha          |
| Nidus                                                  | Infestation    |
| Nova                                                   | Antimatter     |
| Nyx Deluxe + Tennogen Skins                            | Nyx            |
| Nyx Nemesis Skin                                       | Nemesis        |
| Oberon                                                 | Paladin        |
| Octavia                                                | Bard           |
| Protea                                                 | Odalisk        |
| Quorvex                                                | Brutalist      |
| Revenant                                               | Revenant       |
| Rhino                                                  | Rhino          |
| Saryn                                                  | Medusa         |
| Sevagoth                                               | Wraithe        |
| Some operator models and cosmetics                     | Operator       |
| Stalker (Only Includes Head)                           | Assassin       |
| Styanax                                                | Styanax        |
| Temple                                                 | Temple         |
| Titania                                                | Faerie         |
| Trinity                                                | Trinity        |
| Valkyr                                                 | Berserker      |
| Various Rescue Targets                                 | Prisoner       |
| Vauban                                                 | Engineer       |
| Volt                                                   | Volt           |
| Voruna                                                 | Lycath         |
| Wisp                                                   | Wisp           |
| Wukong                                                 | MonkeyKing     |
| Xaku                                                   | BrokenWarframe |
| Yareli                                                 | Yareli         |
| Zephyr                                                 | Tengu          |

