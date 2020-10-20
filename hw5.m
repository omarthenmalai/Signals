load fisheriris
F = [];
for i = 1:150
    f = Flower(meas(i,1), meas(i,2), meas(i,3), meas(i,4), strtrim(species{i}));
    F = [F, f];
end

sepal_length_25 = getSLength(F(25))
sepal_length_25 == meas(25,4)


report(F(1))