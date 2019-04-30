model = Sketchup.active_model
m=3
while m < 4
	h = 9
    teller = model.layers.count 
	while h < 11
		t = Time.local(2019, m, 21, h)
		Sketchup.active_model.shadow_info["ShadowTime"] = t		 
		a = [0.m,13.m,0] #pick point
		orvar=Geom::Point3d.new(a)
		pp = Geom::Point3d.new(Geom::Vector3d.linear_combination(
		500,Sketchup.active_model.shadow_info["SunDirection"],
		1,Geom::Vector3d.new(a)).to_a)	
        #new_layer = 
        mod.layers.add 'zLayer' + h.to_s
        behavior = LAYER_HIDDEN_BY_DEFAULT 
        model.layers[-1].page_behavior = behavior
		model.entities.add_line(orvar, pp)	
        model.entities[-1].layer = model.layers[-1]  
        model.pages.add "Uur " + h.to_s
        model.layers[teller].visible = false
        teller = teller + 1
		h = h +1
	end
m = m + 1
end
