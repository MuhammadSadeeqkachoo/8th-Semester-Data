% Read the original image
originalImage = imread('cameraman.tif'); 

% Convert to grayscale if it's RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Convert image to double for log transformation
doubleImage = im2double(grayImage);

% Apply log transformation
c = 1; % Scaling constant (can adjust to enhance effect)
logImage = c * log(1 + doubleImage);

% Normalize to 0-1 for display
logImage = mat2gray(logImage);

% Display original and log-transformed image
figure;

subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(logImage);
title('Log-Transformed Image');
