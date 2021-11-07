#Crowd Exporter
#Released 11/11/2019 10:33AM
#Update 11/11/2019, all UI functions are moved to a master script called Populous

require 'sketchup.rb'
#SKETCHUP_CONSOLE.show
#UI.menu("Populous").add_item("Crowd Exporter"){
  
  #prompts = ["Number of Standing Fan Model Groups" ,"Output file location"]
  
  #defaults = [3,"C:/Users/Public/Documents"]
  
  #input = UI.inputbox(prompts, defaults, "Crowd Exporter")
    
  #coolDan(input)
  
#}

def coolDan(input)
  

  mod = Sketchup.active_model # Open model
  ent = mod.entities # All entities in model
  sel = mod.selection # Current selection
  options_hash = { :triangulated_faces => true,
                 :doublesided_faces => true,
                 :edges => false,
                 :author_attribution => false,
                 :texture_maps => true,
                 :selectionset_only => false,
                 :preserve_instancing => true }
  
  mod.start_operation('coolDan', true)
  
  if mod.layers["1_Standing"]
    nil
  else
    mod.layers.add("1_Standing")
  end

  if mod.layers["1_Sitting"]
    nil
  else
    mod.layers.add("1_Sitting")
  end

  url = input[1]
  range = sel.length-1
  #input  = 3
  number = input[0]
  
  for i in 0..(mod.layers.length-1) do
	mod.layers[i].visible = false	
  end 
      
  mod.layers["1_Standing"].visible = true
  for i in 0..(number-1) do
		
	if mod.layers["Person #{i}"]
	  mod.layers["Person #{i}"].visible = true
	  urlNew = url + "/" + "PersonStanding #{i}" + ".dae"
	  status = mod.export(urlNew, options_hash)
	  mod.layers["Person #{i}"].visible = false
	else 
	  nil
	end
  end 
	
  mod.layers["1_Standing"].visible = false
  mod.layers["1_Sitting"].visible = true
  for i in number..(mod.layers.length-1) do
	if mod.layers["Person #{i}"]
	  mod.layers["Person #{i}"].visible = true
	  urlCool = url + "/" + "PersonSitting #{i}" + ".dae"
	  status = mod.export(urlCool, options_hash)
	  mod.layers["Person #{i}"].visible = false
	
	else
	  nil
	end
  
  end
  mod.commit_operation
  end

  

	


	  





