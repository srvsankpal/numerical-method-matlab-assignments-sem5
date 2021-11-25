function [X] = GJ(CM,n)
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
for i = 1:n
 CM(i,:) = CM(i,:)/CM(i,i);
 if i<n
 for j=1:n-i
 CM(i+j,:)=CM(i+j,:)-CM(i+j,i)*CM(i,:);
 end
 end
end
for i=1:n-1
 if i<n
 for j=1:n-i
 CM(i,:) = CM(i,:)-CM(i,i+j)*CM(i+j,:);
 end
 end
end
CM(:,n+1)
end
