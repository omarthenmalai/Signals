function splane(b,a)
    poles = roots(a);
    poles_real = real(poles);
    poles_imag = imag(poles);
  
    zeros = roots(b);
    zeros_real = real(zeros);
    zeros_imag = imag(zeros);
    hold on
    plot(poles_real,poles_imag,'x');
    plot(zeros_real,zeros_imag,'o');
    hold off
    axis('equal');
    grid on
    xlabel('Real');
    ylabel('Imaginary');
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %x-axis
    line(xL, [0 0]);  %y-axis
end