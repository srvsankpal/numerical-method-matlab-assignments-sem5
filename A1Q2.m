%Steps 2-13 takes input from user
n=input('Enter number of masses=');
disp 'Enter masses(in kg)'
for i = 1:n
 fprintf('%0.0f ' , i)
 m(i)=input('Mass=');
end
disp 'Enter Spring stiffnesses(in N/m)'
for i = 1:n
 fprintf('%0.0f ' , i)
 k(i)=input('Spring Stiffness=');
end
g=input('Acceleration due to gravity(g)(in m/s^2)=');
%Steps 15-26 forms the Augmented Matrix
for i = 1:n-1
 A(i,i)=k(i)+k(i+1);
 A(i+1,i)=-1*k(i+1);
end
A(n,n)=k(n);
for i = 1:n
 for j = 1:n
 A(i,j)=A(j,i);
 end
end
B=g*m';
CM=[A,B];
GJ(CM,n) %Computes displacements using Gauss-Jordan Method