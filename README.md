# Mechanism_sessional
# Garage Door Mechanism Simulation

This MATLAB project simulates the motion of a garage door mechanism based on a CAD model. The script calculates the positions, velocities, and accelerations of various points in the mechanism and visualizes the motion in real-time.

## Description

The garage door mechanism is modeled as a four-bar linkage system, where the door's movement is controlled by the interaction of the links.

The script performs the following tasks:
- Calculates the positions of each joint in the mechanism.
- Determines the angular velocities and accelerations of the links.
- Traces the path of a specific point on the door.
- Visualizes the motion of the garage door mechanism in real-time.

## Parameters

The following parameters are defined in the script:

- `L0`, `L1`, `L2`, `L3`: Lengths of the links in the mechanism.
- `L_AP`: Length of the link from joint A to point P on the door.
- `alpha`: Initial angle of the link from joint A to point P.
- `theta2`: Array of angles that the driving link (L1) makes with the horizontal axis.

## Outputs

The script generates a real-time plot showing the motion of the garage door mechanism, including:
- The positions of the joints (O, A, B, and C).
- The path traced by a specific point on the door.
- The instantaneous configuration of the mechanism.

## How to Run

1. **MATLAB Installation**: Ensure you have MATLAB installed on your computer.
2. **Run the Script**: Open the script in MATLAB and run it. The motion of the garage door mechanism will be displayed in a figure window.
3. **Modify Parameters**: You can modify the parameters (e.g., link lengths, angles) to see how they affect the motion of the mechanism.
