Lv_20C = 2453500;%J/kg latent heat vaporization water at 20C
Lv_100C = 2256400;%J/kg latent heat vaporization water at 100C
Cp_water = 4200;%J/(kg*K) specific heat liquid water
Cp_vapour = 1996;%J/(kg*K) specific heat water vapour
Mass_water = 1;%kg
Start_water_temp = 20;%degrees C
Boil_temp = 20;%Degrees C, boil water at
End_vapour_temp = 100;%Degrees C, heat vapor to

if(Boil_temp ==100)
Q_phase_change = Mass_water*Lv_100C;%energy to change water to vapour
end
if(Boil_temp == 20)
    Q_phase_change = Mass_water*Lv_20C;%energy to change water to vapour
end
Q_heating_water = Mass_water*Cp_water*(Boil_temp-Start_water_temp);%energy needed to raise water from start temp to boil temp
Q_heating_vapour = Mass_water*Cp_vapour*(End_vapour_temp-Boil_temp);%energy needed to heat vapour from boil temp to end temp

Q_total = Q_phase_change+Q_heating_water+Q_heating_vapour