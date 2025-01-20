% Parameters
m = 1;  % Mass of Chaser (assume or define)
I = 0.1;  % Moment of inertia

% State-space matrices
A = [0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     0 0 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 0];

B = [0 0 0;
     0 0 0;
     0 0 0;
     1/m 0 0;
     0 1/m 0;
     0 0 1/I];

C = eye(6);  % Identity matrix to output all states
D = zeros(6, 3);  % No direct feedthrough

% Create state-space system
sys = ss(A, B, C, D);

% Display system
disp(sys);

