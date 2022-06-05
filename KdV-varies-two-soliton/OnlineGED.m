clear;
real=[0;0;0;0;-6;0;0;0;0;-1;0;0];%% Ut_KdV
norm_r=norm(real);
s=size(real);
load('KdV_data_3_256.mat');
lambda1=10^-1;
lambda2=10^-6;
alpha=10^1;
beta=10^-1;
epo=501;
thresh=0.5;
w2=subONR(R,Ut,alpha,beta,lambda1,lambda2,epo);
for b=1:s(1)
    if abs(w2(b))<thresh
        w2(b)=0;
    end
end
err_o=norm(real-w2)/norm_r;             