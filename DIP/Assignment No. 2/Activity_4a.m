% Read an image (grayscale or convert it)
originalImage = imread('cameraman.tif'); 
% Convert to grayscale if RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Display original image
figure;
subplot(2, 3, 1);
imshow(grayImage);
title('Original Image');

% ---- 1. Moving Average Filter (3x3) ----
averageKernel = fspecial('average', [3 3]);
avgFiltered = imfilter(grayImage, averageKernel, 'replicate');
subplot(2, 3, 2);
imshow(avgFiltered);
title('3×3 Moving Average Filter');

% ---- 2. Median Filter (3x3) ----
medianFiltered = medfilt2(grayImage, [3 3]);
subplot(2, 3, 3);
imshow(medianFiltered);
title('Median Filter (3×3)');

% ---- 3. Min Filter (3x3) ----
minFiltered = ordfilt2(grayImage, 1, true(3));
subplot(2, 3, 4);
imshow(minFiltered);
title('Min Filter (3×3)');

% ---- 4. Max Filter (3x3) ----
maxFiltered = ordfilt2(grayImage, 9, true(3));
subplot(2, 3, 5);
imshow(maxFiltered);
title('Max Filter (3×3)');

% Optional: Difference image (background enhancement)
backgroundEnhanced = imsubtract(maxFiltered, minFiltered);
subplot(2, 3, 6);
imshow(backgroundEnhanced, []);
title('Max - Min (Background Features)');
