function [H, err,decade_below, decade_above, octave_below, octave_above] = mag(q)
    a = [1,1/q,1];
    b = [1];
    w = logspace(-1,1,1000);
    H = freqs(b,a,w);
    H = mag2db(abs(H));
    
    % Get the values for the asymptote graph
    left = 20*log10(1);
    mid = left;
    right = left-40;
    asymp = [left,mid,right];
    w2 = [0.1,1,10];
    
    % Graph the actual and predicted responses
    figure;
    semilogx(w,H);
    hold on
    semilogx(w2,asymp);
    hold off
    grid on
    str = 'Actual and Predicted Magnitude Responses for Q = ';
    str = strcat(str, int2str(q));
    title(str)
    legend('Actual Magnitude Response', 'Bode Plot Predicted Magnitude Response')
    
    % difference between the value of actual and predicted at w=1
    err = H(500) - mid;
    
    % Compare the values one decade above/below and one octave above/below
    % the corner
    decade_below = H(1) - left;
    decade_above = H(1000) - right;
    octave_below = H(350) - left;
    octave_above = H(650) - (mid-12);

end