###################
#
# Bachelor Thesis
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


##########################
#### Helper Functions ####

### Example 1:

# Base-Line
# Note: x = (x0, x1); y = (y0, y1);
plot.base()
x = c(0,10); y = c(1, 5);
lines(x, y, lwd=2, col="red")

### Shift point along line:
p0 = c(0, 1)
p = shiftPoint(c(0,1), x, y, d=1)
points(p, col="green"); points(p0[1], p0[2]);
# sequence
p0 = c(0, 2)
p = shiftPoint(c(0,2), x, y, d=seq(1, 4, by=0.5))
points(p, col="blue"); points(p0[1], p0[2]);


### Reflected point:
# points(x, y)!
p0 = c(1, 2)
p = reflect(x, y, p0)
points(p0[1], p0[2]); points(p[1], p[2]);
lines(c(p0[1], p[1]), c(p0[2], p[2]), col="green")

#
p0 = c(4, 2)
p = reflect(x, y, p0)
points(p0[1], p0[2]); points(p[1], p[2]);
lines(c(p0[1], p[1]), c(p0[2], p[2]), col="green")

#
p0 = c(5, 1)
p = reflect(x, y, p0)
points(p0[1], p0[2]); points(p[1], p[2]);
lines(c(p0[1], p[1]), c(p0[2], p[2]), col="green")

### Shift Line
l = shiftLine(x, y, d=2)
lines(l)

#### Objects ####
all_objects()


#### Arrows ####
all_arrows()



#### Liposome Measured ####
measure_liposome()



#### Description of a liposome ####
plot.base(xlim=c(-10,10), ylim=c(-10,10))
definition_liposome(
  c("Outer lipid layer", "Inner lipid layer", "Lipid bilayer"))


### Arrows with Enzymes ####
plot.base()
enzymeReaction()
enzymeReaction(y = 6, lbl = c("A2", "B2", "Enz2", "Inhibitor 2"))
