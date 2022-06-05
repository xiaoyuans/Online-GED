clear;
real=[0;0;0;0;0;0;0;0;0.5;0;0;0;0;0;0;0];%% Ut_randomwalk1
% real=[0;0;0;0;-5.004106;0;0;0;0.552338;0;0;0;0;0;0;0];%% Ut_randomwalk2-biased
% real=[0;0;0;0;0;0;0;0;0.473123;-0.003994;0;0;0;0;0;0];%% Ut_randomwalk2-biased-original
norm_r=norm(real);
s=size(real);
load('Randomwalk_pre1_original.mat');
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
                    if abs(w2(b))<0.25
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
save('Result_randomwalk_pre1_original.mat','w','error');                