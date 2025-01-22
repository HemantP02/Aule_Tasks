function optimal_gains = auto_tune_control(current_state, final_state)
    % Initial guess for the control gains [Kp, Kd, K_theta, K_omega]
    initial_gains = [-5, 1, -10.0, 0.2];  % Initial guess values
    
    % Define bounds for the gains (you can adjust these bounds)
    lb = [0, 0, -10, 0];  % Lower bounds (non-negative)
    ub = [10, 5, 10, 5];  % Upper bounds (reasonably high for initial guess)
    
    % Define the optimization options
    options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
    
    % Run fmincon to minimize the cost function
    optimal_gains = fmincon(@(gains) control_tuning_cost(gains, current_state, final_state), ...
                            initial_gains, [], [], [], [], lb, ub, [], options);
end
