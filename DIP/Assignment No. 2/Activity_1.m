% Read the original image
originalImage = imread('cameraman.tif'); 

% Convert to grayscale if it's RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Convert to double and normalize
I = im2double(grayImage);

% Define control points for piecewise linear transformation
% These points define how intensity values are mapped
r1 = 0.2; s1 = 0.1;
r2 = 0.7; s2 = 0.9;

% Apply piecewise linear transformation
J = zeros(size(I));
for i = 1:size(I,1)
    for j = 1:size(I,2)
        r = I(i,j);
        if r < r1
            J(i,j) = (s1/r1) * r;
        elseif r <= r2
            J(i,j) = ((s2 - s1)/(r2 - r1)) * (r - r1) + s1;
        else
            J(i,j) = ((1 - s2)/(1 - r2)) * (r - r2) + s2;
        end
    end
end

% Display results
figure;

subplot(1, 2, 1);
imshow(I);
title('Original Image');

subplot(1, 2, 2);
imshow(J);
title('Contrast Stretched Image');
