clear;
%real=[0;2;-0.1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Linear
%real=[0;-0.1;-2;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%%Yt_2D_Linear
%real=[0;0;0;0;0;0;2;0;0;-0.1;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Cubic
%real=[0;0;0;0;0;0;-0.1;0;0;-2;0;0;0;0;0;0;0;0;0;0;0];%%Yt_2D_Cubic
%real=[0;0;-10.9;-10;0;0;0;0;0;0];%%Xt_Lorenz_v1
%real=[0;0;-0.9;0;0;0;0;9.6;0;0];%%Yt_Lorenz_v1
%real=[-7.1;-2.7;0;0;0;0;0;0;-3.1;0];%%Zt_Lorenz_v1
%real=[0;5.7;0;0;0;2.1;0;0;-3.5;0];%%Xt_Lorenz_v2
%real=[-10.3;0;-2.7;0;-1;0;0;0;0;2.6];%%Yt_Lorenz_v2
%real=[0;-10.9;0;0;0;3.4;0;0;-5.6;0];%%Zt_Lorenz_v2
% real=[0;-1;0.25;0;0;0;0;-1;0;-1];%%Xt_Hopf
real=[0;0.25;1;0;0;0;-1;0;-1;0];%%Yt_Hopf
norm_r=norm(real);
s=size(real);
load('Hopf.mat');
lambda1=10^-1;
lambda2=10^-2;
alpha=10^1;
beta=10^0;
epo=33;
w2=subONR(R,Yt,alpha,beta,lambda1,lambda2,epo);
for b=1:s(1)
    if abs(w2(b))<0.2
        w2(b)=0;
    end
end
err_o=norm(real-w2)/norm_r;             