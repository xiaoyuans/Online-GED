clear;
% real=[0;0;0;0;0;0;0;0;0.5;0;0;0;0;0;0;0];%% Ut_randomwalk1
% real=[0;0;0;0;0;0;0;0;0.473123;-0.003994;0;0;0;0;0;0];%% Ut_randomwalk2-biased-original
%real=[0;0;0;0;-5.004106;0;0;0;0.552338;0;0;0;0;0;0;0];%%Ut_randomwalk2-biased
% real=[0;0;0;0;0;-1;0;0;0.1;0;0;0;0;0;0;0];%% Ut_Burgers
% real=[0;0;0;0;-6;0;0;0;0;-1;0;0];%% Ut_KdV
% real=[0;0;0;-1;0;0;0;0;0;0;0;0];%% Ut_KdV
real=[0;0;0;0;0;0;0;-1;0;0;0;0;-1;0;0;0;0;0;0;0;0;0;0;0;-1;0;0;0;0;0;0;0;0;0;0;0];%% Ut_KS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Reaction-diffusion %%%
% real_u=zeros(110,1);
% real_v=zeros(110,1);
% real_u(4,1)=0.1;
% real_u(6,1)=0.1;
% real_u(13,1)=1;
% real_u(17,1)=1;
% real_u(18,1) = -1.0;
% real_u(19,1) = 1;
% real_u(20,1) = -1.0;
% 
% real_v(9,1)=0.1;
% real_v(11,1)=0.1;
% real_v(12,1)=1;
% real_v(17,1) = -1.0;
% real_v(18,1) = -1.0;
% real_v(19,1) = -1.0;
% real_v(20,1) = -1.0;
% %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
norm_r=norm(real);
s=size(real);
load('KS_large_data.mat');
lambda1=10^-2;
lambda2=10^0;
alpha=10^0;
beta=10^-2;
epo=251;
w2=subONR(R,Ut,alpha,beta,lambda1,lambda2,epo);
for b=1:s(1)
    if abs(w2(b))<0.1
        w2(b)=0;
    end
end
err_o=norm(real-w2)/norm_r;             