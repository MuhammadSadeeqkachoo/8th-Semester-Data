% Read the image
originalImage = imread('cameraman.tif'); 

% Convert to grayscale if RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Convert to double for calculations
grayImageDouble = double(grayImage);

% Define slicing range (intensity values between 0–255)
low = 80;
high = 160;

% Method 1: Highlight range, keep background
slice1 = grayImage;  % Copy of original
slice1(grayImage >= low & grayImage <= high) = 255;

% Method 2: Highlight range, suppress background
slice2 = zeros(size(grayImage));
slice2(grayImage >= low & grayImage <= high) = 255;

% Display results
figure;

subplot(1, 3, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 3, 2);
imshow(slice1);
title('Gray-Level Slicing (with background)');

subplot(1, 3, 3);
imshow(slice2);
title('Gray-Level Slicing (without background)');
