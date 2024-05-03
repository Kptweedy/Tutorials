# Useful Tools
This is a collection of useful tools that are used in the various processes 

## Scripts

### Blender Import Helper Script  

This script helps with the import process by automating: flipping normals, merging by distance, resetting vectors and shading smooth. 

To use this script copy the text below to a text editor pane and then select all of the meshes to run it on and then press the run script button.
??? abstract "Script"

    ```py
    import bpy

    # Select the active object
    obj = bpy.context.active_object

    # 
    for obj in bpy.context.selected_objects:

        # Edit mode
        bpy.ops.object.mode_set(mode='EDIT')
        
        # Flip Normals    
        bpy.ops.mesh.flip_normals()

        # Remove Doubles
        bpy.ops.mesh.remove_doubles()

        # Reset Normals
        bpy.ops.mesh.normals_tools(mode='RESET')
        
        # Object mode    
        bpy.ops.object.mode_set(mode='OBJECT')

        # Shade Smooth
        bpy.ops.object.shade_smooth()
    ```


## Applications  

### [7zip](https://7-zip.org/) 
- ***Free and Open Source***   

Very powerful file archiver, far superior to winrar.  

### [3d Viewer](https://www.microsoft.com/store/productId/9NBLGGH42THS)
- ***Should Come With Windows***  

This program is useful for quickly viewing the 3d models that are exported with the exporter.  

### [F3D](https://github.com/f3d-app/f3d)
- ***Free and Open Source***   

Another fast 3d model viewer, however the gltf files are only viewable with raytracing, may not be fast if your hardware is slow. 

### [XnView MP](https://www.xnview.com/en/)  
- ***Freeware***  

XnView MP can be used to browse exported files with fast thumbnail generation and a preview that works with .dds files, can also be used to convert .dds files to other image formats.  

### [Everything Search](https://www.voidtools.com/)
- ***Freeware***  

Very powerful searching tool that will help you find files in an instant 

### [WinMerge](https://winmerge.org/)
- ***Free and Open Source***

Useful for finding differences in material files when updating/adding materials 

### WTV & DDS Utils  
- ***Freeware & Possibly Unsafe***  

I acquired these files from various websites on the internet ([Softpedia](https://www.softpedia.com/get/Multimedia/Graphic/Graphic-Viewers/WTV.shtml) & [ModDB](https://www.moddb.com/downloads/nvidia-dds-utilities)) DDS Utils is needed for WTV to work. Don't install them if you don't trust them.  

[WTV&DDS Utils](../../assets/files/WTV&DDS_Utils.7z)  
WTV(Windows Texture Viewer) is quite useful for quickly opening a .dds file and previewing the separate colour channels.  

### [Intel® Texture Works Plugin for Photoshop](https://github.com/GameTechDev/Intel-Texture-Works-Plugin)
- ***Free and Open Source***

Allows you to open and edit DDS textures in Photoshop.