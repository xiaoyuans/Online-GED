clear;
% real=[0;0;0;0;0;0;2;0;0;-0.1;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Cubic
real=[0;2;-0.1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%%Xt_2D_Linear
norm_r=norm(real);
s=size(real);
load('Cubic_Linear.mat');
[w2,G,loss]=subONR4(R,Xt,0.1,1,1,0.01);
for b=1:s(1)
    if abs(w2(b))<0.08
        w2(b)=0;
    end
end
disp(w2)
err_o=norm(real-w2)/norm_r;

% xx=[];
% aa=size(loss);
% for i=1:aa(2)
%     xx=[xx,i];
% end
%%%%%%%%%%%%%%%%%%%%%%%
% plot(xx,loss,'--ks',...
%     'linewidth',2.4,...
%     'MarkerSize',10,...
%     'MarkerEdgeColor','b',...
%     'MarkerFaceColor',[0.5,0.5,0.5]);
%%%%%%%%%%%%%%%%%%%%%%
% figure('Color',[0.15,0.15,0.15]);
% h_p=plot(xx,loss,'--o',...
%     'Color','c',...
%     'linewidth',2,...
%     'MarkerSize',8,...
%     'MarkerEdgeColor',[0.39,0.83,0.07],...
%     'MarkerFaceColor',[0.25,0.25,0.5]);
% h_a=gca;
% box off
% set(h_a,'color',[0.15,0.15,0.15]);
% set(h_a,'Xcolor',[0.8,0.22,1]);
% set(h_a,'Ycolor',[0.8,0.22,1])
%%%%%%%%%%%%%%%%%%%%%%
% figure('Color',[0.15,0.15,0.15]);
% h_p=plot(xx,loss,...
%     'Color','c',...
%     'linewidth',2,...
%     'MarkerSize',8,...
%     'MarkerEdgeColor',[0.39,0.83,0.07],...
%     'MarkerFaceColor',[0.25,0.25,0.5]);
% h_a=gca;
% box off
% set(h_a,'color',[0.15,0.15,0.15]);
% set(h_a,'Xcolor',[0.8,0.22,1]);
% set(h_a,'Ycolor',[0.8,0.22,1])

