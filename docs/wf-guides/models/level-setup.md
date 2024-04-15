

### Setting Up levels with the help of the Asset Library  

1. Import the level's .gltf file.  
![GLB Import](../../assets/images/import-1.png)  
	Make sure that you are using the correct import settings.  
	![Level Import](../../assets/images/level-import.png).  

2. Split the window into 2 and select the asset browser.  
	![Asset Browser](../../assets/images/asset-browser.png).  

	2.1. Change the dropdown to `Link`.  
	![Asset Browser Option](../../assets/images/asset-browser-option.png).  
	
	2.2. Go to the outliner tab, then open the filter menu and check the Exact Match checkbox under the search options.  
	![Outliner Filter](../../assets/images/outliner-filter.png).  

3. Select any mesh, Switch to the Material Properties, copy that material's name.  

	3.1. Paste the material's name into the search field in the outliner.  
	![Material Search](../../assets/images/outliner-search.png).  
	
	3.2. Inside the outliner press A to select all of the objects with that material and then press M to create a new collection, its easiest to name the collection after the material that it contains, now you can clear the search.  
	![New Collection](../../assets/images/new-collection.png).  

	3.3. Search the Asset Library for the material, if it exists move on to the next step, if it does not exist in the asset library you will need to manually add it to the asset library. For how to do that refer to [Setting up missing Asset Library Materials](#Setting%20up%20Materials%20that%20are%20not%20in%20the%20Asset%20Library).  
	![search](../../assets/images/asset-lib-search.png).  

4. Inside the materials collection select one of the objects, and drag and drop the material onto that object.  
![Asset Drop](../../assets/images/asset-lib-drop.png).  

	4.1. Keep the object that you had previously dropped the material on to selected and then select the rest of the objects inside the collection, if the object is no longer the active object shift click it, then you can press Ctrl+L and link the materials.  
	![Material Link](../../assets/images/asset-lib-link.png).  

5. Once you have linked all the materials in that collection you can hide it and repeat the process until you have linked all materials that can be linked.  


### Setting up Materials that are not in the Asset Library  
