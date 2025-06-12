% Read the original image
originalImage = imread('cameraman.tif');  

% Convert to grayscale if it's RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Convert to double and normalize (0 to 1)
doubleImage = im2double(grayImage);

% Define gamma values to test
gammaValues = [0.4, 0.7, 1.0, 1.5, 2.5];

% Create figure for original and transformed images
figure;

% Show original image
subplot(2, ceil((length(gammaValues) + 1)/2), 1);
imshow(grayImage);
title('Original Image');

% Apply power-law transformation for each gamma
for i = 1:length(gammaValues)
    gamma = gammaValues(i);
    transformedImage = doubleImage .^ gamma;

    % Normalize and convert to image format
    transformedImage = mat2gray(transformedImage);
    
    % Display the transformed image
    subplot(2, ceil((length(gammaValues) + 1)/2), i + 1);
    imshow(transformedImage);
    title(['\gamma = ', num2str(gamma)]);
end
