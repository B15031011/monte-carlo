% 蒙特卡洛采样预测碳排放

%% 初始化数据设定
clear all;
C0=7267.33;                       % 基准年碳排放
nYears = 21 ;                      % 要模拟的时间跨度

%基准设定
% Imin=19.79;  Imed=19.98;  Imax=20.24;   
% EImin=-10.37;  EImed=-10.25;  EImax=-8.44;
% ECImin=0.21;  ECImed=0.27;  ECImax=0.58;

%低碳设定
% Imin1=10.18;  Imed1=11.18;  Imax1=12.18;    
% Imin2=8.18;  Imed2=9.18;  Imax2=10.18; 
% Imin3=5.18;  Imed3=6.18;  Imax3=7.18; 
% Imin4=2.18;  Imed4=3.18;  Imax4=4.18; 
% 
% EImin1=-2.96;  EImed1=-2.56;  EImax1=-2.16;
% EImin2=-2.61;  EImed2=-2.21;  EImax2=-1.81;
% EImin3=-2.41;  EImed3=-2.01;  EImax3=-1.61;
% EImin4=-2.21;  EImed4=-1.81;  EImax4=-1.41;
% 
% ECImin1=-0.80;  ECImed1=-0.60;  ECImax1=-0.40;
% ECImin2=-0.81;  ECImed2=-0.61;  ECImax2=-0.41;
% ECImin3=-0.60;  ECImed3=-0.40;  ECImax3=-0.20;
% ECImin4=-0.50;  ECImed4=-0.30;  ECImax4=-0.10;

%技术设定
Imin1=10.18;  Imed1=11.18;  Imax1=12.18;    
Imin2=8.18;  Imed2=9.18;  Imax2=10.18; 
Imin3=5.18;  Imed3=6.18;  Imax3=7.18; 
Imin4=2.18;  Imed4=3.18;  Imax4=4.18; 

EImin1=-2.96;  EImed1=-2.56;  EImax1=-2.16;
EImin2=-2.96;  EImed2=-2.56;  EImax2=-2.16;
EImin3=-2.96;  EImed3=-2.56;  EImax3=-2.16;
EImin4=-2.96;  EImed4=-2.56;  EImax4=-2.16;

ECImin1=-1.01;  ECImed1=-0.81;  ECImax1=-0.61;
ECImin2=-1.03;  ECImed2=-0.83;  ECImax2=-0.63;
ECImin3=-1.05;  ECImed3=-0.85;  ECImax3=-0.65;
ECImin4=-1.05;  ECImed4=-0.85;  ECImax4=-0.65;

%% 数据模拟
for nYear=1:nYears            
    nTrials=100000;                % 模拟次数
    
