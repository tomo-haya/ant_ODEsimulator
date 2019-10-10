function set_parameter()
%All variables are defined as global variables

%% Metabolic energy consumed by a worker inside the nest[Kcal/sec]
global u_inside;
u_inside=3.2*10^(-6);
%% Metabolic energy consumed by a worker outside the nest[Kcal/sec]
global u_outside;
u_outside=9.4*10^(-6);
%% Maximum surplus nutritional energy of a worker [kcal]	
global n_max;
n_max=u_inside*60*60*6.5*5;
%% Coefficient for Y(t) [kcal]
global q_y;
q_y= u_inside*60*60*6.5*1.4;
%% Maximum of Birth speed [num/s]
global b_max;
b_max=0.002035;
%% Coefficient for energy shortage [kcal]
global n_hunger;
n_hunger = u_inside*60*60*6.5*7000;
%% Rate of engaged workers in intra-nest tasks 
global p_larva;
p_larva = 0.2;
%% Number of larvae taken care of by an intra-nest worker
global b_larva;
b_larva=p_larva * 10^(-5);%%%In this program, E_intra & I_intra are combined;
%% Death rate of workers in foraging task killed by natural causes [/s]
global a_foraging;
a_foraging=1.*10^(-6);
%% Death rate of workers in midden construction task killed by natural causes [/s]
global a_midden;
a_midden=1.*10^(-7);
%% Death rate of workers in nest maintenance task killed by natural causes [/s]
global a_nest;
a_nest=1.*10^(-7);
%% Death rate of workers in intara-nest tasks killed by natural causes [/s]
global a_intra;
a_intra=1.*10^(-8);
%% Rate at which workers are killed by external enemies [/s]	
global p_enemy;
p_enemy=5*10^(-7);
%% Rate at which recruiting workers spontaneously stop recruiting [/s]
global p_rstop;
p_rstop =0.1;
%% Rate at which engaged workers spontaneously stop engaged [/s]
global p_estop;
p_estop=1*10^(-4);
%% Coefficient for X(t) [/s]
global q_x;
q_x=6*10^(-2);
%% Rate at which inactive workers are spontaneously engaged the task [/s]
global p_iteng;
p_iteng=1 * 10^(-4);
%% Rate at which inactive workers are spontaneously engaged the different task [/s]
global p_difeng;
p_difeng=2 * 10^(-7);
%% Amount of energy per unit of food [kcal] 
global n_food;
n_food=0.3;
%% Spontaneous debris inflow rate [debris/s]
global p_din;
p_din=1*10^(-5);
%% Coefficient for possibility of debris detection [debris]
global p_ddetect;
p_ddetect = 1.0;
%% Coefficient for possibility of midden detection [midden]
global p_mdetect;
p_mdetect=1.0;
%% Rate at which foraging workers detect food [/s]	
global p_fdetect;
p_fdetect=1.3*10^(-3);
%% Spontaneous midden collapse rate [/s] 
global p_mcoll;
p_mcoll=1*10^(-6);
%% Coefficient for death rate from external enemy attack [midden]
global q_enemy;
q_enemy=1;
%% Initial worker[num]
global intra_init;
intra_init = 10;%7;
global forager_init;
forager_init = 5;%3;
global midworker_init;
midworker_init = 5;%3;
global nestworker_init;
nestworker_init = 5;%3;
%% Initial energy[kcal]
global ene_init;
ene_init=(intra_init + forager_init + midworker_init + nestworker_init) * n_max;








end