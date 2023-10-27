%%
close all;
clear;
clc;

%% 2.1.a
% Testing myconv function against matlab's default conv
x = 1:2:10;
h = 1:5;
myconv(x,h)
conv(x,h)

%% 2.1.b
n = 0:200;
k = 50;
f = 1/k;

h = zeros(1, length(n)); % Integrator
h(1:10) = 0.1 * 1;

x = square(2 * pi * f * n) / 2 + 0.5;
y = myconv(h, x);

figure('Name', 'Integrator convolution');

subplot(2,1,1);
stem(n, x);
xlabel('n') ;
ylabel('x[n]') ;
title('Input Signal') ;
grid on ;

subplot(2,1,2);
stem(0:length(y) - 1, y);
xlabel('n') ;
ylabel('y[n]') ;
title('Output Signal') ;
grid on ;


%% 2.1.a
function y = myconv(h,x)
    M = length(h);
    L = length(x);
    N = M + L - 1;
    X = [x, zeros(1,M)];
    H = [h, zeros(1,L)];
    y = zeros(1, N);
    if(M > L)
        temp = X;
        X = H;
        H = temp;
    end
    for i = 1 : N
        for j = 1 : min(L, M)
            if (i - j + 1 > 0)
                y(i) = y(i) + H(j) * X(i - j + 1);
            end
        end
    end
end