% Read the grayscale image
originalImage = imread('cameraman.tif');  

% Convert to grayscale if it's RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Apply Laplacian filter
laplacianKernel = fspecial('laplacian', 0.2);  % Default alpha = 0.2
laplacianFiltered = imfilter(double(grayImage), laplacianKernel, 'replicate');

% Enhance image by adding Laplacian (sharpening)
sharpenedImage = double(grayImage) - laplacianFiltered;

% Normalize to display
sharpenedImage = uint8(mat2gray(sharpenedImage) * 255);
laplacianFiltered = mat2gray(laplacianFiltered);

% Display results
figure;

subplot(1, 3, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 3, 2);
imshow(laplacianFiltered, []);
title('Laplacian Filtered (Edges)');

subplot(1, 3, 3);
imshow(sharpenedImage);
title('Sharpened Image');