%     for j=1:nTrials               % 基准场景
%         rate1 = random(makedist('Triangular','a',Imin,'b',  Imed,'c',Imax),1,nYear);
%         rate2 = random(makedist('Triangular','a',EImin,'b',  EImed,'c',EImax),1,nYear);
%         rate3 = random(makedist('Triangular','a',ECImin,'b',  ECImed,'c',ECImax),1,nYear);  
    for j=1:nTrials             % 低碳场景
        if nYear<=6
            seg1_rate1 = random(makedist('Triangular','a',Imin1,'b',  Imed1,'c',Imax1),1,nYear);
            seg1_rate2 = random(makedist('Triangular','a',EImin1,'b',  EImed1,'c',EImax1),1,nYear);
            seg1_rate3 = random(makedist('Triangular','a',ECImin1,'b',  ECImed1,'c',ECImax1),1,nYear);
            
            rate1=seg1_rate1;          
            rate2=seg1_rate2;
            rate3=seg1_rate3;
            
        elseif nYear<=11
            seg1_rate1 = random(makedist('Triangular','a',Imin1,'b',  Imed1,'c',Imax1),1,6);
            seg1_rate2 = random(makedist('Triangular','a',EImin1,'b',  EImed1,'c',EImax1),1,6);
            seg1_rate3 = random(makedist('Triangular','a',ECImin1,'b',  ECImed1,'c',ECImax1),1,6);
            
            seg2_rate1 = random(makedist('Triangular','a',Imin2,'b',  Imed2,'c',Imax2),1,nYear-6);
            seg2_rate2 = random(makedist('Triangular','a',EImin2,'b',  EImed2,'c',EImax2),1,nYear-6);
            seg2_rate3 = random(makedist('Triangular','a',ECImin2,'b',  ECImed2,'c',ECImax2),1,nYear-6);
            
            rate1=[seg1_rate1, seg2_rate1];
            rate2=[seg1_rate2, seg2_rate2];
            rate3=[seg1_rate3, seg2_rate3];  
            
        elseif nYear<=16
            seg1_rate1 = random(makedist('Triangular','a',Imin1,'b',  Imed1,'c',Imax1),1,6);
            seg1_rate2 = random(makedist('Triangular','a',EImin1,'b',  EImed1,'c',EImax1),1,6);
            seg1_rate3 = random(makedist('Triangular','a',ECImin1,'b',  ECImed1,'c',ECImax1),1,6);
            
            seg2_rate1 = random(makedist('Triangular','a',Imin2,'b',  Imed2,'c',Imax2),1,5);
            seg2_rate2 = random(makedist('Triangular','a',EImin2,'b',  EImed2,'c',EImax2),1,5);
            seg2_rate3 = random(makedist('Triangular','a',ECImin2,'b',  ECImed2,'c',ECImax2),1,5);
            
            seg3_rate1 = random(makedist('Triangular','a',Imin3,'b',  Imed3,'c',Imax3),1,nYear-11);
            seg3_rate2 = random(makedist('Triangular','a',EImin3,'b',  EImed3,'c',EImax3),1,nYear-11);
            seg3_rate3 = random(makedist('Triangular','a',ECImin3,'b',  ECImed3,'c',ECImax3),1,nYear-11);
            
            rate1=[seg1_rate1, seg2_rate1, seg3_rate1];
            rate2=[seg1_rate2, seg2_rate2, seg3_rate2];
            rate3=[seg1_rate3, seg2_rate3, seg3_rate3];    
            
        else
            seg1_rate1 = random(makedist('Triangular','a',Imin1,'b',  Imed1,'c',Imax1),1,6);
            seg1_rate2 = random(makedist('Triangular','a',EImin1,'b',  EImed1,'c',EImax1),1,6);
            seg1_rate3 = random(makedist('Triangular','a',ECImin1,'b',  ECImed1,'c',ECImax1),1,6);
            
            seg2_rate1 = random(makedist('Triangular','a',Imin2,'b',  Imed2,'c',Imax2),1,5);
            seg2_rate2 = random(makedist('Triangular','a',EImin2,'b',  EImed2,'c',EImax2),1,5);
            seg2_rate3 = random(makedist('Triangular','a',ECImin2,'b',  ECImed2,'c',ECImax2),1,5);
            
            seg3_rate1 = random(makedist('Triangular','a',Imin3,'b',  Imed3,'c',Imax3),1,5);
            seg3_rate2 = random(makedist('Triangular','a',EImin3,'b',  EImed3,'c',EImax3),1,5);
            seg3_rate3 = random(makedist('Triangular','a',ECImin3,'b',  ECImed3,'c',ECImax3),1,5);
            
            seg4_rate1 = random(makedist('Triangular','a',Imin4,'b',  Imed4,'c',Imax4),1,nYear-16);
            seg4_rate2 = random(makedist('Triangular','a',EImin4,'b',  EImed4,'c',EImax4),1,nYear-16);
            seg4_rate3 = random(makedist('Triangular','a',ECImin4,'b',  ECImed4,'c',ECImax4),1,nYear-16);
            
            rate1=[seg1_rate1, seg2_rate1, seg3_rate1 seg4_rate1];
            
            rate2=[seg1_rate2, seg2_rate2, seg3_rate2 seg4_rate2];
            rate3=[seg1_rate3, seg2_rate3, seg3_rate3 seg4_rate3];   
            
        end
        C=C0;                            %初始碳排放量
        for i=1:nYear
            dRate = (1+0.01*rate1(i))*(1+0.01*rate2(i))*(1+0.01*rate3(i))-1;   % 模拟碳排放变化率
            dC = C*dRate;                %计算碳排放变化
            C=C+dC;                      %计算这一年的碳排放
        end
        C1(nYear,j)=C;               % 将每年的预测碳排放数据记录在C1中
    end
end
C2=mean(C1');                      % 计算每年碳排放的均值
%% 画图
% plot(C2','-o');                    % 15年期间碳排放均值趋势图

% xlswrite('tech3.xlsx',C2);
% save_data=[C1(11,1:10:100000);C1(21,1:10:100000)];
% xlswrite('tech3_twoYears.xlsx',save_data);

% sign = ['k-s';'k-o';'k-^';'k-*';'k-.'];
% for i=1:5
%     data=C1(4*i+1,:);
%     [mu,sigma]=normfit(data);
%     x= 8000:40:20000;
%     y= pdf('Normal', x, mu,sigma);
%     plot(x, y, sign(i,:));
%     hold on;
% end
% xlabel('碳排放/万吨');
% ylabel('概率密度');
% legend('2024','2028','2032','2036','2040');
% % 
% x=[2020:1:2040];
% figure;
% for i=1:2500:100000
%     scatter(x,C1(:,i),'blue');
%     hold on;
% end
% ax = gca;
% ax.YAxis.Exponent = 4;
% xlabel('年份');
% ylabel('碳排放/万吨');  


