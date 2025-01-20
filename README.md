# Chaser Cart Docking Control and Path Planning

## Project Overview

This project focuses on designing and implementing a control and path-planning system for a Chaser Cart to dock with a Target Cart on a planar surface. The system is simulated using MATLAB and Simulink, with the goal of achieving smooth docking through efficient control algorithms and optimized path planning.

## Table of Contents

1. [System Modeling](#system-modeling)
2. [Control Algorithm](#control-algorithm)
3. [Path Planning](#path-planning)
4. [Visualization](#visualization)
5. [Technical Insights](#technical-insights)
6. [Edge-Case Analysis](#edge-case-analysis)
7. [References](#references)

## System Modeling

### State-Space Representation

The Chaser Cart's translational and rotational dynamics are modeled using a state-space approach. The state vector includes position, velocity, and orientation states, with corresponding input forces and torques. 

State vector:  
`x(t) = [x, y, θ, x˙, y˙, θ˙]ᵀ`  
Input vector:  
`u(t) = [Fx, Fy, τ]ᵀ`  
Output vector:  
`y(t) = x(t)`  

The state-space equations are represented as:  
`x˙(t) = Ax(t) + Bu(t)`  
`y(t) = Cx(t) + Du(t)`

### Assumptions and Parameters

- Mass of Chaser (m): 1 kg
- Moment of Inertia (I): 0.1 kg·m²
- Thruster Force Limits: ±0.5 N
- Gas Consumption Rate: 0.05 g/s per thruster
- Initial Conditions: Randomized using Monte Carlo simulation

## Control Algorithm

### PID Controller Design

A PID (Proportional-Integral-Derivative) controller is implemented to control translational motion in the x and y directions, and rotational motion for orientation.

Control laws for each degree of freedom are as follows:

`Fx(t) = Kpx * ex(t) + Kix * ∫₀ᵗ ex(τ)dτ + Kdx * d/dt ex(t)`  
`Fy(t) = Kpy * ey(t) + Kiy * ∫₀ᵗ ey(τ)dτ + Kdy * d/dt ey(t)`  
`τ(t) = Kθ * eθ(t) + Kiθ * ∫₀ᵗ eθ(τ)dτ + Kdθ * d/dt eθ(t)`

### Tuning Gains

Methods used for tuning the controller:

- Manual tuning
- Ziegler-Nichols method

### Control Implementation

The controller is implemented using MATLAB and Simulink for real-time control, with integral and derivative terms managed using persistent variables and time steps.

## Path Planning

### Trajectory Generation

The goal is to generate an optimal path for the Chaser Cart to move from a random initial position to the target position at (0,0,0). The trajectory is planned in both position and velocity space.

### Path Planning Algorithm

A polynomial trajectory planning approach is used, where the trajectory is expressed as a cubic polynomial for the position components:

`x(t) = a₀ + a₁t + a₂t² + a₃t³`  
`y(t) = b₀ + b₁t + b₂t² + b₃t³`

### Trajectory Calculation

Coefficients are solved based on boundary conditions, and velocity and acceleration profiles are computed for smooth motion.

## Visualization

### Docking Animation

The docking process is animated to visualize the Chaser Cart's motion and thruster activations. The following components are animated:

- Chaser Position: The (x, y) coordinates over time.
- Orientation: A quiver plot shows the current orientation.
- Thruster Activation: Color-coded indicators for thruster firing.

### Implementation Details

MATLAB animations use trajectory data and control inputs from Simulink to generate the animation.

## Technical Insights

### Actuator and Sensor Hardware

The system uses linear and rotational thrusters for motion and torque. Sensors include position sensors, gyroscopes, and velocity sensors.

### State Estimation Strategy

State estimation is achieved using a Kalman filter or complementary filter, depending on the noise characteristics of the system.

### Practical Challenges

Challenges include limited actuator thrust, which is addressed by using a saturation block in the control design.

## Edge-Case Analysis

This section discusses edge cases such as actuator limitations, noisy sensor data, and extreme environmental conditions, with solutions and mitigations provided.

## References

- [Insert relevant references here]

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
