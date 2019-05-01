mod = Sketchup.active_model
m=3
while m < 4
	h = 9
    teller = model.layers.count 
	while h < 22
		t = Time.local(2019, m, 21, h)
		Sketchup.active_model.shadow_info["ShadowTime"] = t		 
		a = [0.m,13.m,0] #pick point		
        mod.layers.add 'zLayer' + h.to_s
        behavior = LAYER_HIDDEN_BY_DEFAULT 
        model.layers[-1].page_behavior = behavior
        group2=model.entities.add_group
        
        c = group2.entities.add_circle a, model.shadow_info["SunDirection"], 10
  face = group2.entities.add_face(c) 
  face.material = Sketchup::Color.new(247, 234,93)
  face.pushpull 800
        model.entities[-1].layer = model.layers[-1]  
        text_group = group2.entities.add_group
        text_group.entities.add_3d_text(m.to_s + "-" + (h -1).to_s, TextAlignLeft, "Arial",  true, false, 50.0, 0.0, 0.5, true, 5.0)
        a = [3.m,15.m,310.cm]
		pp=Geom::Point3d.new(a) 
        tr=Geom::Transformation.rotation(ORIGIN, Z_AXIS, 180.degrees)
        tp=Geom::Transformation.new(pp)
		text_group.transform!(tp*tr)
        model.pages.add "Uur " + (h-1).to_s
        model.layers[teller].visible = false
        teller = teller + 1
		h = h +1
	end
m = m + 1
end
