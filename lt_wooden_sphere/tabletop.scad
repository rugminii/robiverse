use <../libs/bearing_mount_lib.scad>

$inch = 25.4;
$half = $inch/2;
$quarter = $inch/4;
$eigth = $inch/8;
$sixteenth = $inch/16;
$thirtysecondth = $inch/32;

$2d = 0;              // set to one for final rendering as 
                      // 2d projection, before exporting as 
                      // .dxf format file

$slot_width = 3.0;      // thickness of material
$rotating_slots = 2;  // is this used?
$center_hole = 0;     // true puts a hole in disk

$fn=128;

module make_parts() {
//  workspace_bounds(265,300);
// translation for final fit to workspace
translate([2, -1, 0]) {
   // make integration fans
   translate([1,20,0]) {
      // grid of h x v elements
      for (h = [0:0]) {
          for (v = [0:2]) {
            //jiggle and joggle them to fit workspace
            translate([120 * h, 90*v, 0]) {
                exterior_half_circle_y(40,10,12);
                difference() {
                   translate([37, 20, 0]) {
                      rotate([0,0,7]) {
                         cube([150,20,$eigth]);
                      }
                   }
                   translate([200,-95,-1]) {
                      cylinder(r=150, h=$eigth+2);
                   }
                }
                translate([80, 2, 0]) {
                   rotate([0,0,37]) {
                      cube([48,20,$eigth]);
                   }
                }
                translate([70, 15, 0]) {
                   rotate([0,0,0]) {
                      cube([10,10,$eigth]);
                   }
                }
            } 
         }
      }
   }
 }
}

module exterior_half_circle_y(radius, center, slot) {
// measuring stick
//    translate ([28,2,0]) {
//        cube([1,13.5,1]);
//    }
    difference() {
       translate([0, 0, 0]) {
          half_circle_y(radius);
       }
       translate([radius-(radius/3),center-4,-1]) {
          cube([$slot_width,center,$eigth+2]);
       }
       translate([radius+(radius/3)-$slot_width,center-4,-1]) {
          cube([$slot_width,center,$eigth+2]);
       }
       translate([2*radius/3, -1, -1]) {
          cube([2*radius/3,center+1.1-4,$eigth+2]);
       }
       translate([0,-1,-1]) {
          cube([2*radius,2+1,$eigth+2]);
       }
   }
}

module make_full_circle_with_slots(radius, slots, slot_len) {
   $slot_c = slots;
   $degrees = 360/slots;
   translate([radius, radius, 0]) {
      difference() {
         cylinder(r=radius, h=$eigth);
         if ($center_hole) {
            translate([0,0,-1]) {
               cylinder(r=3 * $inch/8, h=$eigth+2);
            }
         }
         for (i = [0 : $slot_c - 1])  {
            rotate(a=(i * $degrees), v = [0,0,1]) {
               translate([radius - slot_len,-1.5,-1]) {
                  cube([slot_len,3,$eigth+2]);
               }
           }
         }
      }
   }
}

module half_circle_y(radius) {
   translate([radius,0,0]) {
      difference() {
	      cylinder(r=radius, h=$eigth);
		   translate([-radius,-radius,-1]) {
		      cube([2*radius,radius,$eigth+2]);
		   }
	   }
   }
}

if ($2d) {
    projection(cut=true) {
       translate([0,0,0]) rotate([0,0,0]) {
         make_parts();
       }
}
} else {
    make_parts();
//  for measuring and calibrating
//    translate([60,40,0]) {
//      cube([20,5,1]);
//    }
}

module foo() {
difference() {
                       cube([150,25,10]);
                       translate([139,-110,-1]) {
                          cylinder(r=125, h=12);
                       }
                   }
}