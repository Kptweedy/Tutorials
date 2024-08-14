## How to use Pruu's Shaders  

### G1  

**Material Files have shader names as `/EE/Shaders/Deferred/MetalFillDeferred.hlsl`**

Comes with split Diffuse/Specular/Roughness Map (Roughness Map may not be present - check Material file for Shine and Gloss atrributes to input.  
Use 'G2 Split Shader' to Setup 'G1'.  
Switch 'Separate...' to 1 in 'Sh. PBR Map Spliiter' Node group to use them and plug corresponding textures into sockets.  
When no roughness map present use 'Separate Roughness Map' and input values directly. Usually its around 0.4-0.5  
'Specular Map is Metal Map' in 99.99% of scenarios will be 0  
Plug 'Additional Metalness' manually (Usually Map Range from Specular map with values above 0.5 or 4th tint channel).  
Set 'Wetness Amount' to 0 if roughness map is not present.  

### G2  

**Material Files have shader names as `/EE/Shaders/Deferred/PBRFillDeferred.hlsl`**

Comes with PackMap and Tints stored in Alpha channel of PackMap.  
2 PBR Types: Red channel is Specular, ('Specular Map is Metal Map' set to 0).  
Red channel is Metalness, ('Specular Map is Metal Map' set to 1).  
Which one is current one is determined by User 'MANUALLY' by switching 'Specular Map is Metal Map' toggle.  
If 'Specular Map is Metal Map' set to 0 Then User must manually input 'Additional Metalness' be it from red channel, tints, or other source (Automatic setup is faulty and was removed).  

### G3  

**Material Files have shader names as `/EE/Shaders/Deferred/CharacterFillDeferred.hlsl`**

Comes in 2 types:
Blue channel of PackMap is AO or Diffuse. Switch with 'Blue Channel is AO Map'
Refer to individual Material file
Majority of data for 'G3' comes from microdetails.
Uniquiness for each model (Wear, Grunge, etc...) comes from Grunge options. There are 2 main ones: Grunge Red and Grunge Green under 'Grunge' tab
'Grunge Global' control values for whole model
'Blue Color Strength' and 'Blue Color' control blue channel of PackMap. Set to 0 disables it. Default is 1. When blue channel is Diffuse - recommended to change color from black or reduce amount.
'Macro Roughness Amount' control Alpha map affecting roughness (Locate 'MACRO_ROUGHNESS' Command in material file)
'Microdetail Grime Threshold' control values which will add grime from microdetails for individual channels .
'Red Color Amount' control how much of grime texture stored in RED channel to use for colors
'Green Color Amount' control how much of grime texture stored in Green channel to use for colors
'Grime Microdetail Amount' control how much of grime texture stored in Microdetails to use for colors
'Grime Color' sets color to use for grime
'Red S/M/R Amount' control how much of grime texture stored in RED channel to use for specular/metallic/roughness
'Green S/M/R Amount' control how much of grime texture stored in GREEN channel to use for specular/metallic/roughness
'Grime S/M/R Values' control Values for specular/metallic/roughness of this grunge layer. RED - specular, Green - Metallic, Blue - Roughness
ALL Grunge settings beyond 'Grunge Global' tab are unnesesary and only give additional details. Models work without setting them up just fine.

### Additional Switches and what they do:

(G2)'Tint Map Stored in Alpha'
Switch between 0 and 1. 0 when tints stored in its own texture. 1 when tints stored in PackMap Alpha channel
(G3)'RGB Tint Map'
If Tint map doesnt have Alpha channel in it switch to 1.  
In material file mentioned as(All further repetitions will be shortened to just 'Mentioned as') TINT_MASK_RGBA or TINT_MASK_RGB
'Fix Broken Normal Orientation'
Set to 1 if used automatic convert which sometimes flips Red and Green channel and while set to 0 creates seams(easy to find if look at the middle of model under glancing angle and zoomed in)
'Strength'
Normal Map Str. Best to leave at 1 but can be changed for personal preference
'Channel as Emission Mask'
0-No emission, 1-Emission in Red channel, 2-Emission in Green Channel
'Channel as Emission Effect'
Same as above
'Emission Strength'
Controls how bright emission is
(G3)'Use Material Tint Map'
Sometimes G3 model come with separate Tint texture for Microdetails. Switching this to 1 enables inputs for it
'RGB Material Tint Map'
Same as 'RGBA<>RGB Tint Map' but for Material Tint. Mentioned as MATERIAL_MASK_RGB or MATERIAL_MASK_RGBA
'Specular Value'
Manual Values for Specular. when PBR type is 1. Default value is 0.5
'Vertex Ambient Occlusion'
Input to read V.AO stored inside mesh data. Unplugging disables V.AO Entirely
'Wetness Amount'
Converts main Roughness Map from Non-Color to sRGB. Default value is 1
(G3)'Grunge'
Check 'G3' Tab above
'Vertex Ambient Occlusion'
Majority of models has AO stored as attribute inside model itself. Not plugging anything disabled influence entirely
'Microdetail'
For 'G2' mentioned as DETAIL_MAP_ATLAS. For 'G3' always(ALWAYS) present
'G2' will use only Normal and MIGHT use diffuse/Roughness. Value of 1 will be same as in Material file
'G3' Will use All values. Note: If Diffuse is black but part is also metallic, it turns Diffuse white too. Values on 1 1 1 1 for Specular/Diffuse/Metallic/Roughness is intended most of the time
'Colors'
Self-Explanatory

### Final Tweak Switches

'AO Influence'
Changes how much AO affects the final look. Uses AO from Mesh data only
'Diffuse Tweak'
By default Combining 'G2' and 'G3' models makes 'G3' more brighter than 'G2'. This is Tweak to offset that. Increase for 'G2' or decrease for 'G3' to keep them with similar colors

Setups in Pink Frame for 'G3' models utilise Atlas Detail textures. If you dont want to use them and want to set them manually one by one - remove it


### Last words

Actual tints are in sRGB(in shader they are in non-color) but setting to sRGB makes baking them correctly impossible.  
(Yes, Alpha channel which is non-color by default everywhere in the world is sRGB for Evolution engine too)

Be aware that any detail texture with name having 'SpecGloss' in it is not PBR compatible and must be edited to work correctly

G2 Model Can Work with either joined Detail Atlas or its own Detail Atlas for G2 Models. Unplugged version of it is precent in all G2 Shaders. Plug manually and add same G2 Detail map into 4 Empty Image Textures

Specular in material file is used as color but Blender does not accept color for specular (dont mistake Specular tint with Specular). Use mean value. \[0.1,0.1,0.1,1] becomes 0.1 (last value doesnt get calculated)

***More to be Added***