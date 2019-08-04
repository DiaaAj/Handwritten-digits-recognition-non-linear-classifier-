# Handwritten digits recognition with a non-linear classifire (PCA + quadratic classifier).

I used 40 Principal components (optimal number of principle components) with my algorithm then I mapped my features into a quadratic function.
The same principal components of the training set were applied on both the cross validation set and test set.  
before using PCA I scaled the data into value between 0-1.

Error rate is 2.2 (97.80% accuracy) dataset used is MNIST (60,000 training examples and 10,000 test examples).

I have other different linear classifier model with error rate of 8.4 (91.6% accuracy).

refrences:-

Dataset http://yann.lecun.com/exdb/mnist/

linear classifier model https://github.com/DiaaAj/Handwritten-digit-recognition-linear-classifier-