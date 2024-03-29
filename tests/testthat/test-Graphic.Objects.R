###################
#
# Thesis
#
# Title: BioShapes
#
# Candidate: Darian Voda
# Faculty of Mathematics and Informatics, UVT
#
# Coordinator:
#   Prof. Daniela Zaharie
#   Dr. med. Leonard Mada (Syonic SRL)
#
# in collaboration with Syonic SRL
#
# GitHub: https://github.com/DarianFlorianVoda/Diagram-Generator


#### Tests ####

#### Simple Circles ####
# - plot radially n circles;
n = 10
R = 8
r = 1
phi = pi / n; # add some rotation
# Ex 1a:
xy = pointsCircle(n, R, phi=phi);
testFilledCircle(xy, r=r, lim = R+1, lcol=1);
# Ex 1b:
testFilledCircle(xy, r=seq(r,2, length.out=n), lim = R+1, lcol=1);


#### Closed Circles ####
# - n & r known, R unknown;
n = 15
r = 1
phi = pi / n; # add some rotation
xy = circlesOnCircle(n, r, phi=phi);
testFilledCircle(xy);


### Radius of Big Circle: known
# - small circles: on the big circle;
# - n & R known, r unknown;
n = 15
R = 7
xy = circlesOnFixedCircle(n, r=R, phi=phi);
testFilledCircle(xy, R=R);


#### Inside Circle ####

# Tangent & Inside given Circle
# Outer Circle: known

### Example 1: Simple
n = 19
R = 15
phi = pi / n; # add some rotation
xy = circlesInFixedCircle(n, R, phi=phi);
testFilledCircle(xy, R=R)


### Example 2:
# - Circle 1: R unknown
n = 19
r = 1
phi = pi / n; # add some rotation
xy = circlesOnCircle(n, r, phi=phi);
testFilledCircle(xy)

# - Circle 2: based on R of Circle 1;
# Outer Circle: known
# Inner Circle: unknown
R = attr(xy, "R") - r;
xy = circlesInFixedCircle(n, r=R, phi=phi);
testFilledCircle(xy, add=TRUE, line=FALSE);


#### Outside Circle ####

# Tangent & Outside given Circle
n = 13
R = 6
phi = pi / n; # add some rotation
xy = circlesOutsideFixedCircle(n, R, phi=phi);
testFilledCircle(xy, R=R);


#### Shifted Center ####

# 2 Circles
n = 23
R = 6
phi  = pi / n;
mid1 = c(-R, 0); mid2 = mid1 + c(2*R, 0);
xy1 = circlesInFixedCircle(n, r=R, center=mid1);
xy2 = circlesInFixedCircle(n, r=R, center=mid2, phi=phi);
testFilledCircle(xy1, R=R, lim = 2*R + 1);
testFilledCircle(xy2, R=R, add=TRUE);


#####################

#### Cell Shapes ####

### Brush-Border Cell
p1 = c(0,0)
cell = cellBrushBorder(p1, w=5, h=8)
plot.base()
lines(cell)


### Slanted Cell
p1 = c(0,2); slope = -1;
cell = cellBrushBorder(p1, w=5, h=8, slope=slope)
plot.base()
lines(cell)


### Smooth Muscles / Connective Tissue
plot.base()
lst = cellSmooth(c(1,5), c(2, 7))
lines.object.base(lst, lwd=2)

lst = cellSmooth(c(2,7), c(1, 5), r=0.6)
lines.object.base(lst, lwd=2)


##################

#### Liposome ####

testLiposome = function(lst, col="#48B000", col.line=1){
  testFilledCircle(lst[[1]], line = FALSE, add = TRUE, col=col)
  testFilledCircle(lst[[2]], line = FALSE, add = TRUE, col=col)
  lines.object.base(lst[3], lwd=1, col=col.line)
}

plot.base(xlim=c(-10,10), ylim=c(-10,10))
lst = liposomes(c(30, 17), r=0.5, phi=c(0, pi/34), d=0.2)
testLiposome(lst)


### Helix / DNA ####

### Ex 1a:
p1 = c(1,1); p2 = c(8,3);
lst1 = helix(p1, p2)
lst2 = helix(p1, p2, phi=-pi/2)
plot.base()
lines(lst1)
lines(lst2)
# visual aids
abline(v = p1[1], col="green")
abline(v = p2[1], col="green")

### Ex 1b: Shifted version of helices
dy = c(0, 3); n = 2.5;
lst1 = helix(p1 + dy, p2 + dy, n=n)
lst2 = helix(p1 + dy, p2 + dy, n=n, phi=-pi/2)
# plot.base() # add to previous image;
lines(lst1)
lines(lst2)

### Ex 1c: Reversed direction
# different p2!
dy = c(0, 5); p2 = c(7,9)
lst1 = helix(p1 + dy, p2)
lst2 = helix(p2, p1 + dy, phi=-pi/2)
# plot.base() # add to previous image;
lines(lst1, col="blue", lwd=2)
lines(lst2, col="red", lwd=2)


### Ex 2: Vertical Object
p1 = c(1,1); p2 = c(p1[1], 8);
lst1 = helix(p1, p2)
lst2 = helix(p1, p2, phi=-pi/2)
plot.base()
lines(lst1)
lines(lst2)
# visual aids:
abline(h = p1[2], col="green")
abline(h = p2[2], col="green")

# reversed direction:
dx = c(4, 0)
lst1 = helix(p1 + dx, p2 + dx)
lst2 = helix(p2 + dx, p1 + dx, phi=-pi/2)
lines(lst1, col="blue")
lines(lst2, col="red")



#### Spirals / Coils ####

### Ex 1:
p1 = c(1,1); p2 = c(2,8); dx = c(2.5,0);
lst1 = spirals(p1, p2)
lst2 = spirals(p1 + dx, p2 + dx)
plot.base()
lines(lst1)
lines(lst2)

### Ex 2:
p1 = c(1,1); p2 = c(2,8); dx = c(3,0);
lst1 = spirals(p1, p2)
lst2 = spirals(p2 + dx, p1 + dx)
plot.base()
lines(lst1)
lines(lst2)

### Ex 3: Vertical
p1 = c(1,1); p2 = c(p1[1],8); dx = c(2.5,0);
lst1 = spirals(p1, p2)
lst2 = spirals(p2 + dx, p1 + dx)
plot.base()
lines(lst1)
lines(lst2)

