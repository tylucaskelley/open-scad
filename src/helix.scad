module helix_footprint(helix_r=50
	,arm_r=10
	,arm_offset=1
	,arm_rot=30
	) {
  union() {
    translate([ -helix_r,0]) 
      rotate([0,0,arm_rot]) translate([-arm_offset,0,0])
	circle(arm_r,0);
    translate([ helix_r,0]) 
      rotate([0,0,arm_rot]) translate([arm_offset,0,0])
	circle(arm_r,0);
  }
}

module helix_coil(helix_r=50
	, arm_r=10
	, helix_h=100
	,arm_offset=0
	,arm_rot=0
	) {
  linear_extrude(height=helix_h, convexity=10, twist=360.0) 
	helix_footprint(helix_r=helix_r
		,arm_r=arm_r
		,arm_offset=arm_offset
		,arm_rot=arm_rot
	);
}

difference() {
  helix_coil(helix_h=100
	,arm_r=10
	,helix_r=9
	);
  for( i=[0:2] ) {
    assign(rotAngle=360*i/3) {
	translate([0,0,-0.01]) helix_coil(helix_h=100.02
	,arm_r=4
	,helix_r=9
	,arm_offset=7.0
	,arm_rot=rotAngle
	);
    }
  }
}