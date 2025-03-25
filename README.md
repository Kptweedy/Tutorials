# Tutorials
GitHub Pages made with Material for MkDocs
[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)
#### How to contribute  

To learn how to utilise  the markdown syntax reference this [markdown guide](https://www.markdownguide.org/basic-syntax)  
To learn how to use github reference this [short video](https://www.youtube.com/watch?v=iv8rSLsi1xo) or if you would like to learn more reference this [long video](https://www.youtube.com/watch?v=tRZGeaHPoaw)  
### Running a development instance
To start a locally hosted development site first make sure that you have the latest python installed and it is in your path.
 
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
python -m pip install mkdocs-material mkdocs-open-in-new-tab mkdocs-glightbox
```  

6. Run the server and head to [http://localhost:8000](http://localhost:8000)
```
mkdocs serve
```  
