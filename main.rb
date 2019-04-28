model = Sketchup.active_model

m=3
group=model.active_entities.add_group
bg = model.active_entities[-1]
while m < 10
	
	h = 9
	while h < 19

		t = Time.local(2019, m, 21, h)
			Sketchup.active_model.shadow_info["ShadowTime"] = t

		#pick point 
		a = [0.m,13.m,0]
		orvar=Geom::Point3d.new(a)

		pp = Geom::Point3d.new(Geom::Vector3d.linear_combination(
		500,Sketchup.active_model.shadow_info["SunDirection"],
		1,Geom::Vector3d.new(a)).to_a)

		
		#clin=model.active_entities.add_line(orvar, pp)
		bg.entities.add_line(orvar, pp)

		group2=bg.entities.add_group
		group2.entities.add_3d_text(m.to_s + "-" + (h -1).to_s, TextAlignLeft, "Arial",  true, false, 15.0, 0.0, 0.5, true, 5.0)
		tr=Geom::Transformation.rotation(ORIGIN, Z_AXIS, 180.degrees)
		tp=Geom::Transformation.new(pp)
		group2.transform!(tp*tr)
		
		h = h +1

	end
m = m + 1
end
