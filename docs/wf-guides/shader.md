# Must Know Info
### Textures/Materials
#### Introduction
Warframe has 3 different texture “Generations” you may encounter. Gen1 was used when the game first released, Gen2 was a transition to PBR rendering, and Gen3 is the latest version that new releases are using. You may encounter all of these depending on what you extract. Keep in mind that there exists several variations of Gen3 used for static meshes which this guide will not cover.

**If you’re not familiar with these concepts, you may have trouble setting up textures:** 

- Image channels (Red, Green, Blue, Alpha)
- Normal maps
- Tint maps, AKA ID maps
- sRGB/Linear color space
- Image editors (Photoshop/GIMP/Paint.net)

### Needed files for blender setup
Head to the [Mega](https://mega.nz/folder/fIUQDQYZ#vRNqurxNdzELIboK214Kxg/folder/WFcSSZ4b) and download a shader type in /Warframe Model Archive/Useful Resources/Blender Resources/Pruu Shaders or Valkyrie Shaders/  
Most guides on this site will be using the Pruu shader

## pruu guide
### G1
Comes with split Diffuse/Specular/Roughness Map (Roughness Map may not be present - check Materil file for Shine and Gloss atrributes to input. 
Use 'G2 Split Shader' to Setup 'G1'.
Switch 'Separate...' to 1 to use them and plug corresponding textures. 
When no roughness map present use 'No Roughness Map' and control roughness directly from 'Spec/Met/Rough Map' (its blue channel values) 
'Pack Map Variant' in 99% of scenarios will be 0
Plug 'Additional Metalness' manually (Usually Map Range from Specular map with values above 0.5 or 4th tint channel)

### G2
Comes with PackMap and Tints stored in Alpha channel of PackMap
3 PBR Types: Red channel is Specular, ('Pack Map Variant' set to 0)
Red channel is Metalness, ('Pack Map Variant' set to 1)
Red Channel is Specular, Green has patches of black color ('Pack Map Variant' set to 2) (those are metallic and Evolution Engine doesnt care about metallic color, but Blender does)
Which one is current one is determined by User 'MANUALLY'. 
If 'Pack Map Variant' set to 0 or 2 User must manually input 'Additional Metalness' be it from red channel of Pack Map, tints, or other source (Automatic setup is faulty and was removed)

### G3
Comes in 2 types:
Blue channel of PackMap is AO or Diffuse. Switch with 'Blue Channel is AO Map'
Refer to individual Material file
Majority of data for 'G3' comes from microdetails.
Uniquiness for each model (Wear, Grunge, etc...) comes from Grunge options. There are 2 main ones: Grunge Red and Grunge Green under 'Grunge' tab
'Grunge Channel Strength' control Amount and Colors. 
'Grunge Str Spec/Met/Rough' control Amount and Values for specular/metallic/roughness that grunge layer affects. RED - specular, Green - Metallic, Blue - Roughness
'Grunge Alpha Channel Roughness' controls Alpha map affecting roughness (If model have no alpha channel(Its White or brokenly pixelated) -> Set to 0) 


### Additional Switches and what they do

(G2)'Mask Type'
Switch between 1 and 2. 1 when tints stored in its own texture. 2 when tints stored in PackMap Alpha channel
(G3)'RGBA<>RGB Tint Map'
If Tint map doesnt have Alpha channel in it switch to 1. 
In material file mentioned as(All further repetitions will be shortened to just 'Mentioned as') TINT_MASK_RGBA or TINT_MASK_RGB
'Fix Broken Normal Orientation'
Set to 1 if used automatic convert which sometimes flips Red and Green channel and while set to 0 creates seams(easy to find if look at the middle of model under glancing angle and zoomed in)
'Create Blue Channel'
Recreates Blue channel for Normal Map which adds Depth. Usually no reason to set to 0
'Strength'
Normal Map Str. Best to leave at 1 but can be changed for personal preference
'Channel as Emission Mask'
0-No emission, 1-Emission in Red channel, 2-Emission in Green Channel
'Channel as Emission Effect'
Same as above
'Emission Strength'
Controls how bright emission is
'Emissive Map Power'
Value above 1 decreases emission map influence, below 1 increases. Personal preference
(G3)'Use Material Tint Map'
Sometimes G3 model come with separate Tint texture for Microdetails. Switching this to 1 enables inputs for it
'RGBA<>RGB Material Tint Map'
Same as 'RGBA<>RGB Tint Map' but for Material Tint. Mentioned as MATERIAL_MASK_RGB or MATERIAL_MASK_RGBA
(G2)'Specular Value'
Manual Values for Specular. when PBR type is 1. Default value of 0.5
(G3)'Initial Sp/Dif/Rough'
Manual Values for Specular/Diffuse/Roughness. Lime green is safe spot.
'Vertex Ambient Occlusion'
Input to read V.AO stored inside mesh data. Unplugging disables V.AO Entirely
(G3)'Grunge'
Check 'G3' Tab above
'Vertex Ambient Occlusion'
Majority of models has AO stored as attribute inside model itself. Not plugging anything disabled influence entirely
'Microdetail'
For 'G2' mentioned as DETAIL_MAP_ATLAS. For 'G3' always(ALWAYS) present
'G2' will use only Normal and MIGHT use diffuse/Roughness. Value of 1 will not correlate to same value in Material file
'G3' Will use All values. Note: If Diffuse is black but part is also metallic, it turns Diffuse white too. Values on 1 1 1 1 for Specular/Diffuse/Metallic/Roughness is intended most of the time
'Colors'
Self-Explanatory

Final Tweak Switches

'Roughness Tweak'
Changes How final roughness is calculated. For personal preference
'AO Influence'
Changes how much AO affects the final look. Uses AO from Mesh data only
'Diffuse Tweak'
By default Combining 'G2' and 'G3' models makes 'G3' more brighter than 'G2'. This is Tweak to offset that. Increase for 'G2' or decrease for 'G3' to keep them with similar colors

Setups in Pink Frame for 'G3' models utilise Atlas Detail textures. If you dont want to use them and want to set them manually one by one - remove it


'Last words'

Actual tints are in sRGB(in shader they are in non-color) but setting to sRGB makes baking them correctly impossible. 
(Yes, Alpha channel which is non-color by default everywhere in the world is srgb for Evolution engine too)

Add Non-Color/sRGB node between tint texture and shader input if model has gradient tints (Garuda/Rhino Deluxe/Etc...)

'''More to be Added'''