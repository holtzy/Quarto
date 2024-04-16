# Using the !!sym() function to correctly reference the column names as symbols, instead of directly using the column names as variables.

ChartLineTemplate <- function(Data, xA, yA, title, Units) {
  ggplot(
    data = Data,
    aes(x = !!sym(xA), y = !!sym(yA))
  ) +
    geom_line(color = "gray30") +
    labs(
      title = title,
      subtitle = paste("Units:", Units, sep = " ")
    ) +
    ylab(label = "") +
    scale_x_date(date_breaks = "2 days", date_labels = "%b %d") +
    theme_light() +
    theme(
      title = element_text(colour = "gray30", size = 8),
      plot.subtitle = element_text(size = 7),
      axis.text = element_text(colour = "darkgray", size = 5),
      axis.ticks = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = "gray90", linewidth = 0.1),
      panel.border = element_blank()
    ) +
    scale_y_continuous(
      expand = expansion(mult = c(.1, .2)),
      labels = function(x) {
        map_chr(x, function(y) {
          if_else(Units == "Kilometers", paste0(y, " Km"), paste0(y, " Min"))
        })
      }
    )
}
