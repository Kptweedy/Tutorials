#  How to find files you want to export  

To find the files you want to export you first have to find out the path that it is stored in, to get that path we can either browse the files to try and find it ourselves or use some tools other members of the warframe community has made. 
An easier way to search for these paths is with the frontend for [browse.wf](https://browse.wf/), however these results refer to `/Lotus/Upgrades/`, `/Lotus/Types/` and `/Lotus/Powersuits` which are **not model paths**, we will have to extrapolate them.  
To turn these paths into ones that we can use
For warframes we look inside the `/Lotus/Characters/Tenno/` directory for whatever came up after `/Lotus/Powersuits/`, for example searching Sevagoth shows us that the path is `/Lotus/Powersuits/Wraith/Wraith` so we would search in the `/Tenno/` directory for a folder called `Wraith`, there are however quite a lot of exceptions to that, for example searching for Saryn only results in `/Saryn/` paths whereas Saryn is actually located under `Medusa`. 

Searching the last part of the path of the accessory inside the `./../Characters/` directory should get you goind in the right direction.  

For weapons its a similar process, but we search in `/Lotus/Weapons/` etc.  
### Warframes 
As browse.wf doesnt show model paths a table with what folders to look in for warframes has been put together.  

| Internal Name  | Display Name                                           |
| :------------- | :----------------------------------------------------- |
| Acsessory      | Contains Attatchments, Ephemeras and Sayandanas        |
| Alchemist      | Lavos                                                  |
| Anima          | Equinox                                                |
| Antimatter     | Nova                                                   |
| Archer         | Ivara                                                  |
| Assassin       | Stalker (Only Includes Head)                           |
| Bard           | Octavia                                                |
| Berserker      | Valkyr                                                 |
| Brawler        | Atlas                                                  |
| BrokenWarframe | Xaku                                                   |
| Brutalist      | Quorvex                                                |
| Caliban        | Caliban                                                |
| Dagath         | Dagath                                                 |
| Decree         | Banshee                                                |
| Devourer       | Grendel                                                |
| Dragon         | Chroma                                                 |
| Ember          | Ember                                                  |
| Engineer       | Vauban                                                 |
| Excalibur      | Excalibur , Also includes Nyx, Nyx Prime, Nyx alt helm |
| Faerie         | Titania                                                |
| Frost          | Frost                                                  |
| Garuda         | Garuda                                                 |
| Glass          | Gara                                                   |
| Gunslinger     | Mesa                                                   |
| Gyre           | Gyre                                                   |
| Harlequin      | Mirage                                                 |
| Hydroid        | Hydroid                                                |
| Infestation    | Nidus                                                  |
| JetPacks       | Archwings                                              |
| Loki           | Loki                                                   |
| Lotus          | Lotus                                                  |
| Lycath         | Voruna                                                 |
| Mag            | Mag                                                    |
| Magician       | Limbo                                                  |
| Medusa         | Saryn                                                  |
| MonkeyKing     | Wukong                                                 |
| Mummy          | Inaros                                                 |
| Necromancer    | Nekros                                                 |
| Nemesis        | Nyx Nemesis Skin                                       |
| Nezha          | Nezha                                                  |
| Ninja          | Ash                                                    |
| Nyx            | Nyx Deluxe + Tennogen Skins                            |
| Odalisk        | Protea                                                 |
| Operator       | Some operator models and cosmetics                     |
| Outcast        | Friendly Dax, e.g. Varzia, Teshin                      |
| Pacifist       | Baruuk                                                 |
| Paladin        | Oberon                                                 |
| PaxDuviricus   | Kullervo                                               |
| Priest         | Harrow                                                 |
| Prisoner       | Various Rescue Targets                                 |
| ProtoArmor     | Excalibur Proto Skins                                  |
| Quill          | Khora                                                  |
| Rhino          | Rhino                                                  |
| Sapient        | Gauss                                                  |
| Shield         | Hildryn                                                |
| Stalactis      | Citrine                                                |
| Styanax        | Styanax                                                |
| Tengu          | Zephyr                                                 |
| Trinity        | Trinity                                                |
| Volt           | Volt                                                   |
| Wisp           | Wisp                                                   |
| Wraithe        | Sevagoth                                               |
| Yareli         | Yareli                                                 |
