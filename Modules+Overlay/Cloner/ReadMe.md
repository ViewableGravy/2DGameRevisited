Gravy's Processing sub folder generator

Background:  
processing does not support sub folder structures similar to packages in java or class libraries in c#. A typical solution to this is using eclipse for your project and importing processing as a library but this introduces complexities such as passing the PApplet around your program as well as other things. 

What this does:  
This project takes a processing sketch folder and places hard copies of each file in another folder. By doing this you can edit the files from another editor (vsCode) and put the files into a folder structure while maintaining functionality within your sketch. This tool therefore can:  
- Create a copy of each .pde file in your processing sketch in another folder
- Take any new .pde files and add them to your processing sketch
- Compile your processing sketch

How to setup:
note: I plan on making the setup process much simpler (.exe file that generates everything)

1. Place this project folder in the same folder as your sketch and destination folder location as demonstrated below  
-|-Cloner  
 |-ProcessingSketch  
 |-DestinationFolder  
2. Open FileAtoB and add your processing sketch folder name on line 1, your destination folder name on line 2, and the file extension to copy (.pde), note that this will work with any extension type but only officially supports .pde.
3. Make sure you have processing added to your path variable so that you can compile from .bat