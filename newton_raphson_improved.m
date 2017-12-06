function [ ] = newton_raphson_improved( func, diff, decimal, initial_est, maxiterations)
%Author : Satyajit Ghana
% USAGE : newton_raphson_improved(@(x) f(x), @(x) f'(x), decimal_accuracy, initial_estimate, maxiterations)
%This function makes us of the Newton-Raphson method to estimate the
%Root of the funtion f(x) and prints the value of x and its error at each
%iteration
%
%if maxiterations is not passed as argument then maxiterations is taken as 1000

if nargin < 5
    maxiterations = 1000;
end
x = initial_est;
tolerance = 10^(-decimal);
%tolerance = 10^-100;
fprintf('%10s%10s%25s\n','Iteration','Root','Error');
for i=1:maxiterations
    %check if the tangent is parallel to x axis
    if abs(diff(x(i))) < 10^-100
        fprintf('found f''(x) = 0, try a better initial guess, i can''t compute it further\n');
        break;
    end
    %find the next approximate value of x
    x(i+1) = x(i) - func(x(i))/diff(x(i));
    abs_error(i+1) = abs((x(i+1)-x(i))/x(i+1))*100;
    if (abs(x(i+1)-x(i)) < tolerance)
        fprintf('%10d%25.20f%15.8f%s\n',i,x(i+1),abs_error(i+1),'%');
        fprintf('\nRoot has converged at %dth iteration with at least %d decimal precision for the function : \n',i,decimal);
        disp(func);
        fprintf('x = %.53f\n',x(i+1));
        break;
    else 
        fprintf('%10d%25.20f%15.8f%s\n',i,x(i+1),abs_error(i+1),'%');
    end
end
%X = linspace(0,0.1,10000);
%Y = func(X);
%plot(X,Y,'b',x(i+1),0,'*','LineWidth',1.5);
%grid on;
%hold on;
%title('Newton-Raphson method to estimate root of f(x)');
%text(x(i+1),0,'\leftarrow root');
%legend('f(x)');
xlim1=x(i+1)-2*x(i+1);
xlim2=x(i+1)+2*x(i+1);
fplot(func,[xlim1 xlim2 ]);
hold on;
grid on;
plot(x(i+1),0,'*');
title('Newton-Raphson method to estimate root of f(x)');
text(x(i+1),0,'\leftarrow root');
legend('f(x)');
end

