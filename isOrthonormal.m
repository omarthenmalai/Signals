function output = isOrthonormal(A)
    diagonal = diag(A.'*A);
    if diagonal - ones(size(diagonal,1)) < 0.0001
        output = 1;
    else
        output = 0;
    end
end