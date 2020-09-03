# Devanagari-Numerals-Detection-using-ANN


This code is nothing but Devanagari Numerals detection using Artificial Neural Network (ANN),
where 500 images are there for training in which total 10 classes are there with 50 images individually and 150 images are there for testing.

1. preprocess.m - This file is having code of preprocessing in which binariazation, dilation and thinning processes is done.This file can be refer for checking which processes are done before applying to model i.e. kind of feature.

2. training.m - This function is written for training of the data in which training folder and file format of image is given which  can be change by user convenience. HERE 70% of data is used for training and 30 is for Testing and validation. Using patternnet this model is getting trained, Euclidean distance is used for feature mapping.

3. testing.m -  This file contains code in which all the preprocessing is done and a euclidean distance is calulated and then this will use for feature mapping with trained model.

4. gui_sign.m - This file is nothing but a GUI file which is created using MATLAB only by putting "GUIDE" command in command line and then drawing as per requirement GUI is created and then TRAINING & TESTING files are interconnected to this GUI by adding some code into this code(line 83-91).

This is the main code which need to be RUN.

5. confmat.m - This file contains code of Confusion Matrix in which for demonstration purpose one 10x10 matrix is taken and using formula all the parameters are caluclated like Accuracy,precision and some others.
