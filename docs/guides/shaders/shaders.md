# Must Know Info
### Textures/Materials
The first half of this video by Valkyrie explains how the warframe shaders work, and all sorts of useful information
<iframe width="758" height="458" src="https://www.youtube.com/embed/XgdNyk1w-yQ?si=Y2PGQ6Y-am0QDmqd" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

#### Introduction
Warframe has 3 different texture “Generations” you may encounter. Gen1 was used when the game first released, Gen2 was a transition to PBR rendering, and Gen3 is the latest version that new releases are using. You may encounter all of these depending on what you extract. Keep in mind that there exists several variations of Gen3 used for static meshes which this guide will not cover.

Determining the generation of a shader 
open material file - scroll down to 

```
####################
#   Shader Set 1   #
####################
```

If the material file says:  
```
2: /EE/Shaders/Deferred/CharacterFillDeferred.hlsl
```  
the material uses CharacterFillDeferred which is the G3 shader.  

If the material file says:   
```
2: /EE/Shaders/Deferred/PBRFillDeferred.hlsl
```  
the material uses PBRFillDeferred which is the G2 shader.  

G1 shaders have been almost entirely phased out and aren't used for warframes
these will have shaders by the name of MetalFillDeferred