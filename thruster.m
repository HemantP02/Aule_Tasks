% Thruster Profile and Gas Consumption Script
% Load Simulink output data (Fx, Fy, tau) from the workspace
% Ensure 'Fx', 'Fy', 'tau', and 'time' are variables in the MATLAB workspace

% Configuration
gas_rate_per_thruster = 0.05;  % Gas consumption rate in grams per second
thrust_force = 0.5;            % Thruster force in Newtons
min_threshold = 0.00;           % Minimum force to activate a thruster
time_step = 0.01;              % Time step in seconds (adjust if different)



% Compute number of samples
num_steps = length(out.Fx);

% Initialize thruster profile and total gas consumed
thruster_profile = zeros(num_steps, 3);  % Columns for Fx, Fy, and Tau thrusters
total_gas_consumed = 0;

% Compute thruster activations and gas consumption
for k = 1:num_steps
    if abs(out.Fx(k)) > min_threshold
        thruster_profile(k, 1) = out.Fx(k);  % Fx thruster activated
        total_gas_consumed = total_gas_consumed + gas_rate_per_thruster * time_step;
    end
    if abs(out.Fy(k)) > min_threshold
        thruster_profile(k, 2) = out.Fy(k);  % Fy thruster activated
        total_gas_consumed = total_gas_consumed + gas_rate_per_thruster * time_step;
    end
    if abs(out.tau(k)) > min_threshold
        thruster_profile(k, 3) = out.Fy(k);  % Tau thruster activated
        total_gas_consumed = total_gas_consumed + gas_rate_per_thruster * time_step;
    end
end

% Display thruster profile and total gas consumed
disp('Thruster Profile (1 = Active, 0 = Inactive):');
disp('Columns: [Fx_thruster, Fy_thruster, Tau_thruster]');
disp(thruster_profile);
disp(['Total Gas Consumed: ', num2str(total_gas_consumed), ' grams']);

% Visualization of thruster firings
time = (0:num_steps-1) * time_step;
figure;
subplot(3, 1, 1);
stairs(time, thruster_profile(:, 1));
title('Thruster Firing for Fx');
ylabel('Activation (0 or 1)');
grid on;

subplot(3, 1, 2);
stairs(time, thruster_profile(:, 2));
title('Thruster Firing for Fy');
ylabel('Activation (0 or 1)');
grid on;

subplot(3, 1, 3);
stairs(time, thruster_profile(:, 3));
title('Thruster Firing for Tau');
ylabel('Activation (0 or 1)');
xlabel('Time (s)');
grid on;
