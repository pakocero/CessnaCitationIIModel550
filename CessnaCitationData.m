mass = 3175; % mass of the vehicle [Kg]
gnd_alt = -1500; % height from ground [m]
wind_speed = 0; % wind speed [m/s]
wind_dir = 0; % wind azimuth direction [deg]
wind_angle_rates = [0 0 0]; % wind change in direction [rad/s]
initpos_e = [0 0 -1500]; %m
initvel_b = [85 0 0]; %m/s
initrpy_e = [0 0 0]; %rad
initrotrates_e = [0 0 0]; %rad/s
max_thrust = 1134; %kgf
inertia = [19990.488, -0.000, 7138.962 ;
           -0.000, 43017.383, 0.000;
           7138.962, 0.000, 59498.629]; %kg*m^2