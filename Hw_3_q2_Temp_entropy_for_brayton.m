Isentropic_ratio = 20; %P2/P1
I_r = 1;%Isentropic ratio placeholder for when finding v decrease from  point 1 to point 2
T_amb = 273.15+10; %Degrees K
T1 = T_amb; %start cycle at ambiant temp
P_amb = 101; %kPa
P1 = P_amb; %Starting pressure is ambiant pressure
T_max = 1000+273.15;%max temp at T3 in kelvin
gama = 1.4; %gama for air is 1.4
P2 = Isentropic_ratio*P_amb;%finding P2
Cp = 7/2*8.3;%R = 8.3J/(mol*Kelvin)
Cv = 20.7502;%J/(mol*Kelvin)
R = 8.3;%J/(mol*Kelvin)
Kg_mol = .0289; %kg/mol molar mass of air
Mass = 1;%kg
n = Mass/Kg_mol;%mols of air in the cycle
%eq'n: Delta S = Cp*ln(T2/T1)-n*R**ln(P2/P1)

%find P,T,V from 1-2
P_1_2 = P_amb:(P2-P_amb)/Isentropic_ratio:P2;
V_1_2 = (P_1_2/P_amb).^(-1/gama);
V1 = V_1_2(1);
T_1_2 = T_amb.*(V_1_2).^(1-gama);

%find V2, T2
V2 = V_1_2(end);
T2 = T_amb*(1/(V2))^(gama-1);

%find P3 and V3 and T3
P3 = P2;
V3 = (T_max/T2)*(V2);
T3 = T_max;

%find P,T,V from 2-3
V_2_3 = V2:(V3-V2)/Isentropic_ratio:V3;
P_2_3 = ones(1,Isentropic_ratio+1)*P2;
T_2_3 = T2:(T_max-T2)/Isentropic_ratio:T_max;

%find P,T,V from 3-4
P_3_4 = P3:(P_amb-P3)/Isentropic_ratio:P_amb;%make vector of pressures from 3 to 4
V_3_4 = V3.*(P_3_4./P3).^(-1/gama);%make vector of volumes from 3 to 4
T_3_4=T3.*(V_3_4./V3).^(1-gama);

%find P4 and V4 and T4
V4 = V_3_4(end);
P4 = P_3_4(end);
T4 = T_max*(V3/V4)^(gama-1);

%find P,T,V from 4-1
P_4_1 = ones(1,Isentropic_ratio+1)*P_amb;
V_4_1 = V4:(V1-V4)/Isentropic_ratio:V1;
T_4_1 = T4.*(V_4_1./V4);

%plot everything

% plot(V_1_2,P_1_2)
% hold on
% plot([V2 V3], [P2 P3])
% plot(V_3_4,P_3_4)
% plot([V4 V1], [P4 P_amb])
% xlabel('Volume ratio')
% ylabel('Pressure (kPa)')
% title('Brayton Cycle')
% legend('Stage 1-2', 'Stage 2-3', 'Stage 3-4', 'Stage 4-1')
% hold off 

%find areas
Int_1_2 = abs(trapz(V_1_2, P_1_2));
Int_2_3 = abs(trapz([V2 V3], [P2 P3]));
Int_3_4 = abs(trapz(V_3_4, P_3_4));
Int_4_1 = abs(trapz([V_3_4(end) V_1_2(1)], [P_3_4(end) P_amb]));

%calculate efficiency as 1-Qout/Qin
Eff = 1 - Int_4_1/Int_2_3;

%calculate change in entropy for each cycle as function of change in temp

DS_2_3 = n*Cp.*log(T_2_3./T2);

DS_4_1 = n*Cp.*log(T_4_1./T4);

%make the entropy vectors, starting each vector at the end of the last and
%using the change in entropy vectors to increment
S_1_2 = zeros(1,length(DS_2_3));
S_2_3 = ones(1,length(DS_2_3)).*S_1_2;
S_2_3 = S_2_3+DS_2_3;
S_3_4 = ones(1,length(DS_2_3)).*S_2_3(end);
S_4_1 = ones(1,length(DS_4_1)).*S_3_4(end);
S_4_1 = S_4_1+DS_4_1;

%plot the entropy vs time graph
% plot(T_1_2,S_1_2)
% hold on
% plot(T_2_3,S_2_3)
% plot(T_3_4,S_3_4)
% plot(T_4_1,S_4_1)
% title('Temperature & Entropy Brayton cycle')
% ylabel('Entropy')
% xlabel('Temprature (Kelvin)')
% hold off

plot(S_1_2,T_1_2)
hold on
plot(S_2_3,T_2_3)
plot(S_3_4,T_3_4)
plot(S_4_1,T_4_1)
title('Temperature & Entropy Brayton cycle')
xlabel('Entropy (J/Kelvin)')
ylabel('Temprature (Kelvin)')
legend('stage 1-2', 'stage 2-3', 'stage 3-4', 'stage 4-1', 'location', 'northwest')
hold off

    
    