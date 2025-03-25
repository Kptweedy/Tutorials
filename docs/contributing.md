# Contributing

#### How to contribute  

To learn how to write in markdown reference this [markdown guide](https://www.markdownguide.org/basic-syntax).  
To learn how to use github reference this [short video](https://www.youtube.com/watch?v=iv8rSLsi1xo) or if you would like to learn more reference this [long video](https://www.youtube.com/watch?v=tRZGeaHPoaw).  
If you need any help or want any questions answered mention @Krab (me) in the discord. 

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
python -m pip install mkdocs-material mkdocs-open-in-new-tab mkdocs-glightbox
```  

- Run the server and head to [http://localhost:8000](http://localhost:8000)
```
mkdocs serve
```  

## Submitting a pull request

https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request

### TODO

- [ ] Warframe Guides [Introduction](guides/intro.md), make it worth reading.
- [ ] [FAQ](guides/faq.md), redo faq to be better structured + record videos. 
- [ ] [Extractor](guides/extractor/extractor.md), advanced cli info. 
	* [ ] [Internal Names](guides/extractor/internal.md), add new frames since whenever the last update was
	* [ ] [Tools](guides/extractor/tools.md), is this even useful?
- [ ] Model Guides
	* [ ] Character [Setup](guides/models/character-setup.md), finish making it informational and get rid of old guide. 
	* [ ] Level [Setup](guides/models/level-setup.md), make simple al material setup guide at the bottom.
- [ ] Shader [Introduction](guides/shaders/shaders.md), add information pretaning to shaders, maybe a guide for porting them to blender using impux. 
	* [ ] Pruu [Shader](guides/shaders/pruu.md), make it readable and add guides on how to setup.
	* [ ] [Baking Guide](guides/shaders/baking.md) record video and add more edge cases. 
	* [ ] Valkyrie [Shader](guides/shaders/valk-shader.md) pester valk. 
- [ ] General Clean-up of files and pages. 

- [ ] Grammar, Punctuation and readability pass. 

- [ ] [Inspiration Gallery](inspiration-gallery/index.md).

- [ ] Finish custom theming.