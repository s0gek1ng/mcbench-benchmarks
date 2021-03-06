% This is material illustrating the methods from the book
% Financial Modelling  - Theory, Implementation and Practice with Matlab
% source
% Wiley Finance Series
% ISBN 978-0-470-74489-5
%
% Date: 02.05.2012
%
% Authors:  Joerg Kienitz
%           Daniel Wetterau
%
% Please send comments, suggestions, bugs, code etc. to
% kienitzwetterau_FinModelling@gmx.de
%
% (C) Joerg Kienitz, Daniel Wetterau
% 
% Since this piece of code is distributed via the mathworks file-exchange
% it is covered by the BSD license 
%
% This code is being provided solely for information and general 
% illustrative purposes. The authors will not be responsible for the 
% consequences of reliance upon using the code or for numbers produced 
% from using the code.

function y = sprice_5(a, b, r, n, f, k, t, kl, ku, mu, cl, bl,al, nu, cu,bu,au, cp)
% sabr prices using the risk neutral density psabr_4 
% and integrating this density with respect to the payoff
% the density psabr_5 takes all parameters as input and does not calcualte
% the parameters internally

eps = 0.001;
nl = length(k);
y = ones(1,nl);

rr = 0:eps:.5;

F1 = @(x) x .* psabr_5(a, b, r, n, f, x, t, kl, ku, mu, cl, bl,al, nu, cu,bu,au);
F2 = @(x) psabr_5(a, b, r, n, f, x, t, kl, ku, mu, cl, bl,al, nu, cu,bu,au);

y1 = F1(rr);
y2 = F2(rr);

y1 = cumsum(y1(end:-1:1)); y1 = y1(end:-1:1);
y2 = cumsum(y2(end:-1:1)); y2 = y2(end:-1:1);

    % call
for j = 1:nl;
    index = find(rr>=k(j),1,'first');
    y(j) = eps*(y1(index) - k(j) * y2(index));
end
    
if (cp ~= 1)
     y = k - f + y;
end    

end