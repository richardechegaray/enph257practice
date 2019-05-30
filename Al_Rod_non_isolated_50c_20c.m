% One end of a rod is set to 50 C, ambiant temp is 20 C, the rod is then
% released from heat bath
% the rod is .3 meters long and is "cut" into 30 sections for analysis
% so since 0.3 m and 30 sections thats 0.01m per section which is 10mm per
% section so want to look at the sixth section
% want to find the time it takes for the 3rd section to become 425 C
format long
dx = 0.01;
dt = 0.01;
N = 30;
L = 0.3;
c = 900;
TLeft = 50;
TRight = 20;
TAmb = 20;
ro = 2700;
k = 200;
a = 0.01;
L = 0.3;
x = [0:dx:L];
C = k/(c*ro);
T = ones(1,31)*20;
T(1) = 50;
i = 1;
dT_dt = zeros(1,31);
% j is a counter to see how many time steps are taken
j = 1;
%a while loop to stop iterating once the section in question reaches 25C
while(T(3)<25)
    i = 1;
    %find the change in temperature for each section of the bar
    dT_dt(i) = -C*(T(i)-T(i+1))/(dx^2);
    i = i+1;
while (i<30)
    dT_dt(i) = C*(T(i-1)-2*(T(i))+T(i+1))/(dx^2);
    i = i+1;
end  
    dT_dt(i)=C*(T(i-1)-T(i))/(dx^2);
    i = 1;
%apply the change in temperature for each section of the bar
while(i<30)
    T(i) = (dT_dt(i)*dt)+T(i);
    i = i+1;
end
j = j+1;
end
Time_till_25C=j*dt

%the time it takes for the 3rd section to reach 25C is  1.67 seconds