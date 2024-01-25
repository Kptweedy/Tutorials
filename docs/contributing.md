# Contributing

#### How to contribute  

To learn how to write in markdown reference this [markdown guide](https://www.markdownguide.org/basic-syntax).  
To learn how to use github reference this [short video](https://www.youtube.com/watch?v=iv8rSLsi1xo) or if you would like to learn more reference this [long video](https://www.youtube.com/watch?v=tRZGeaHPoaw).  

MkDocs-Material [Documentation](https://squidfunk.github.io/mkdocs-material/).  

To host a locally hosted development site first make sure that you have the latest python installed and it is in your path.

 
 1. Clone the repository.  
```
git clone https://github.com/Kptweedy/Tutorials.git
```  

2.  Inside the repository create a virtual environment.  
```
python -m venv venv
```  

3. Activate the virtual environment.   
	- Windows  
	 ```
	 .\venv\Scripts\Activate.ps1
	 ```  
	- Linux  
	```
	source /venv/bin/activate
	```  
	
1. Upgrade pip.  
```
python -m pip install --upgrade pip
```  

5. Install mkdocs-material and the plugins it needs.  
```
python -m pip install mkdocs-material
pip install mkdocs-open-in-new-tab
```  

6. Run the server and head to [http://localhost:8000]()
```
mkdocs serve
```  
