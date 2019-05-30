Sun_intensity = 1000;%Watts/m^2
T_amb = 5+273.15;%Degrees K
Sky_radiation_temp = -30+273.15;%degrees K
diam = 0.25;%diameter of ball in meters
P_i = 55;%kPa
T_i = 5+273.15;%degrees K
Ball_reflectiveness = 0.5;%to scale power in
Effective_sun_intensity = Sun_intensity*Ball_reflectiveness;%Watts/m^2
emiss = 1;
Kc = 5;%Watts/(m^2*K)
mass = 0.625;%kg
Ball_area = 4*pi*(diam/2)^2;
Half_ball_area =Ball_area/2;%m^2
proj_area = pi*(diam/2)^2;
sigma = (5.670367)*1e-8;
c = 640;%J/(kg*K)
ro = mass/((4/3)*pi*(diam/2)^3);%kg/m^3
D = c*ro*Ball_area;
dt = 0.01;
i = 1;
T = T_i;
max = 10000000;
T_vec = zeros(1,max);

while(i<=max)
    P_in = Effective_sun_intensity*proj_area;
    P_out_rad = Ball_area*emiss*sigma*(T^4-T_amb^4);
    P_out_conv = Ball_area*Kc*(T-T_amb);
    P_net = P_in-P_out_rad-P_out_conv;
    dT_dt_Power = P_net/(D);
    T_vec(i) = T-273.15;
    T = T+dT_dt_Power*dt;
    i = i+1;
end
V = 1:1:max;
V = V.*dt;
plot(V,T_vec)
    