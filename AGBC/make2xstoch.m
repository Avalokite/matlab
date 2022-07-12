function make2xstoch(ra, rb)

if nargin<1
    ra = randi(90)
    rb = randi(90)
end

a = pi/2 * ra/90;
b = pi/2 * rb/90;

%reminder: cos(x) = sin(pi/2 - x)
%probability amplitudes (i.e. square roots of probabilities)
y1n2 = cos(a)*cos(b);
n2y1 = sin(a+b)*cos(b);
n1y2 = sin(a)*cos(b);
y2n1 = cos(a+b)*cos(b);
y1y2 = cos(a)*sin(b);
y2y1 = sin(a+b)*sin(b); 
n2n1 = cos(a+b)*sin(b);
n1n2 = sin(a)*sin(b);

%chi-square tables of each question order
chisq1 = [y1y2 y1n2; n1y2 n1n2].^2

chisq2 = [y2y1 n2y1; y2n1 n2n1].^2

chisq3 = (chisq1 + chisq2).*.5

%check unity 
% [sum(sum(chisq1)) sum(sum(chisq2))] 

%check QQ-Equalities
% [y1y2^2 + n1n2^2 y2y1^2 + n2n1^2]
% [y1n2^2 + n1y2^2 n2y1^2 + y2n1^2]
end
