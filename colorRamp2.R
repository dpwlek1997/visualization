# to visualize generated pallet using circlize::colorRamp2

# set-up
library(circlize)

# function
draw_colorRamp2 <- function(breaks, colors){
    
    # create the color ramp
    color_ramp <- circlize::colorRamp2(breaks, colors)
    
    # set up the plotting 
    num_rectangles <- 100  #  number of rectangles to draw 
    data_values <- seq(min(breaks), max(breaks), length.out = num_rectangles) # generate values ranging from the minimum to the maximum break value
    rect_width <- 1        # the width of each rectangle
    plot(0, 0, xlim = c(0, num_rectangles), ylim = c(0, 1),     # set up the plotting area
         type = "n", xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    
    # draw rectangles with colors from the color ramp
    for (i in 1:num_rectangles) {
      rect(i - 1, 0, i, 1, col = color_ramp(data_values[i]), border = NA)
    }
}

# exampl_1
breaks <- c(-2, 0, 2)
colors <- c("green", "white", "red")
draw_colorRamp2(breaks=breaks, colors = colors)

# example_2
draw_colorRamp2(breaks=c(0,1,3,6,9,12), colors = viridis::turbo(6))
    
    # Add color legend
    legend("topright", legend = breaks, fill = colors, title = "Values", cex = 0.8)
