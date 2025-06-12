% Read the original image
originalImage = imread('cameraman.tif'); 
figure;
imshow(originalImage);
title('Original Image');

% Convert to grayscale if the image is RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Define a threshold value (0 to 255 for uint8 images)
thresholdValue = 100;

% Apply thresholding
binaryImage = grayImage > thresholdValue;

% Display the thresholded image
figure;
imshow(binaryImage);
title(['Thresholded Image (Threshold = ', num2str(thresholdValue), ')']);
