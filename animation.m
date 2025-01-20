% data (simulation results)
time = out.theta;  % Time 
x_state = out.xf;  % x positions
y_state = out.yf; % y positions
theta_state = out.theta;  % orientation (radians)

% Target position
x_target = 0;
y_target = 0;
theta_target = 0;

% Plot setup
figure;
axis([-20 20 -20 20]);  % Set axis limits
hold on;
grid on;

% Plot the target
plot(x_target, y_target, 'ro', 'MarkerSize', 10, 'LineWidth', 2);  % Target in red

% Initialize plot objects for the Chaser
chaser_body = plot(0, 0, 'gX-', 'MarkerSize', 8, 'LineWidth', 1);  % Chaser path
chaser_orientation = quiver(0, 0, 0, 0, 0, 'Color', 'r', 'MaxHeadSize', 4);  % Orientation arrow

% Animation loop
for k = 1:length(time)
    % Extract current state
    x = x_state(k);
    y = y_state(k);
    theta = theta_state(k);
    
    % Update Chaser position
    set(chaser_body, 'XData', x_state(1:k), 'YData', y_state(1:k));  % Trajectory
    
    % Update Chaser orientation
    % Compute orientation vector (length of arrow for visualization)
    arrow_length = 4;  % Arbitrary scale for visualization
    dx = arrow_length * cos(theta);
    dy = arrow_length * sin(theta);
    set(chaser_orientation, 'XData', x, 'YData', y, 'UData', dx, 'VData', dy);
    
    % Pause to simulate real-time animation
    pause(0.02);
end

% Add labels
title('Docking Process Animation');
xlabel('X Position (m)');
ylabel('Y Position (m)');
legend('Target Position', 'Chaser Trajectory');
