function [m, A, Eigenfaces] = EigenfaceCore(T)
% Calculating the mean image 
% mean(T,2) because we need to take mean row wise in aa column vector
m = mean(T,2); 
Train_Number = size(T,2);

% Calculating the mean centered images
A = [];  
for i = 1 : Train_Number
% Computing the difference image for each image in the training set Ai = Ti - m
    temp = double(T(:,i)) - m; 
% Merging all centered images
    A = [A temp]; 
end

% Snapshot method of Eigenface methos
L = A'*A; % L is the surrogate of covariance matrix C=A*A'.
% Diagonal elements of D are the eigenvalues for both L=A'*A and C=A*A'.
[V D] = eig(L); 
% Sorting and eliminating eigenvalues
% All eigenvalues of matrix L are sorted and those who are less than a  specified threshold, are eliminated. 
% So the number of non-zero eigenvectors may be less than (P-1).
L_eig_vec = [];
for i = 1 : size(V,2)  
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end
% Calculating the eigenvectors of covariance matrix 'C'
Eigenfaces =  A*L_eig_vec ;
end