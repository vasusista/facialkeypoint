load('shrunkdata.Rd')
library(neuralnet)

#colnames(im.train) <- colnames(im.train, do.NULL = FALSE, prefix="c")
traininginput <- im.train
#traininginput <- cor(im.train, im.train[1,2])
trainingoutput <- d.train


trainingdata <- cbind(traininginput,trainingoutput)
input <- colnames(traininginput)
output <- colnames(trainingoutput)
#print(input[1])

N <- 576

olabel <- as.formula(paste('left_eye_center_x+left_eye_center_y+right_eye_center_x+right_eye_center_y+left_eye_inner_corner_x+left_eye_inner_corner_y+left_eye_outer_corner_x+left_eye_outer_corner_y+right_eye_inner_corner_x+right_eye_inner_corner_y+right_eye_outer_corner_x+right_eye_outer_corner_y+left_eyebrow_inner_end_x+left_eyebrow_inner_end_y+left_eyebrow_outer_end_x+left_eyebrow_outer_end_y+right_eyebrow_inner_end_x+right_eyebrow_inner_end_y+right_eyebrow_outer_end_x+right_eyebrow_outer_end_y+nose_tip_x+nose_tip_y+mouth_left_corner_x+mouth_left_corner_y+mouth_right_corner_x+mouth_right_corner_y+mouth_center_top_lip_x+mouth_center_top_lip_y+mouth_center_bottom_lip_x+mouth_center_bottom_lip_y ~', paste(input[1:N], collapse="+"))) 

nn <- neuralnet(olabel, data = trainingdata, hidden=1, threshold=0.01,linear.output=TRUE)
print(nn)

