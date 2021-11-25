%Lines 2 to 9 taking input from user
disp('Enter the details asked')
D=input('Density(in kg/m^3)=');
Vis=input('Dynamic Viscosity(in N.s/m^2)=');
d=input('Diameter(in m)=');
Q=input('Flow Rate(in m^3/s)=');
f_old=input('Initial Guess=');
M=input('Max no of iterations(Minimum value=1)=');
Es=input('Limit for approximation error=');
%Lines 11 to 13 computes Area(A),Velocity(v),Reynolds number(Re)
A=(pi*d^2)/4;
v=Q/A;
Re=(D*v*d)/Vis;
E=abs(Es)+1;
%Any approximation error value(E) greater than the limit for approximation error so that condition on line 18 is satisfied forthe 1st iteration
menu('Method of Computation','Fixed Iteration Method','Newton-RaphsonMethod');
if ans==1
%Steps 18-30 computes f using Fixed Iteration Method
 for i=1:M
 if abs(Es)<abs(E) %Condition of limiting approximation error
 f_new=1/(4*log10(Re*sqrt(f_old))-0.4)^2;
 E=100*(f_new-f_old)/f_new;
 f_old=f_new;
 else
 i=i-1;
 break
 end
 end
f=f_new
Iterations=i
Error=abs(E)
else
%Steps 33-47 computes f using Newton-Raphson Method
 for i=1:M
 if abs(Es)<abs(E)
 A=1/sqrt(f_old)-4*log10(Re*sqrt(f_old))+0.4; %A=f(f_old)
 B=-1/(2*f_old*sqrt(f_old))-2/(f_old*log(10)); %B=f'(f_old)
 f_new=f_old-A/B;
 E=100*(f_new-f_old)/f_new;
 f_old=f_new;
 else
 i=i-1;
 break
 end
 end
f=f_new
Iterations=i
Error=abs(E)
end
