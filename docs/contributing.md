# Contributing

#### How to contribute  

To learn how to write in markdown reference this [markdown guide](https://www.markdownguide.org/basic-syntax).  
To learn how to use github reference this [short video](https://www.youtube.com/watch?v=iv8rSLsi1xo) or if you would like to learn more reference this [long video](https://www.youtube.com/watch?v=tRZGeaHPoaw).  

MkDocs-Material [Documentation](https://squidfunk.github.io/mkdocs-material/).  

To host a locally hosted development site first make sure that you have the latest python installed and it is in your path.

 
  - Clone the repository.  
```
git clone https://github.com/Kptweedy/Tutorials.git
```  

- Inside the repository create a virtual environment.  
```
python -m venv venv
```  

- Activate the virtual environment.   
=== "Windows"
	  
	 ```
	 .\venv\Scripts\Activate.ps1
	 ```  
=== "Unix " 
	
	```
	source /venv/bin/activate
	```  


- Upgrade pip.  
```
python -m pip install --upgrade pip
```  

- Install mkdocs-material and the plugins it needs.  
```
python -m pip install mkdocs-material
pip install mkdocs-open-in-new-tab

```  

- Run the server and head to [http://localhost:8000](http://127.0.0.1:8000)
```
mkdocs serve
```  


### Stuff to do

- [ ] Warframe Guides [Introduction](wf-guides/index.md)
- [ ] [Extractor](wf-guides/extractor/index.md) Guide
	* [ ] [Internal File Structure](wf-guides/extractor/file-list.md)
	* [ ] [Tools](wf-guides/extractor/tools.md) 
- [ ] Model [Introduction](wf-guides/models/index.md)
	* [ ] [Mega](wf-guides/models/mega.md) Layout
	* [ ] Model [Setup](wf-guides/models/model-setup.md) 
	* [ ] Model [Usage](wf-guides/models/model-usage.md)
- [ ] Shader [Introduction](wf-guides/shaders/index.md)
	* [ ] Pruu [Shader](wf-guides/shaders/pruu/index.md)
	* [ ] Pruu [DetailTextures](wf-guides/shaders/pruu/details.md)  Names 
	* [ ] [Baking Guide](wf-guides/shaders/baking.md)
	* [ ] Valkyrie [Shader](wf-guides/shaders/valk-shader.md)
- [ ] General Cleanup of files and pages 

- [ ] [Inspiration Gallery](inspiration-gallery/index.md)