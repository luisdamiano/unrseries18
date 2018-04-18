plot_seq <- function(x, format.labels = TRUE, ticks.on = 'auto', k = 1, cex.axis = 0.7, ...) {
  ticks <- xts::axTicksByTime(x, ticks.on = ticks.on, k, format.labels = format.labels)
  plot(head(as.vector(ticks), -1), y = as.vector(x),
       xaxt = 'n', ...)

  axis(side = 1, at = as.vector(ticks), labels = names(ticks),
       cex.axis = cex.axis)
}

add_points <- function(x, ...) {
  if (!is.xts(x))
    stop("Not an xts object, sorry =/")

  points(x = 1:nrow(x), y = as.vector(x),
         pch = 21, cex = 2 * par('cex'), ...)
}

add_lines <- function(x, ...) {
  ticks <- xts::axTicksByTime(x, ticks.on = 'days')
  ticks <- 1:nrow(x)
  lines(as.vector(ticks), as.vector(x), ...)
}

myPlot.decomposed.ts <- function(x, ...) {
  xx <- x$x
  if (is.null(xx))
    xx <- with(x, if (type == "additive")
      random + trend + seasonal
      else random * trend * seasonal)

  X <- cbind(
    Observado = xx,
    Tendencia = x$trend,
    Estacional = x$seasonal,
    Irregular = x$random
  )
  colnames(X) <- c("Observaci?n", "Tendencia", "Estacional", "Irregular")
  # colnames(X) <- c(expression(Z[t]), expression(hat(T)[t]), expression(hat(S)[t]), expression(hat(E)[t]))

  plot(X, ...)
}
