% Clear environment
clc; clear; close all;

% Load grayscale image
img = imread('cameraman.tif'); 
img = im2double(img);
[M, N] = size(img);

% Fourier Transform
F = fft2(img);
F_shifted = fftshift(F);

% Set cutoff frequency
D0 = 50;

% Create meshgrid
u = 0:(M-1);
v = 0:(N-1);
u = u - floor(M/2);
v = v - floor(N/2);
[U, V] = meshgrid(v, u);
D = sqrt(U.^2 + V.^2);

% Ideal Highpass Filter
H_ideal = double(D > D0);

% Butterworth Highpass Filter (order = 2)
n = 2;
H_butter = 1 ./ (1 + (D0 ./ D).^(2 * n));

% Gaussian Highpass Filter
H_gauss = 1 - exp(-(D.^2) ./ (2 * D0^2));

% Apply filters in frequency domain
G_ideal = F_shifted .* H_ideal;
G_butter = F_shifted .* H_butter;
G_gauss = F_shifted .* H_gauss;

% Inverse FFT
img_ideal = real(ifft2(ifftshift(G_ideal)));
img_butter = real(ifft2(ifftshift(G_butter)));
img_gauss = real(ifft2(ifftshift(G_gauss)));

% Display results
figure;
subplot(1,2,1), imshow(img, []), title('Original Image');
subplot(1,2,2), imshow(log(1+abs(F_shifted)), []), title('Original Spectrum');

figure;
subplot(1,2,1), imshow(img_ideal, []), title('IHPF Output');
subplot(1,2,2), imshow(log(1+abs(G_ideal)), []), title('IHPF Spectrum');

figure;
subplot(1,2,1), imshow(img_butter, []), title('BHPF Output');
subplot(1,2,2), imshow(log(1+abs(G_butter)), []), title('BHPF Spectrum');

figure;
subplot(1,2,1), imshow(img_gauss, []), title('GHPF Output');
subplot(1,2,2), imshow(log(1+abs(G_gauss)), []), title('GHPF Spectrum');
