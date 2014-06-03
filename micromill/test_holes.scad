
use <bearing_mount_lib.scad>

$inch = 25.4;
$q_i = 25.4/4;
$8th_i = 25.4/8;
$16th_i = 25.4/16;

$nominal_bolt_r = $inch * 7/16 * 1/2;

module test_holes() {
	difference () {
	    rounded_rect_p_y($nominal_bolt_r, 3*$inch, $8th_i);
	        translate([0.7*$nominal_bolt_r,3.25*$nominal_bolt_r,-1]) {
	            cylinder(r=1.6, h=$q_i+2);
	        }
	        translate([2*$nominal_bolt_r,4.5*$nominal_bolt_r,-1]) {
	            cylinder(r=$nominal_bolt_r+0.2, h=$q_i+2);
	        }
	        translate([2*$nominal_bolt_r,7*$nominal_bolt_r,-1]) {
	            cylinder(r=$nominal_bolt_r+0.1, h=$q_i+2);
	        }
	        translate([2*$nominal_bolt_r,9.5*$nominal_bolt_r,-1]) {
	            cylinder(r=$nominal_bolt_r-0.1, h=$q_i+2);
	        }
	        translate([2*$nominal_bolt_r,12*$nominal_bolt_r,-1]) {
	            cylinder(r=$nominal_bolt_r-0.2, h=$q_i+2);
	        }
	}
}

$2d = 1;
if ($2d) {
    projection(cut=true) {
       translate([0,0,0]) rotate([0,0,0])
         test_holes();
       translate([$inch,0,0]) rotate([0,0,0])
         test_holes();
    }
} else {
    test_holes();
}