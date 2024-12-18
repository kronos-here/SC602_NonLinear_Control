clc; 
% The given constants are:
m1 = 2.5;
m2 = 1.5;
l  = 0.4;
kp = eye(2);

% The given reference point is:
qr = [0.4,0]';

% Since I will be solving the differential equations of error
% We need the initial conditions of error

% assumning we start form q(6,4) then error starts from:
q0 = [6,4]';
err = qr- q0;

% Since we have no initial velocities to mentioned  I'll take them as 0. 
IC_err = [err(1),err(2),0,0];
tspan = [0:0.01:50];

% Computing the variation of error in 50 seconds
[t,y]=ode45(@robdyn,tspan,IC_err);

% Storing the errors
e=[y(:,1), y(:,2)];

% Since error = qr - q  =>  q = qr - error
q=[qr(1) - e(:,1), qr(2) - e(:,2)];

gr=9.81;
g=gr*[l*(m1+m2)*cos(q(:,1))+l*m2*cos(q(:,1)+q(:,2)), l*m2*cos(q(:,2))];
u=g'-kp*[y(:,1),y(:,2)]'-[y(:,3),y(:,4)]';


%% Plot settings

set(groot,'defaultLineLineWidth',1.5)
set(0,'DefaultaxesLineWidth', 1)
set(0,'DefaultaxesFontSize', 12)
set(0,'DefaultTextFontSize', 12)
set(0,'DefaultaxesFontName', 'arial');
set(0,'defaultAxesXGrid','on');
set(0,'defaultAxesYGrid','on');

% The error curves
figure(1)
plot(t,y(:,1));
hold
plot(t,y(:,2));
ylabel('Error (meters)');
xlabel('time (sec)');
title('Error vs time');

% The general coordinates variation wrt time
figure(2)
plot(t,q);
ylabel('General Coordinates (meters)');
xlabel('time (sec)');
title('Coordinate variation with time');

% The velocities variation wrt time
figure(3)
plot(t,-y(:,3));
hold
plot(t,-y(:,4));
ylabel('Velocities (meters/sec)');
xlabel('time (sec)');
title('Velocities variation with time');

% 
figure(4)
plot(t,u);
ylabel('Torque (kg m^2/s^2)');
xlabel('Time (s)');
title('Control Effort (u) vs time');

