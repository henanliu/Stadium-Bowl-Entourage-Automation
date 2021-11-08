import rhinoscriptsyntax as rs

__commandname__ = "Randomizer"

# RunCommand is the called when the user enters the command name in Rhino.
# The command name is defined by the filname minus "_cmd.py"
def RunCommand( is_interactive ):
    import rhinoscriptsyntax as rs
    import random as rnd
    pts = rs.GetObjects("Pick'em points bro", filter = 1)
    noGroup = rs.GetInteger("How many randomized group of entourage do you want?")
    #blockName = rs.GetString("block")
    #noGroup = 5
    lstGroup = [[]for i in range(noGroup)]
    
    for i,pt in enumerate(pts):
        index = rnd.randint(0,noGroup-1)
        lstGroup[index].append(pt)
        
    #Adding layers
    for i in range(noGroup):
        layerName = "Group _ " +  str(i)
        rs.AddLayer(layerName)
    
    #Creating and Moving Blocks
    for i,group in enumerate(lstGroup):
        blockName = "Entourage _ " + str(i)
        layerName = "Group _ " +  str(i)
        if group:
            if rs.IsBlock(blockName):
                #print "here"
                rs.DeleteBlock(blockName)
            ball = rs.AddSphere(group[0],12)
            block = rs.AddBlock([ball],group[0],blockName, False)
            
            for j,pt in enumerate(group):
                
                stuff = rs.InsertBlock(block,pt)
                rs.ObjectLayer(stuff,layerName)
                #rs.InsertBlock()
        #rs.pointcoor
    
    #Deleting the original points
    for shit in lstGroup:
        if shit:
            rs.DeleteObjects(shit)
