library(doParallel)

coord_x <- paste(coord, "x", sep="_")
coord_y <- paste(coord, "y", sep="_")
patches <- foreach (i = 1:nrow(d.train), .combine=rbind) %do% {
    im  <- matrix(data = im.train[i,], nrow=96, ncol=96)
    x   <- d.train[i, coord_x]
    y   <- d.train[i, coord_y]
    x1  <- (x-patch_size)
    x2  <- (x+patch_size)
    y1  <- (y-patch_size)
    y2  <- (y+patch_size)
    if ( (!is.na(x)) && (!is.na(y)) && (x1>=1) && (x2<=96) && (y1>=1) && (y2<=96) )
    {
        as.vector(im[x1:x2, y1:y2])
    }
    else
    {
        NULL
    }
}
mean.patch <- matrix(data = colMeans(patches), nrow=2*patch_size+1, ncol=2*patch_size+1)


image(1:25, 1:25, mean.patch[25:1,25:1], col=gray((0:255)/255))