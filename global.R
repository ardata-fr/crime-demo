library(ggplot2)
library(ggiraph)
library(gdtools)

options(GDTOOLS_CACHE_DIR = "fonts")
if (!dir.exists(gdtools::fonts_cache_dir())) {
  dir.create(
    getOption("GDTOOLS_CACHE_DIR"),
    recursive = TRUE,
    showWarnings = TRUE
  )
}

register_gfont("Ms Madi")

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)

gg_crime <- ggplot(crimes, aes(x = Murder, y = Assault, color = UrbanPop)) +
  geom_point_interactive(
    aes(data_id = state, tooltip = state),
    size = 3,
    hover_nearest = TRUE
  ) +
  scale_colour_gradient(low = "#999999", high = "orange") +
  theme_minimal(base_family = "Ms Madi")
