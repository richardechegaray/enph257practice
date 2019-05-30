m = .0289; %kg/mol molar mass of air
R = 8.314; %J/(mol Kelvin) gas constant
g = 9.81; %m/s^2 gravity
gama = 1.4; %for air
dT_dz = (-m*g/R)*(1-1/gama);%change in temp relative to change in altitude, constant
%eq'n = dT/dP*dP/dz = (-mg/R)(1-1/gama) barometric equation, z is altitude
% dP/dz = P/T*(-m*g/R)
P_0 = 101;%kPa
T_0 = 15+273.15;%kelvin
z_0 = 0;%initial altitude in meters
dz = 0.01;%meters, step size in altitude
z_max = 10000;%meters, max height
P = zeros(1,z_max/dz);%initialize pressure vector
P(1)=P_0;
T  = T_0;%initialize temperature vector
z = zeros(1,z_max/dz);%initialize altitude vector
z(1) = dz;
i = 1;%a counter

while(z(i)<z_max)
    T = T+dT_dz*dz;
    dP_dz = (P(i)/T)*(-m*g/R);
    P(i+1) = dP_dz*dz+P(i);
    i = i+1;
    z(i) = i*dz;
end
plot(z,P)
hold on
title('Atmospheric pressure with rising altitude')
xlabel('Altitude above sea level (meters')
ylabel('Pressure (kPa)')
hold off;
