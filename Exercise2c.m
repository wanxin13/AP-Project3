% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;
%% Exercise 2C
% input values
T = 1085;
n = 25;
% Compute values
[dates,portfolios,R_m,r_f,Size,BEME] = loadStockData2('C:\Users\wc145\Desktop\ECON676\PS3\Problem_Set3.xls');
% missing data 
[portfolios,ln_size,ln_beme] = Dataprocess1(portfolios,Size,BEME,n,T);
% odd months in even years and even months in odd years
j = 1; k =1;
portfoliosA = zeros(543,n);
portfoliosB = zeros(542,n);
r_f_A = zeros(543,1);
r_f_B = zeros(542,1);
for i = 1:T
    if (mod(floor(portfolios(i,1)/100)+1,2) && mod(portfolios(i,1),2))||(mod(floor(portfolios(i,1)/100),2) && mod(portfolios(i,1)+1,2))
        portfoliosA(j,:) = portfolios(i,2:end);
        r_f_A(j,1)= r_f(i,1);
        j = j+1;
    end
end
for i = 1:T
    if (mod(floor(portfolios(i,1)/100)+1,2) && mod(portfolios(i,1)+1,2))||(mod(floor(portfolios(i,1)/100),2) && mod(portfolios(i,1),2))
        portfoliosB(k,:) = portfolios(i,2:end);
        r_f_B(k,1)= r_f(i,1);
        k = k+1;
    end
end        
% R_i
% R_i = zeros(T,n);
% for j = 1:n
%     R_i(:,j) = portfolios(:,j)-r_f;
% end
R_i = portfolios(:,2:end);
R_i_A = portfoliosA;
% sample mean and covariance, TP
mean_r_A = zeros(n,1);
for j = 1:n
    mean_r_A(j,1) = nanmean(R_i_A(:,j));
end
Rf_A = nanmean(r_f_A);
CovMatrix_r_A = cov(R_i_A);
[frontier,MVP,MVP_w, TanP, TanP_w_A]= mvp(mean_r_A', CovMatrix_r_A, Rf_A, 0, 'TitleString', 'PlotName');
R_i_B = portfoliosB;
% sample mean and covariance, TP
mean_r_B = zeros(n,1);
for j = 1:n
    mean_r_B(j,1) = nanmean(R_i_B(:,j));
end
Rf_B = nanmean(r_f_B);
CovMatrix_r_B = cov(R_i_B);
[frontier,MVP,MVP_w, TanP, TanP_w_B]= mvp(mean_r_B', CovMatrix_r_B, Rf_B, 0, 'TitleString', 'PlotName');
for i = 1:T
    if (mod(floor(portfolios(i,1)/100)+1,2) && mod(portfolios(i,1),2))||(mod(floor(portfolios(i,1)/100),2) && mod(portfolios(i,1)+1,2))
        r_tp(i,1) = portfolios(i,2:end)*TanP_w_B;
    end
end
for i = 1:T
    if (mod(floor(portfolios(i,1)/100)+1,2) && mod(portfolios(i,1)+1,2))||(mod(floor(portfolios(i,1)/100),2) && mod(portfolios(i,1),2))
        r_tp(i,1) = portfolios(i,2:end)*TanP_w_A;
    end
end        
R_tp = r_tp-r_f;
% estimate betas
b = zeros(n,2);
for j = 1:n
    b(j,:) = regress(R_i(:,j),[ones(T,1) R_tp]);
end
% c estimate gammas
Ave_R_i = zeros(n,1);
for j = 1:n
    Ave_R_i(j,1) = nanmean(R_i(:,j));
end
gamma_c = regress(Ave_R_i,[ones(n,1) b(:,2)]);
re = fitlm(b(:,2),Ave_R_i);
CM = re.CoefficientCovariance;
Ste_gamma_c = diag(sqrt(CM));
% % Make plots
plot1d(Ave_R_i,b);