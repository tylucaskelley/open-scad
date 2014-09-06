radius = 45;
wall = 3;
height = 100;
twist = 5*height/6;

difference(){
	linear_extrude(height = height, center = false, convexity = 0, twist = twist, slices=height/20)
		circle(r = radius, $fn=5);
	translate([0,0,wall])
		linear_extrude(height=height-wall, center=false, convexity=0, twist=twist, slices=height/20)
			circle(r = radius-wall, $fn=5);
}