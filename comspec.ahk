Run %comspec% cd %A_SCRIPTDIR%
Run %comspec% "convert -crop 100%x50% *.jpg cropped_%d.jpg && convert +append cropped_0.jpg cropped_1.jpg combined.jpg"

;run %comspec% "convert -crop 100%x50% *.jpg cropped_%d.jpg && convert +append cropped_0.jpg cropped_1.jpg combined.jpg"
exitapp
