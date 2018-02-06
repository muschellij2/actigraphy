#' @title Plot Daily Activity Profile
#' @description Given a activity vector (and a wear/nonwear flag vector), plot the
#' daily activity profile (with background)
#'
#' @param x \code{vector} of activity data.
#' @param w \code{vector} of wear flag data with same dimension as \code{x}.
#' @param title title or the plot
#' @param cex.main size of title
#' @param cex.sub size of subtitle
#' @param cex.lab size of x and y lable
#' @param at.y where to put y axis annotation
#' @param cex.xaxis size of x axis annotation
#' @param cex.yaxis size of y axis annotation
#' @param mar defaults to c(4, 4, 2, 1)
#' @param oma defaults to c(1, 1, 1, 1)
#'
#' @importFrom grDevices rgb
#' @importFrom graphics abline axis par plot
#' @export
#'
#'
#' @examples
#' data(example_activity_data)
#' count1 = c(t(example_activity_data$count[1,-c(1,2)]))
#' wear1 = c(t(example_activity_data$wear[1,-c(1,2)]))
#' plot_profile(x=count1, w=wear1, title = "Example")
#'
#'



plot_profile = function(
  x,
  w,
  title = NULL,
  cex.main = 1,
  cex.sub = 2,
  cex.lab = 1,
  at.y = NULL,
  cex.xaxis = 1,
  cex.yaxis = 1,
  oma = c(1,1,1,1),
  mar = c(4, 4, 2, 1)
){
  breaks = c(1,181,361,541,721,901,1081,1261,1440)
  lab = c("00:00","03:00","06:00", "09:00","12:00","15:00","18:00","21:00","00:00")

  par(mar = mar)
  par(oma = oma)
  plot(x, type = "h",  col = "deepskyblue3", main = title,
       yaxt = "n", xaxt = "n", xlab = "", ylab = "AC",
       cex.main = cex.main, cex.sub = cex.sub, axes = F,cex.lab = cex.lab)
  if(!missing(w)){
    ind.nonwear = which(w == 0)
    ind.wear = which(w == 1)
    abline(v = ind.wear, col = rgb(0, 191, 255, 30, maxColorValue = 255))
    abline(v = ind.nonwear, col = rgb(200, 34, 34, 10, maxColorValue = 255))
  }
  axis(side = 1, at = breaks, labels = lab, cex.axis = cex.xaxis)
  axis(side = 2, at = at.y, cex.axis = cex.yaxis)
  abline(v = breaks, col = "azure4",lty = 3, lwd = 0.6)

}