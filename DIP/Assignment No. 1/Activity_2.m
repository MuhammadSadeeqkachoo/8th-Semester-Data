% Read the original image
originalImage = imread('cameraman.tif'); 

% Convert to grayscale if it's RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Negative transformation
negativeImage = 255 - grayImage;

% Display original and negative images
figure;
subplot(2, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(2, 2, 2);
imshow(negativeImage);
title('Negative Image');

% Plot histograms
subplot(2, 2, 3);
imhist(grayImage);
title('Histogram of Original Image');

subplot(2, 2, 4);
imhist(negativeImage);
title('Histogram of Negative Image');
