# SC602: Nonlinear Dynamical Systems

This repository contains solutions to problems from the SC602 Nonlinear Dynamical Systems course. The projects focus on control design and stability analysis for complex dynamical systems.

## Contents

### Problem 1: Two-Link Manipulator Dynamics
The objective is to design control inputs for a two-link manipulator such that the joint coordinates track a desired reference trajectory.

- **Dynamics:**
  \[
  M(q)\ddot{q} + C(q, \dot{q})\dot{q} + D\dot{q} + g(q) = u
  \]

- **Tasks:**
  1. Simulate and plot:
      - Joint angles and desired trajectories.
      - Control torques.
  2. Simplify the dynamics to scalar form and design a backstepping-based control law.

- **Results:** Plots showing the control performance and system stability.

### Problem 2: Rotational Dynamics of a Rigid Body
The goal is to stabilize a rigid body's rotational dynamics using a suitable control law.

- **Dynamics:**
  \[
  \dot{\rho} = [I + \rho^\times + \rho\rho^\top]\omega,
  \]
  \[
  J\dot{\omega} = -(\omega \times J\omega) + u,
  \]

- **Tasks:**
  1. Derive a control law to stabilize the Rodrigues parameter ($\rho$) and angular velocity ($\omega$).
  2. Simulate and provide plots of:
      - Time histories of $\rho(t)$ and $\omega(t)$.
      - Control inputs.

- **Results:** Demonstrated stabilization using control inputs with detailed simulations.

## Requirements

To run the simulations, you will need:
- Python 3.x
- Libraries:
  - `numpy`
  - `matplotlib`
  - `scipy`

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/kronos-here/SC602_Project.git
   cd SC602_Project
