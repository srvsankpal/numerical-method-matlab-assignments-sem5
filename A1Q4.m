n=input('Enter the number of points=');
disp 'Enter the coordinates of points:'
%Steps 3-10 takes coordinates of points from user
for i=1:n
 fprintf('x coordinate of ')
 fprintf('%0.0f ', i)
 pt(i,1)=input('Point=');
 fprintf('y coordinate of ')
 fprintf('%0.0f ', i)
 pt(i,2)=input('Point=');
end
x=pt(:,1);
y=pt(:,2);
%Steps 15-20 forms the augmented matrix
for i=1:n
 for j=1:n
 CM(i,j) = x(i)^(n-j);
 end
 CM(i,j+1)=y(i);
end
GJ(CM,n) %Computes p's using Gauss-Jordan Method