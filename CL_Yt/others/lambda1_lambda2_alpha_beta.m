clear;
% real=[0;0;0;0;0;0;2;0;0;-0.1;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Cubic
% real=[0;0;0;0;0;0;-0.1;0;0;-2;0;0;0;0;0;0;0;0;0;0;0];%%Yt_2D_Cubic
% real=[0;2;-0.1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Linear
real=[0;-0.1;-2;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%%Yt_2D_Linear
norm_r=norm(real);
s=size(real);
load('2D_Linear.mat');
w2=subONR(R,Yt,1,0.1,0.1,0.01);
for b=1:s(1)
    if abs(w2(b))<0.08
        w2(b)=0;
    end
end
err_o=norm(real-w2)/norm_r;
                           