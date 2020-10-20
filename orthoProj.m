    function [output] = orthoProj(A, B)
    for j = 1: size(A,2)
        ouptut(:,j) = (dot(B(:),A(:,j))) / norm(A(:,j))^2;
    end
end