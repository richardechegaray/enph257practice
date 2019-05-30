Isentropic_ratio = 20; %P2/P1
I_r = 1;%Isentropic ratio placeholder for when finding v decrease from  point 1 to point 2
T_amb = 273.15+10; %Degrees K
P_amb = 101; %kPa
T_max = 1000+273.15;%max temp at T3 in kelvin
gama = 1.4; %gama for air is 1.4
P2 = Isentropic_ratio*P_amb;%finding P2
Cp = 7/2*8.3;%R = 8.3J/(mol*K)

P_1_2 = P_amb:(P2-P_amb)/Isentropic_ratio:P2;%make a vector of pressures from P1 tot P2
V_1_2 = (P_1_2/P_amb).^(-1/gama);%make vector of Volumes from 1 to 2

%find V2, T2
V2 = V_1_2(end);
T2 = T_amb*(1/(V2))^(gama-1);

%find P3 and V3
P3 = P2;
V3 = (T_max/T2)*(V2);

P_3_4 = P3:(P_amb-P3)/Isentropic_ratio:P_amb;%make vector of pressures from 3 to 4
V_3_4 = V3.*(P_3_4./P3).^(-1/gama);%make vector of volumes from 3 to 4

%find P4 and V4
V4 = V_3_4(end);
P4 = P_3_4(end);

%plot everything
plot(V_1_2,P_1_2)
hold on
plot([V2 V3], [P2 P3])
plot(V_3_4,P_3_4)
plot([V4 V_1_2(1)], [P4 P_amb])
xlabel('Volume ratio')
ylabel('Pressure (kPa)')
title('Brayton Cycle')
legend('Stage 1-2', 'Stage 2-3', 'Stage 3-4', 'Stage 4-1')
hold off 

%find areas
Int_1_2 = abs(trapz(V_1_2, P_1_2));
Int_2_3 = abs(trapz([V2 V3], [P2 P3]));
Int_3_4 = abs(trapz(V_3_4, P_3_4));
Int_4_1 = abs(trapz([V_3_4(end) V_1_2(1)], [P_3_4(end) P_amb]));

%calculate efficiency as 1-Qout/Qin
Eff = 1 - Int_4_1/Int_2_3
