clear;
real=[0;0;0;0;-6;0;0;0;0;-1;0;0];%% Ut_KdV
% real=[0;0;0;-5;0;0;0;0;0;0;0;0];%% Ut_KdV
norm_r=norm(real);
s=size(real);
load('KdV_TwoSingle.mat');
epo=1;
error=[];
w=[];
for i=-8:1
    lambda1=10^i;
    for j=-8:1
        lambda2=10^j;
        for k=-8:1
            alpha=10^k;
            for t=-8:1
                beta=10^t;
                w2=subONR(R2,Ut2,alpha,beta,lambda1,lambda2);
                for b=1:s(1)
                    if abs(w2(b))<0.1
                        w2(b)=0;
                    end
                end
                err_o=norm(real-w2)/norm_r;
                w2=[lambda1;lambda2;alpha;beta;w2];
                error=[error,err_o];
                w=[w,w2];
                disp(epo);
                epo=epo+1;
            end
        end
    end
end
save('Result_KdV_single2.mat','w','error');                