// title: Family Giggles First Attempt
// author: Rob Mackie 
// license: all rights reserved
// revision: 0.005

function main() {
    var face1 = new CAG.fromPoints([[0,0], [7.1,0], [5.0,4.9] ]);
    var shape = face1.extrude({offset: [0,0,20]}).rotateX(90);
    return union (
    difference(
        union( 
            //shoulder
            /* cube([2,20,5*1.414]).translate([2.5*1.414,0,0]), */

            // diamond
            cube([6,20,7]).rotateY(45).translate([0,0,1.414*7/2]), 

            // body slab
            cube([40,20,1]).translate([4.3,0.0]),
            shape.translate([4,20,1])
        ),
        //magnet hollow
        cube([4.97,22,5.71]).rotateY(45).translate([2,0,1.414*7/2]),
        extruded_stringX("Dad",4,4,0.5).translate([12,5,0])
    ),
    cube([30,0.2,0.2]).translate([12,10,0]),
    cube([30,0.2,0.2]).translate([12,8,0])
    );
}

function extruded_stringY(theString, height, width, scale) {
    height = height || 4;
    width = width || 4;
    scale = scale || 1;
    var letters = vector_text(0,0,theString);   // l contains a list of polylines to be drawn
    var o = [];
    letters.forEach(function(pl, height, scale) {                   // pl = polyline (not closed)
        o.push(rectangular_extrude(pl, {w: width, h: 4}));   // extrude it to 3D
    });
    shape = union(o); 
    shape = rotate([0,0,90], shape);
    return shape.scale(scale);
}

function extruded_stringX(theString, height, width, scale) {
    height = height || 4;
    width = width || 4;
    scale = scale || 1;
    var letters = vector_text(0,0,theString);   // l contains a list of polylines to be drawn
    var o = [];
    letters.forEach(function(pl) {                   // pl = polyline (not closed)
        o.push(rectangular_extrude(pl, {w: width, h: height}));   // extrude it to 3D
    });
    shape = union(o); 
    return shape.scale(scale);
}
