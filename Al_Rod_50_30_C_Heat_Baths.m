format long
dx = 0.01;
dt = 0.01;
N = 30;
L = 0.3;
c = 380;
TLeft = 50;
TRight = 20;
TAmb = 20;
ro = 8000;
k = 300;
a = 0.01;
L = 0.3;
x = [0:dx:L];
C = k/(c*ro);
T = ones(1,31)*20;
T(1) = 50;
i = 1;
dT_dt = zeros(1,31);
j = 1;
while(T(6)<40)
    i = 2;
while (i<30)
    dT_dt(i-1) = C*(T(i-1)-2*(T(i))+T(i+1))/(dx^2);
    i = i+1;
end  
i = 1;
while(i<30)
    T(i+1) = (dT_dt(i)*dt)+T(i+1);
    i = i+1;
end
j = j+1;
end
T
j*dt

