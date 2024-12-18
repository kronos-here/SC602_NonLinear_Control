function dydt= robdyn(t,y)

% Assigning the initial conditions as provided
e=[y(1),y(2)]';
edot=[y(3),y(4)]';

% My roll number is 213230011 the last digit is 1
% The corrrosponding constants are: 
p1 = 1003/300;
p2 = 0.118;
p3 = 0.1625;

% v need to be -phi()
v  = -1*[edot(1),edot(2)]';
kp = eye(2);

M  = [p1+2*p3*cos(e(2)), p2+p3*cos(e(2)); p2+p3*cos(e(2)), p2];
C  = p3*sin(e(2))*[-edot(2), edot(1)+edot(2); edot(1), 0];
D  = [5,1;1,5];

% The second order differential eq:
eddot = inv(M)*(v - C*edot - D*edot - kp*e); %#ok<MINV> 

% The return format
dydt = [edot(1);edot(2);eddot(1);eddot(2)];