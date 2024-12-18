clc; 

% The given reference point is:
qr = 0.3;

% Since I will be solving the differential equations of error
% We need the initial conditions of error

% assumning we start form q0 = 4 
% Since we have no initial velocities to mentioned  I'll take them as 1 
IC = [4,1,0];
tspan = [0:0.01:20];

% Computing the variation of error in 50 seconds
[t,y]=ode45(@srobdyn,tspan,IC);

% Storing the errors
zai = y(:,3);




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
ylabel('Coordinate (meters)');
xlabel('time (sec)');
title('Coordinate variations with time');

% The general coordinates variation wrt time
figure(2)
plot(t,y(:,2));
ylabel('Velocity (meters/sec)');
xlabel('time (sec)');
title('Velocity variation with time');

% The velocities variation wrt time
figure(3)
plot(t,y(:,3));
ylabel('ξ (meters/sec)');
xlabel('time (sec)');
title('ξ variation with time');
