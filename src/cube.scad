use <MCAD/fonts.scad>

thisFont=8bit_polyfont();
x_shift=thisFont[0][0];
y_shift=thisFont[0][1];

word=["FUCK"];
word2=["IT"];

module fuck(word_offset=20.0,word_height=2.0) {
  for(i=[0:(len(word)-1)]) assign( hourHandAngle=(i+1)*360/len(word), theseIndicies=search(word[i],thisFont[2],1,1) ) {
    rotate(90-hourHandAngle) translate([word_offset,0])
      for( j=[0:(len(theseIndicies)-1)] ) translate([j*x_shift,-y_shift/2]) {
        linear_extrude(height=word_height) polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
      }
  }
}

module you(word_offset=20.0,word_height=2.0) {
  for(i=[0:(len(word2)-1)]) assign( hourHandAngle=(i+1)*360/len(word2), theseIndicies=search(word2[i],thisFont[2],1,1) ) {
    rotate(90-hourHandAngle) translate([word_offset,0])
      for( j=[0:(len(theseIndicies)-1)] ) translate([j*x_shift,-y_shift/2]) {
        linear_extrude(height=word_height) polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
      }
  }
}

difference() {
	cube(50, center=true);
	translate([-5,-35,20])
		fuck(word_offset=16.0,word_height=5.0);
	translate([5,-35,20])
		you(word_offset=16.0,word_height=5.0);
}