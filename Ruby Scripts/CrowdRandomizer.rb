#Crowd Randomizer
#Released 11/11/2019 10:33AM
#Update 11/11/2019, all UI functions are moved to a master script called Populous

require 'sketchup.rb'
#SKETCHUP_CONSOLE.show
#UI.menu("Populous").add_item("[POP] Crowd Randomizer"){
  
  #prompts = ["# of Unique Fan Model Groups"]
  
  #defaults = [5]
  
  #input = UI.inputbox(prompts, defaults, "Crowd Randomizer \n (keep groups under 2,000 elements)")
    
  #goDan(input[0])
  
  #UI.messagebox("It's Done!")

#}

def goDan(input)
  

  mod = Sketchup.active_model # Open model
  ent = mod.entities # All entities in model
  sel = mod.selection # Current selection


  range = sel.length-1
  #input  = 3
  number = input
  
  for i in 0..(number-1) do
	if mod.layers["Person #{i}"]
	  nil
  else 
	  mod.layers.add("Person #{i}")
  end  
	
  for x in 0..range do

	rand = rand(number)

	for i in 0..(number-1) do  
	  
	  if rand == i	  
		sel[x].layer = mod.layers["Person #{i}"]

	  else 
		nil
	  end 
	end
  end 
end
  end 





