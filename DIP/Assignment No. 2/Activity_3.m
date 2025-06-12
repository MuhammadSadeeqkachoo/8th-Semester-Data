% Read the grayscale image
originalImage = imread('cameraman.tif'); 
% Convert to grayscale if RGB
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Display original image
figure;
subplot(3, 3, 1);
imshow(grayImage);
title('Original Image');

% Extract and display all 8 bit planes
for bit = 1:8
    % Extract the bit plane
    bitPlane = bitget(grayImage, bit);  % bit = 1 is LSB, bit = 8 is MSB
    
    % Display the bit plane
    subplot(3, 3, bit + 1);
    imshow(logical(bitPlane));
    title(['Bit Plane ', num2str(bit - 1)]);
end
