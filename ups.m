function upsx = ups(x,N)
len_x = length(x);
upsx = zeros(1,(N*len_x-(N-1)));
upsx(1:N:N*len_x) = x;
end