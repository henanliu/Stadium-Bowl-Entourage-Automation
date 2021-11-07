#Populous Function Calling Master Script
#Released 11/11/2019 10:35AM



require 'CrowdExporter.rb'
require 'CrowdRandomizer.rb'
require 'sketchup.rb'

module Pop
  sub = UI.menu("Plugins").add_submenu("Populous")
  sub.add_item("Crowd Randomizer"){ 
	prompts = ["# of Unique Fan Model Groups"]
	defaults = [5]
	input = UI.inputbox(prompts, defaults, "Crowd Randomizer \n (keep groups under 2,000 elements)")
	goDan(input[0])
  
	UI.messagebox("It's Done!")
	}
  
  sub.add_item("Crowd Exporter"){
	prompts = ["Number of Standing Fan Model Groups" ,"Output file location"]
  	defaults = [3,"C:/Users/Public/Documents"]
  	input = UI.inputbox(prompts, defaults, "Crowd Exporter")
    coolDan(input)
	}
end

