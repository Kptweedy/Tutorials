# Baking Textures
### Texture Type Table 
| Texture Type | Colour Space |
|:------------ |:------------ |
| Base Color   | sRGB         |
| Emission     | sRGB         |
| Metallic     | Non-Color    |
| Roughness    | Non-Color    |
| Specular     | Non-Color    |
| Normal       | Non-Color    |


???+ youtube "Early Video explaining the basics"
	<iframe width="560" height="315" src="https://www.youtube.com/embed/-naBXsdqMUM?si=uGImEt0tVGNJYw8s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>  

## How to bake textures on Pruu models  

First of all, switch to the shading tab.  
Now set the render engine to cycles. If your computer is compatible  it is highly recommended to switch to the GPU Compute render device.  
You also want to open the samples panel and set it to a low number (1-4).  
  ![Shading tab and render settings](../../assets/images/bake-1.png)  
  
Now you want to scroll down to the `Bake` section and input these settings:  
- Bake Type: Emit  
- Output, Target: Image Texture  
- Unchecked Clear Image  
- Margin, Size: from 2-5px  
![Bake settings](../../assets/images/bake-2.png){ width="75%" }  
  
Now you want to select the object that you want to bake in the viewport.  
Then in the shader editor create a new image texture node with ++shift+a++.  
![New Image Node](../../assets/images/bake-4.png)  
  
In the image node create a new image and name it whatever you want, for this example we are using 2048x2048 but you can go higher if you want.  
Depending on what type of texture you will be baking, refer to the table at the top of the page and set the colour space accordingly.  
![New Image](../../assets/images/bake-5.png)  
  
These sockets are where you can source the textures to bake from. 
![Output Sockets](../../assets/images/bake-6.png)  
  
Now you drag the output to the surface socket on the material output.  
![Dragging](../../assets/images/bake-7.png)  
  
After you have set up the texture to be baked make sure you have the newly created texture selected, it should have a white outline.  
Make sure that the mesh is also still selected.  
![texture to be baked](../../assets/images/bake-8.png)  

Now you can go back to the bake panel and click bake.  
![Bake](../../assets/images/bake-9.png)  
  
Now if you switch a pane to an image editor tab and open the image you baked to you can save it.  
![save image](../../assets/images/bake-10.png)  

## How to bake textures on Valkyrie models  
Valk hasn't sent me the steps for his, however it is probably similar to the method shown in the video.