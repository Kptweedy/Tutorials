# Setting up models
To get started you will want to have a model, its textures and its material extracted in a directory you know.  
For information on extracting read through the [extractor](../extractor/extractor.md) page.  
## Process  
This process was done on the 4.0.2 build of blender, however it is recommended to always use the latest build.  
This example will use Gauss Prime
### Importing  
#### Step 1.  Import
##### 1.1 glTF
Import .glb  
![Import 1](../../assets/images/import-1.png)  

##### 1.2  Import Settings  
Find the files you extracted and import with these settings.

- Make sure that Guess Original Bind Pose is not checked.  
- Make sure that Bone Dir is set to Temperance (average).  

![Importing The Main Model](../../assets/images/import-3.png)  

Your blender should contain the model that you imported as well as the skeleton of that model.  

- If you delete the skeleton temporarily and the mesh moves or flips it means you imported with the wrong settings.  

![](../../assets/images/imported-1.png)  

#### Step 2. Import Cleanup  
##### 2.1 Normals
As you can see, the face orientation is flipped.  

![InvertedNormals](../../assets/images/normal-orientation.png)  

We need to flip these to be able to have our model display correctly.  
To do this enter Edit Mode, Mesh :octicons-arrow-right-24: Normals :octicons-arrow-right-24: Flip or press ++alt+n++ and then Flip.  

![](../../assets/images/flip-normals.png)  

- They should now be blue. 

##### 2.2 Merge  
Not all models need it but it is best practice to merge by distance each mesh.
To do so go to Mesh :octicons-arrow-right-24: Clean Up :octicons-arrow-right-24: Merge by Distance or ++m++ and choose Merge by Distance.  

![](../../assets/images/by-distance-1.png)  

- Make Sure not to go any higher than this as you might remove parts of the actual geometry.  

![](../../assets/images/by-distance-2.png)  

##### 2.3 Vector  
Because of the merge we need to reset the vectors.
To reset these enter Edit Mode, Mesh :octicons-arrow-right-24: Normals :octicons-arrow-right-24: Reset Vectors or press ++alt+n++ and then Reset Vectors.  

![](../../assets/images/reset-vectors.png)  

##### 2.4 Shading
For the normal maps to work in future we need to set the mesh to shade smooth.
To do this go back to Object mode and click Object :octicons-arrow-right-24: Shade Smooth or Right Click and select Shade Smooth.  

![](../../assets/images/shade-smooth.png)  

#### Step 3. Shader
For this step you need to make sure that you extracted the material .txts and textures of the model, as well as converted your .dds textures to another format. Details on how to do that as well as how to convert the textures are on the [extractor](../extractor/extractor.md) page.  

- In this guide we are using the Pruu Shader.  

##### 3.1 Shader Generation  
First we need to identify what shader generation the model uses, The process for doing so is detailed on the [shader](../shaders/shaders.md) page.  
The shader gauss uses is G3.  
##### 3.2 Adding Shader  
I already know that we need a G3 Shader so we will append the `H_Khora_Deluxe` material from the `G123 Split Shader.blend` 
##### 3.3 Applying Shader 
Next, we want to copy the name of the material on the object which is `GaussPrimeBody` then we change the shader applied to `H_Khora_Deluxe` and then we change the name to `GaussPrimeBody` 
##### 3.4 Setting Up Shader 
This is where we want to go back into the folder where we extracted the Gauss Prime materials and textures to.
###### 3.4.1 Adding Textures
We then want to drag all of the textures that start with the same name as the material into the shader editor.  

- Make Sure that the textures are set to non colour.  

![](../../assets/images/textures-nc.png)

###### 3.4.2 Setting Textures 
Now we want to look at the shader and look at all of the image files that are already there.  
Then we want to replace them with the ones we dragged in.  
![](../../assets/images/node-replacment.png)  

1. Tint mask
2. Normal map 
3. Emission map 
4. Tint mask / Material Tint mask
5. Packmap 

![](../../assets/images/node-replaced.png)  

###### 3.4.3 Setting colours and details 

Now we are able to set the default colours and details.  
However, our GaussPrimeBody.txt file is empty so we need to look for the colours, grunge and details in one of the frames signature weapons, for us that would be either the Acceltra's or the Akarius' txt file.  
Inside the Acceltra's file we find these:  
```c
"PrimeAcceltraMat.txt"

PS:TintColor0=[0.72000003,0.69999999,0.75,0.5]
PS:TintColor1=[0.044,0.044,0.044,0.5]
PS:TintColor2=[0.071000002,0.054000001,0.1,0.5]
PS:TintColor3=[0.56,0.38,0.097999997,0.5]

PS:EmissiveTintColorLo=[0,0.0044999998,1,1]
PS:EmissiveTintColorHi=[0,0.85000002,1,1]

PS:UvScale01=[8,8,4,4]
PS:UvScale23=[4,4,4,4]


TX:BlackPackMap=/Lotus/Characters/SharedTileableTextures/PlayerTintable/Porcelain50PackMap
TX:BlackNormalMap=/Lotus/Characters/Sentient/SentientTileableTextures/SentientSurfaceA_n.png

TX:RedPackMap=/Lotus/Characters/SharedTileableTextures/PlayerTintable/Ivory50PackMap
TX:RedNormalMap=/Lotus/Characters/SharedTileableTextures/Ivory_n.png

TX:GreenPackMap=/Lotus/Characters/SharedTileableTextures/Metal/MetalMachined/MetalmachinedPackMap
TX:GreenNormalMap=/Lotus/Characters/Sentient/SentientTileableTextures/SentientIron_n.png

TX:BluePackMap=/Lotus/Characters/SharedTileableTextures/GoldSpecGlossPackMap
TX:BlueNormalMap=/Lotus/Characters/SharedTileableTextures/GoldSpecGloss_n.png

```
!!! info "Watch out for this"
	Your material text file might contain `{}` surrounding the colours, this makes the process of setting colours in blender a lot harder. So you want to replace them with `[]` to be able to paste them straight on to the colour slot.   

First we want to add the colours, for this we copy the:
`PS:TintColor0=` to the primary colour.  
`PS:TintColor1=` to the secondary colour.  
`PS:TintColor2=` to the tertiary colour.  
`PS:TintColor3=` to the accents colour.  
`PS:EmissiveTintColorLo=` to the emission low colour.  
`PS:EmissiveTintColorHi=` to the emission high colour.  

Now we want to set the details up, for this we need to look at the name of each of the textures specified in the `TX:**PackMap=*` and `TX:**NormalMap=*` options.    
`BlackPackMap`/`BlackNormalMap` corresponds to `Microdetail Primary`  
`RedPackMap`/`RedNormalMap` corresponds to `Microdetail Secondary`  
`GreenPackMap`/`GreenNormalMap` corresponds to `Microdetail Tertiary`  
`BluePackMap`/`BlueNormalMap` corresponds to `Microdetail Accents`  
![Detail Numbers](../../assets/images/detail-nums.png)  

###### 3.4.4 Repeat 
After you have finished setting up the first material you want to check if there are other materials on other meshes  and if so set them up. 