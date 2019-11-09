function [dates,data,R_m,r_f,Size,BEME] = loadStockData1(path)

data = xlsread(path,2,'B4:Z1088');

date = xlsread(path,3,'A8:A1092');
date = num2str(date)
dates = datenum(date,'yyyymm');

r_f = xlsread(path,1,'C7:C1091');
R_m = xlsread(path,1,'B7:B1091');

Size = xlsread(path,2,'AC4:BA1088');
BEME = xlsread(path,2,'BD4:CB94');