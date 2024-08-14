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
=== "Unix like systems" 
	
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
pip install mkdocs-glightbox
```  

- Run the server and head to [http://localhost:8000](http://localhost:8000)
```
mkdocs serve
```  


### Stuff to do

- [ ] Warframe Guides [Introduction](wf-guides/intro.md)
- [ ] [FAQ](wf-guides/faq.md)
- [ ] [Extractor](wf-guides/extractor/extractor.md) Guide
	* [x] [Internal Names](wf-guides/extractor/internal-paths.md) 
	* [ ] [Tools](wf-guides/extractor/tools.md) 
- [ ] Model Guides
	* [ ] Character [Setup](wf-guides/models/character-setup.md)
	* [ ] Weapon [Setup](wf-guides/models/weapon-setup.md)
	* [ ] Level [Setup](wf-guides/models/level-setup.md)
- [ ] Shader [Introduction](wf-guides/shaders/shaders.md)
	* [ ] Pruu [Shader](wf-guides/shaders/pruu.md) guide
	* [ ] [Baking Guide](wf-guides/shaders/baking.md)
	* [ ] Valkyrie [Shader](wf-guides/shaders/valk-shader.md)
- [ ] General Cleanup of files and pages 

- [ ] Grammar, Punctuation and readability pass  

- [ ] [Inspiration Gallery](inspiration-gallery/index.md)