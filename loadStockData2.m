function [dates,data,R_m,r_f,Size,BEME] = loadStockData2(path)

data = xlsread(path,2,'A4:Z1088');

date = xlsread(path,3,'A8:A1092');
date1 = num2str(date)
dates = datenum(date1,'yyyymm');

r_f = xlsread(path,1,'C7:C1091');
R_m = xlsread(path,1,'B7:B1091');

Size = xlsread(path,2,'AC4:BA1088');
BEME = xlsread(path,2,'BD4:CB94');