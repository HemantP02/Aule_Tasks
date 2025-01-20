# Chaser Cart Docking Control and Path Planning

## Table of Contents
1. [System Modeling](#system-modeling)
2. [Control Algorithm](#control-algorithm)

---

### System Modeling
The Chaser Cart’s translational and rotational dynamics are modeled using a state-space representation.

#### State-Space Representation
- **State Vector**:

$$
x(t) = [x, y, \theta, \dot{x}, \dot{y}, \dot{\theta}]^T
$$

Where:
- x, y: Position coordinates of the Chaser.
- $$\theta$$: Orientation (radians).
- $$\dot{x} , \dot{y}$$: Linear velocities.
- $$\dot{\theta}$$: Angular velocity.

- **Input Vector**:

$$
u(t) = [F_x, F_y, \tau]^T
$$

Where:
- \( F_x \), \( F_y \): Control forces.
- \( \tau \): Control torque.

- **State-Space Matrices**:

$$
\dot{x}(t) = A x(t) + B u(t)
$$

$$
y(t) = C x(t) + D u(t)
$$

The matrices \( A \), \( B \), \( C \), and \( D \) are:

$$
A = \begin{bmatrix}
0 & 0 & 0 & 1 & 0 & 0 \\
0 & 0 & 0 & 0 & 1 & 0 \\
0 & 0 & 0 & 0 & 0 & 1 \\
0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 0 & 0
\end{bmatrix}
$$

$$
B = \begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0 \\
\frac{1}{m} & 0 & 0 \\
0 & \frac{1}{m} & 0 \\
0 & 0 & \frac{1}{I}
\end{bmatrix}
$$

Where \( m = 1 \) kg (Chaser mass) and \( I = 0.1 \) kg·m² (moment of inertia).

#### Assumptions
- **Thruster force limits**: ±0.5 N
- **Gas consumption rate**: 0.05 g/s per thruster
- **Initial conditions**: Monte Carlo simulations with random positions and orientation

---

### Control Algorithm
A PID controller is implemented to control position and orientation.

#### PID Control Law

$$
F_x(t) = K_{p_x} e_x(t) + K_{i_x} \int e_x(\tau) d\tau + K_{d_x} \frac{de_x(t)}{dt}
$$

$$
F_y(t) = K_{p_y} e_y(t) + K_{i_y} \int e_y(\tau) d\tau + K_{d_y} \frac{de_y(t)}{dt}
$$

$$
\tau(t) = K_{\theta} e_{\theta}(t) + K_{i_\theta} \int e_{\theta}(\tau) d\tau + K_{d_\theta} \frac{de_{\theta}(t)}{dt}
$$

Where \( e_x(t) \), \( e_y(t) \), and \( e_\theta(t) \) are errors between the target and current states.

#### Tuning Parameters
| Parameter | \( K_p \) | \( K_i \) | \( K_d \) |
|-----------|-----------|-----------|-----------|
| \( F_x \) | 0.5       | 0.1       | 0.05      |
| \( F_y \) | 0.5       | 0.1       | 0.05      |
| \( \tau \) | 1.0      | 0.2       | 0.1       |

---

### Next Steps
1. Path Planning
2. Visualization
3. Technical Insights
4. Edge-Case Analysis
