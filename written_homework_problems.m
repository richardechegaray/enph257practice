%Gas price increse problem
Increase = 5;%5$/tonne increase in gas prices
CH2 = 14;%gas = CH2
CO2 = 44;
ro_gas = 0.75;%Kg/L
Kg_per_tonne = 1/1000;%1tonne = 1000 kg;
Price_change_per_litre = Increase*CO2/CH2*ro_gas*Kg_per_tonne %in dollars 

%carbon consumed by humans per year
E_per_day = 2000;%Kcal/day
Seconds_per_day = 24*60*60;%how many seconds on a day
Joules_per_Kcal = 4184;%joules in a Kcal
Power = E_per_day/Seconds_per_day*Joules_per_Kcal; %in watts
Seconds_per_year = 365*24*60*60; 
Carbo_enthalpy = 16e6;%J/kG
C = 12;%molar mass carbon
CH2O = 30; %molar mass carbo
Mass_carbon_per_year = Power*Seconds_per_year/Carbo_enthalpy*C/CH2O %Kg*carbon/year

%Extra power needed for electric cars switch
Population = 5e6; %population of the province
Car_pop = 3e6;%amount of cars in bc
Distance_per_car = 20e3;%Km/year
Fuel_econ = 10/100;%L/km
Gas_energy = 36e6;%J/L
Power_needed = Gas_energy*Fuel_econ*Distance_per_car*Car_pop*1/Seconds_per_year %in watts

%revised enthalpy water heating from methane combustion
Methane_enthalpy = 55.65e6;%J/kg
Latent_heat_vapo_water = 2445e3;%J/kg at 298 Kelvin
CH4 = 16;%kg
H2O_made = 36%from equation CH4+O2 = CO2+2H2O 
New_LHV = Methane_enthalpy-Latent_heat_vapo_water*H2O_made/CH4 %J/kg

