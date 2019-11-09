function []=plot1d(Ave_R_i,b)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( b(:,2), Ave_R_i,'o');

%datetick('x','yyyymm');
box off; grid on;
ylabel('Average Portfolio Return in Percentage')
xlabel('beta');
title(strcat('Portfolio return against beta'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);