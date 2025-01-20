% Define the range for random values
x_range = [-20, 20];  % Range for x position in meters
y_range = [-20, 20];  % Range for y position in meters
theta_range = [-180, 180];  % Range for orientation in degrees

% Generate random initial conditions using Monte Carlo
x0 = (x_range(2) - x_range(1)) * rand() + x_range(1);  % Random x position
y0 = (y_range(2) - y_range(1)) * rand() + y_range(1);  % Random y position
theta0 = (theta_range(2) - theta_range(1)) * rand() + theta_range(1);  % Random orientation

% Convert theta to radians for further use
theta0_rad = deg2rad(theta0);
x0_state = [x0; y0; theta0_rad; 0; 0; 0]; 