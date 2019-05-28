%Constants

I = 1000; %W/m^2, incoming solar Intensity
r = 0.9; %reflectance
Emissp = 0.9;
Emissm = 0.1;
Tair = 40 + 273.15; 
Ts = -20 + 273.15;%
Te = 40 +273.15; % K
SteffBoltz =  5.670374419e-8;
dt = 0.001;
ro = 1.20; %kg/m^3
c  = 1.3; %Kj/Kg/k

sheet = 40+273.15;
prev = 0;
time = 0;

timeseries = [];
dT_dt = @(T) (I*r -SteffBoltz*(Emissp*(T^4-Tair^4-Ts^4) + Emissm*(T^4 - Te^4)) )/(c*ro);
while((sheet-prev)/dt>1e-8)
    prev = sheet;
    timeseries(end+1) = [sheet];
    sheet = sheet + dT_dt(sheet)*dt;
    time = time + dt;
end

SheetTEmp = sheet - 273.15
time
plot([0:dt:time], timeseries)
xlabel("Time (s)");
ylabel("Temp (k)");
