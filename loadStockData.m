function [dates,data,R_m,r_f,Size,BEME] = loadStockData(path)

data = xlsread(path,3,'B8:AX1092');

date = xlsread(path,3,'A8:A1092');
date = num2str(date)
dates = datenum(date,'yyyymm');

r_f = xlsread(path,1,'C7:C1091');
R_m = xlsread(path,1,'B7:B1091');

Size = xlsread(path,3,'BA8:CW1092');
BEME = xlsread(path,3,'CZ8:EV98');