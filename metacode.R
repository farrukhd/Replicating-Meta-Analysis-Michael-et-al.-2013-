if (!require(metafor)) install.packages("metafor", dependencies = TRUE)
library(metafor)

# Load the data
data <- read.csv("dat.michael2013.csv")

# Run the meta-analysis using a random-effects model
res <- rma(yi = yi, vi = vi, data = data, method = "REML")

# Create a forest plot with custom styling
forest(res,
       slab = data$Study,             # Study names on the y-axis
       xlab = "Effect Size (Hedges' g)", 
       mlab = "Random Effects Model", # Label for the model
       cex = 0.5,                   # Text size
       psize = 1.2,                   # Point size
       xlim = c(-1, 1),               # X-axis range
       ilab.xpos = c(-0.6, -0.3),    # Position of additional labels
       ilab.cex = 0.8,                # Size of additional labels
       header = c("Study", "Medium", "Compensation", "Effect Size [95% CI]"),
       col = "blue",                   # Color of the points
       col.inside = "gray40",          # Color of the CI lines
       col.diamond = "red",            # Color of the summary diamond
       addfit = TRUE)                  # Add summary fit line

# Add a title and subtitle
title(main = "Forest Plot of Meta-Analysis", 
      sub = "Effect sizes with 95% confidence intervals")

# Add a vertical line at 0 (no effect)
abline(v = 0, col = "gray70", lty = 2)