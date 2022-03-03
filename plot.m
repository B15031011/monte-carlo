clear all;
% c_data = xlsread('basline3.xls');
% base_data=c_data(2,:);
% green_data=c_data(3,:);
% tech_data=c_data(4,:);
% x=[2020:2040];
% % plot( x, base_data ,'k-.',x, green_data,'k-*', x, tech_data,'k-o');
% plot(x, green_data,'k-*', x, tech_data,'k-o');
% xlabel('年份');
% ylabel('碳排放/万吨');
% % legend('基准场景','绿色发展场景','科技突破场景');
% legend('绿色发展场景','科技突破场景');


green_data=xlsread('green3_twoYears.xlsx');
tech_data=xlsread('tech3_twoYears.xlsx');
[mu1,sigma1]=normfit(green_data(1,:));
[mu2,sigma2]=normfit(green_data(2,:));

[mu3,sigma3]=normfit(tech_data(1,:));
[mu4,sigma4]=normfit(tech_data(2,:));

x= 12000:20:24000;
y1= pdf('Normal', x, mu1,sigma1);
y2= pdf('Normal', x, mu2,sigma2);
y3= pdf('Normal', x, mu3,sigma3);
y4= pdf('Normal', x, mu4,sigma4);

plot(x, y1, 'k-*', x, y2, 'k-o', x, y3, 'k-.', x, y4, 'k--');
xlabel('碳排放/万吨');
ylabel('概率密度');
legend('绿色发展场景2030','绿色发展场景2040','科技突破场景2030','科技突破场景2040');
