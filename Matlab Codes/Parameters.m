N1 = 1;
N2 = 50;
J_L = 1;
K_t = 0.05 ;
K_b = 0.05 ;
L_a = 500*10^-6;
R_a = 5;

zeta = 0.69010673; %at 5% overshoot
wn = 0.0125/zeta; %uncompensated system frequancy
ang = 180- (acos(zeta)*(180/pi)); %damping angle
sigma = 4/10; %real part of the compensated dominant pole
wd = (sigma/zeta)*sqrt(1-zeta^2); %imaginary part of the compensated dominant pole
pole1_angles = 180- (atan(wd/abs(sigma-0.025))*(180/pi)); %open system pole angle
pole2_angles = (atan(wd/abs(10^4-sigma))*(180/pi)); %open system pole angle
sum_angles = -(pole2_angles +pole1_angles +ang);
zero_ang = 180 - sum_angles -360; % The angle of the compensator zero
comp_zero = (wd/tan(zero_ang*(pi/180))) +sigma; %The location of the compensator zero

G = zpk([-comp_zero],[0 -0.025 -10^4],1);
zpk(feedback(G,1)); 


