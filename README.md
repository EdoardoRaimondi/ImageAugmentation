# ImageAugmentation techniques for machine learning

This work allows an access to a set of image augmentation techniques. These techniques are not limited to 
simply flipping or rotation, but they include also more sophisticated approaches. These approach provide a little
increment of accuracy on test set, with a relative substantial increase in computational effort.

To use them, call the method whenever necessary based on the image augmentation structure in use. For better 
performance, on-fly-augmentation is recommended. 

Only RGB images are handled.

# Methods

# Sinusoidal
Deform the image following a sinusoidal function. In this specific case, a sin function.
# Elastic_deformation
Apply a guassian based filter on the image and interpolate it.
# Gaussian noise
Apply a gaussian noise on the image.
# Crop_image
Crop the image.
# To_gray
From an RGB to a scale of gray image
# Salt_pepper_noise:
Add bright pixel on dark zones and vice versa.
# Saturation
Add 20% saturation on the image.
# Add_contrast
Add contrast to the image.
# Blur
Add blur to the image.
# Method1
Random black pixel setting on DCT image.
# Method2
Disturbance of DCT image.
# Method3
Random switch of elements on DCT image.
# Pattern synthesis methods 
It is provided a set of methods in order to create a new set of pattern. 
The process consists of 3 steps:
 1) Vectoritation of the patterns involved in the training set. Quantity is choosen by the developer.
 2) For each vector, find the more similar.
 3) Merge the vectors chosen at step 2.
 
The methods available for these steps are 
 - color_vectoritation: transform RGB image to a vector based on its colour distribution.
 - texture_vectoritation: transform RGB image to a vector based on its LBP.
 - similarity: define a cosin similarity between two vectors.
 - euclidean_d: define euclidean distance between two vectors.
 - fusion: switch randomic color plane of two input RGB image.

 Pattern synthesis has to be implemented using these methods directly on the data augmentation process, in order
 to allow more degrees of freedom.

Fusion of various methods provides an increment of ability to generalize of the net.
AlexNet has been used for testing.


