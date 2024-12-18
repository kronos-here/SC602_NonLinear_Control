clc; 

% Initial conditions
r0 = [-0.02, 0, 0.045];
w0 = [0.004 -0.007 0.017];

IC = [r0(1),r0(2),r0(3),w0(1),w0(2),w0(3)];
tspan = [0:0.01:200];

% Computing the variation of error in 500 seconds
[t,y]=ode45(@RBD,tspan,IC);

% Storing the errors
r = [y(:,1), y(:,2), y(:,3)];
w = [y(:,4), y(:,5), y(:,6)];

v = -1 * w; 
len = length(t);
term2 = zeros(len,3);

for c = 1:len
    % Extracting the rho vectors for every unit of time
    r_slice = r(c,:)';
    r_cross = [0, -r_slice(3), r_slice(2); r_slice(3), 0, -r_slice(1); -r_slice(2), r_slice(1), 0]; 
    k = (1+dot(r_slice,r_slice));
    z = (2/k)*((r_slice') + (r_slice')*r_cross + (r_slice')*(r_slice*(r_slice')))';
    
    % This storing technique takes care of the Transposing
    for m = 1:3
        term2(c,m) = z(m);
    end    
end

% The control according to the equation will be
u = v - term2; 

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
hold on
plot(t,y(:,2));
hold on
plot(t,y(:,3));
hold off
ylabel('Rho');
xlabel('time (sec)');
title('Rho vs time');


% The velocities variation wrt time
figure(2)
plot(t,y(:,4));
hold on
plot(t,y(:,5));
hold on
plot(t,y(:,6));
hold off
ylabel('w');
xlabel('time (sec)');
title('w variation with time');

% The control variation wrt time
figure(3)
plot(t,u(:,1));
hold on
plot(t,u(:,2));
hold on
plot(t,u(:,3));
hold off
ylabel('Control input (u)');
xlabel('time (sec)');
title('Control variation with time');
