function [X, Y] = generateData(N)

X = (-1) + (2).*rand(N,2);       %generate a data set of N*2 dimension with values between -1 and 1
Y = [];

x1 = (-1) + (2).*rand(1,1);      %generate two points for a random line in the plane
y1 = (-1) + (2).*rand(1,1);
x2 = (-1) + (2).*rand(1,1);
y2 = (-1) + (2).*rand(1,1);


%equation of line in form of y = m*x + n
xlim = [-1,1];
m = (y2-y1)/(x2-x1);
n = y2 - x2*m;


for i = 1:N
    px = X(i,1);
    py = X(i,2);

    %check which side of the line does the point(px,py) lies
    label = sign((m*px + n - py)/(sqrt(m*m + 1)));
    
    Y = [Y label]; %create a corresponding label vector depending on the position with respect to the line
    
end
