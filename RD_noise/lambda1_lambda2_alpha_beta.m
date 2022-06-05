clear;
real_u=zeros(110,1);
real_v=zeros(110,1);
real_u(4,1)=0.1;
real_u(6,1)=0.1;
real_u(13,1)=1;
real_u(17,1)=1;
real_u(18,1) = -1.0;
real_u(19,1) = 1;
real_u(20,1) = -1.0;

real_v(9,1)=0.1;
real_v(11,1)=0.1;
real_v(12,1)=1;
real_v(17,1) = -1.0;
real_v(18,1) = -1.0;
real_v(19,1) = -1.0;
real_v(20,1) = -1.0;

norm_r=norm(real_u);
s=size(real_u);
load('RD_data_0.01noise.mat');
epo=1;
error=[];
w=[];
for i=-5:1
    lambda1=10^i;
    for j=-5:1
        lambda2=10^j;
        for k=-5:1
            alpha=10^k;
            for t=-5:1
                beta=10^t;
                w2=subONR(R,Ut,alpha,beta,lambda1,lambda2);
                for b=1:s(1)
                    if abs(w2(b))<0.09
                        w2(b)=0;
                    end
                end
                err_o=norm(real_u-w2)/norm_r;
                w2=[lambda1;lambda2;alpha;beta;w2];
                error=[error,err_o];
                w=[w,w2];
                disp(epo);
                epo=epo+1;
            end
        end
    end
end
save('Result_RD_U_0.01noise_1.mat','w','error');                