# R code fragments used in talk
# Boxplots and Outliers
# Kansas City R Users Group - Beginner's Workshop
# Earl F Glynn, 4 Oct 2014

set.seed(19)

x <- rnorm(11)
x
sort(x)

min(x)
mean(sort(x)[3:4])
median(x)
mean(sort(x)[8:9])
max(x)

quantile(x, probs=seq(0,1,0.25))
fivenum(x)

sort(x)

fivenum(x)

boxplot(x, col="skyblue", main="Boxplot")
boxplot.stats(x)

x[3] <- 20  # Introduce outlier
sort(x)
fivenum(x)  # Shows new max
boxplot(x, col="skyblue", main="Boxplot with Outlier")
boxplot.stats(x)


coef <- 1.5  # default value

stats <- stats::fivenum(x, na.rm=TRUE)
stats

iqr <- diff(stats[c(2,4)])  # interquartile range
iqr

out <- x < (stats[2L] - coef*iqr) | x > (stats[4L] + coef*iqr)
which(out)

stats[c(1,5)] <- range(x[!out], na.rm=TRUE)  # update without outliers
stats


# Central tendency
set.seed(19)
x <- rnorm(11)
x
mean(x)
median(x)

x[3] <- 20  # Introduce outlier
mean(x)
median(x)

# Dispersion
set.seed(19)
x <- rnorm(11)
x
sd(x)
diff(boxplot.stats(x)$stats[c(2,4)])  # IQR

x[3] <- 20  # Introduce outlier
sd(x)
diff(boxplot.stats(x)$stats[c(2,4)])  # IQR


# Statistics:  An introduction using R by Michael J. Crawley, p. 297.

set.seed(11)

plotboxes <- function(N)
{

  a <- rnorm(N, mean=0.00, sd=1)
  b <- rnorm(N, mean=0.00, sd=1)
  c <- rnorm(N, mean=0.50, sd=1)
  d <- rnorm(N, mean=1.00, sd=1)
  e <- rnorm(N, mean=1.50, sd=1)
  f <- rnorm(N, mean=2.00, sd=1)

  boxplot(data.frame(a,b,c,d,e,f),
    notch=TRUE, main=paste("N = ", N))

}

par(mfrow=c(1,2))
plotboxes(50)
plotboxes(100)

