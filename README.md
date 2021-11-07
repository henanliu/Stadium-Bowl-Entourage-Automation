# Stadium-Bowl-Entourage-Automation
A Process that helps create entourage on stadium seats. 
It relies on seating models, typically from Revit, and converts them to a number of groups of nodes that are replaceable with people in Lumion.

The main process can be done in either Sketchup (Ruby) or Rhino 3D (Python). 
Currenty, the Ruby script for the former one is more developed.
It basically creates two Add-Ons that can be implemented in Sketchup that 1) creates a given number of layers and randomly assign seating models to them, and 2) exports them layer by layer to dae. files.
See manual for more details.
The python script for Rhino 3D is less robust. It doesn't included the function of differentiating sitting verses standing people or rotating them towards the center of the stadium pitch. With thay being said, it works without a supporting seating module as the Ruby process would need. 
