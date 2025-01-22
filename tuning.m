% Define initial state [x, y, theta, x_dot, y_dot, theta_dot]
current_state = [3, -2, 45, 0, 0, 0];  % Starting position and orientation

% Define final target state [x_final, y_final, theta_final]
final_state = [0, 0, 0];  % Desired position and orientation

% Run the auto-tuning process
optimal_gains = auto_tune_control(current_state, final_state);

% Display the optimal gains
disp('Optimal Gains:');
disp(['Kp: ', num2str(optimal_gains(1))]);
disp(['Kd: ', num2str(optimal_gains(2))]);
disp(['K_theta: ', num2str(optimal_gains(3))]);
disp(['K_omega: ', num2str(optimal_gains(4))]);
