clc
clear all
%Steps 3-12 takes input from user
L=input('Length(in m)=');
H=input('Height(in m)=');
n_x=input('No of Grid points in x-direction=');
n_y=input('No of Grid points in y-direction=');
disp ('Enter the boundary conditions')
T(n_y,2:n_x-1)=input('At y=0,T(in degree Celsius)=');
T(2:n_y-1,1)=input('At x=0,T(in degree Celsius)=');
T(1,2:n_x-1)=input('At y=H,T(in degree Celsius)=');
T(2:n_y-1,n_x)=input('At x=L,T(in degree Celsius)=');
EL=input('Enter the limit of error(in %)=')
%Steps 14-29 Computation
delta_x=L/(n_x-1);
delta_y=H/(n_y-1);
Max_E=EL+1;
while Max_E>EL
i=n_y-1;
 while i>1
 for j=2:n_x-1
 T_old=T(i,j);
 T(i,j)=(((delta_y)^2)*(T(i-1,j)+T(i+1,j))+((delta_x)^2)*(T(i,j-1)+T(i,j+1)))/(2*((delta_x)^2+(delta_y)^2));
 T_new=T(i,j);
 E(i,j)=abs(100*(T_new-T_old)/T_new);
 end
 i=i-1;
 end
 Max_E=max(max(E)); %Finds the element with max error
end
%Displaying results
disp('Temperatures in degree celsius are as follows')
T
