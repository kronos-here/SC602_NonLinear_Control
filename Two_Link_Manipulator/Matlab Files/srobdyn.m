function dydt= srobdyn(t,y)

% Assigning the initial conditions as provided
e    = y(1);
edot = y(2);
zai  = y(3);

% My roll number is 213230011 the last digit is 1
% The corrrosponding constants are: 
p1 = 1003/300;
p3 = 0.1625;

% control v from backstepping
tau = -3*edot - (zai+e+edot) - (zai + p3*(sin(e+0.3)*edot)) / (p1+2*p3*cos(e+0.3)) ;
M  = p1+2*p3*cos(e+0.3);
C  = -1*p3*sin(e+0.3)*edot;

% The second order differential eq:
eddot = (1/M)*(zai - C*edot);

% The return format
dydt = [edot;eddot;tau];