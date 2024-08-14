#  How to find files you want to export  

To find the files you want to export you first have to find out the path that it is stored in, to get that path we can either browse the files to try and find it ourselves or look at a database of internal paths and infer their locations. 
These here are two databases that contain lots of information about warframe: <https://api.empx.cc/warframe/manifest/uniqueName/> <https://raw.wfdata.io/>.  
What we want now are the uniqueName entries as these have the name that is shown in game and then the path to where its stored.  
Now, an easier way to search for these paths is with the frontend for [wfdata.io](https://wfdata.io/), however these results refer to `/Lotus/Upgrades/`, `/Lotus/Types/` and `/Lotus/Powersuits` which will not be the path to the model you are looking for.  
To turn these paths into ones that we can use
For warframes we look inside the `/Lotus/Characters/Tenno/` directory for whatever came up after `/Lotus/Powersuits/`, for example searching sevagoth shows us that the path is `/Lotus/Powersuits/Wraith/Wraith` so we would search in the characters directory for a folder called `Wraith`. 


Searching the last part of the path of the accessory inside the `./../Characters/` directory should get you to the right file.  


### Warframes 

Warframes are found inside the `/Lotus/Characters/Tenno/` directory.  

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
| Dagath                                                 | Dagath         |
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
| Khora                                                  | Quill          |
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
| Rhino                                                  | Rhino          |
| Saryn                                                  | Medusa         |
| Sevagoth                                               | Wraithe        |
| Some operator models and cosmetics                     | Operator       |
| Stalker (Only Includes Head)                           | Assassin       |
| Styanax                                                | Styanax        |
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
