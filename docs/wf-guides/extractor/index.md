# Using The Extractor
??? youtube "Video Explanation"  
	<iframe width="752" height="423" src="https://www.youtube.com/embed/71fCaIE7J_4?si=8DUQ0K3U-Ds-8uUN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Getting Started  

### Basic command line concepts  

- Every action is performed by commands.  
- You can use ++tab++ to autocomplete.  
- Basic commands to help you get acquainted with the command line:  
	- use `ls` to list directories.  
	- use `cd` to change directories.  
	- `.\` is used for the current directory.  
	- When using a program you use arguments in the form of  `--argument`.  
- The internal file structure of warframe can be thought of like a Unix system that uses `/` instead of `\` to denote its directories.  

### Downloading the Extractor  
1. Head over to the releases page for the [Extractor](https://github.com/Puxtril/Warframe-Exporter/releases/latest) on GitHub and download the file called `Warframe-Exporter.exe`.  

2. Create a folder for the extractor as well as the files it will be extracting and then put  `Warframe-Exporter.exe` inside that folder.  

### Using the Extractor 

1.  Inside the folder that you have the Extractor in, hold ++shift++ and then right click, this should bring up the context menu with the option to open in Powershell.  
	- Make Sure not to have anything selected when doing this.  
	![open-in-powershell](../../assets/images/open-in-powershell.png)  

2.  Type `.\Warframe-Exporter.exe --help` to show you all of the commands that you can use.  
	![](../../assets/images/--help.png)

3. Next you need to find where your warframe cache is stored, this will be in the same folder that you installed warframe in.  
	- If you installed with steam click browse local files to find your installation.  
		 ![Browse-Local](../../assets/images/browse-local.png)   
	
	 You then want to select the folder called `Cache.Windows` and click `Copy Path` up in the ribbon above
	![cache.windows](../../assets/images/cache.windows.png)  

### Common Extractor commands


<!--
1. Download the latest Extractor release from the github page.

2. Inside the folder you downloaded it to, SHIFT + Right click and press Open CMD here or Open Powershell here. It doesn’t matter which.

3. Type in “.\”, the name of the executable, and the command you want to execute. Examples below. You can always type .\Warframe-Extractor.exe –help for a full list of options.
Models: .\Warframe-Extractor.exe –cache-dir C:\<Path-to-Warframe-Cache.Windows> –extract-models
.\Warframe-Extractor.exe –cache-dir C:\<Path-to-Warframe-Cache.Windows> –extract-textures
-->