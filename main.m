% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

% %% Exercise1
% % input values
% T = 1085;
% n = 49;
% % Compute values
% [dates,portfolios,R_m,r_f,Size,BEME] = loadStockData('C:\Users\wc145\Desktop\ECON676\PS3\Problem_Set3.xls');
% % missing data 
% [portfolios,ln_size,ln_beme] = Dataprocess1(portfolios,Size,BEME,n,T);
% % R_i
% % R_i = zeros(T,n);
% % for j = 1:n
% %     R_i(:,j) = portfolios(:,j)-r_f;
% % end
% R_i = portfolios;
% % estimate betas
% b = zeros(n,2);
% for j = 1:n
%     b(j,:) = regress(R_i(:,j),[ones(T,1) R_m]);
% end
% % b estimate gammas
% gamma = zeros(T,2);
% for i = 1:T
%     gamma(i,:) = regress(R_i(i,:)',[ones(n,1) b(:,2)]);
% end
% Ave_gamma_0 = mean(gamma(:,1));
% Ave_gamma_M = mean(gamma(:,2));
% Ste_gamma_0 = std(gamma(:,1))/sqrt(T);
% Ste_gamma_M = std(gamma(:,2))/sqrt(T);
% tstat_gamma_0 = Ave_gamma_0/Ste_gamma_0;
% tstat_gamma_M = Ave_gamma_M/Ste_gamma_M;
% % c estimate gammas
% Ave_R_i = zeros(n,1);
% for j = 1:n
%     Ave_R_i(j,1) = nanmean(R_i(:,j));
% end
% gamma_c = regress(Ave_R_i,[ones(n,1) b(:,2)]);
% re = fitlm(b(:,2),Ave_R_i);
% CM = re.CoefficientCovariance;
% Ste_gamma_c = diag(sqrt(CM));
% % f estimate gammas
% gamma_f = zeros(T-6,4);
% for i = 1:T-6
%     gamma_f(i,:) = regress(R_i(i+6,:)',[ones(n,1) b(:,2) ln_size(i+5,:)' ln_beme(i+6,:)']);
% end
% Ave_gamma_f_0 = mean(gamma_f(:,1));
% Ave_gamma_f_M = mean(gamma_f(:,2));
% Ave_gamma_f_size = mean(gamma_f(:,3));
% Ave_gamma_f_beme = mean(gamma_f(:,4));
% Ste_gamma_f_0 = std(gamma_f(:,1))/sqrt(T-6);
% Ste_gamma_f_M = std(gamma_f(:,2))/sqrt(T-6);
% Ste_gamma_f_size = std(gamma_f(:,3))/sqrt(T-6);
% Ste_gamma_f_beme = std(gamma_f(:,4))/sqrt(T-6);
% tstat_gamma_f_0 = Ave_gamma_f_0/Ste_gamma_f_0;
% tstat_gamma_f_M = Ave_gamma_f_M/Ste_gamma_f_M;
% tstat_gamma_f_size = Ave_gamma_f_size/Ste_gamma_f_size;
% tstat_gamma_f_beme = Ave_gamma_f_beme/Ste_gamma_f_beme;
% % Make plots
% plot1d(Ave_R_i,b);
% %% Exercise 2
% % input values
% T = 1085;
% n = 25;
% % Compute values
% [dates,portfolios,R_m,r_f,Size,BEME] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS3\Problem_Set3.xls');
% % missing data 
% [portfolios,ln_size,ln_beme] = Dataprocess1(portfolios,Size,BEME,n,T);
% % R_i
% % R_i = zeros(T,n);
% % for j = 1:n
% %     R_i(:,j) = portfolios(:,j)-r_f;
% % end
% R_i = portfolios;
% % estimate betas
% b = zeros(n,2);
% for j = 1:n
%     b(j,:) = regress(R_i(:,j),[ones(T,1) R_m]);
% end
% % b estimate gammas
% gamma = zeros(T,2);
% for i = 1:T
%      gamma(i,:) = regress(R_i(i,:)',[ones(n,1) b(:,2)]);
% end
% Ave_gamma_0 = mean(gamma(:,1));
% Ave_gamma_M = mean(gamma(:,2));
% Ste_gamma_0 = std(gamma(:,1))/sqrt(T);
% Ste_gamma_M = std(gamma(:,2))/sqrt(T);
% tstat_gamma_0 = Ave_gamma_0/Ste_gamma_0;
% tstat_gamma_M = Ave_gamma_M/Ste_gamma_M;
% % c estimate gammas
% Ave_R_i = zeros(n,1);
% for j = 1:n
%     Ave_R_i(j,1) = nanmean(R_i(:,j));
% end
% gamma_c = regress(Ave_R_i,[ones(n,1) b(:,2)]);
% re = fitlm(b(:,2),Ave_R_i);
% CM = re.CoefficientCovariance;
% Ste_gamma_c = diag(sqrt(CM));
% % f estimate gammas
% gamma_f = zeros(T-6,4);
% for i = 1:T-6
%      gamma_f(i,:) = regress(R_i(i+6,:)',[ones(n,1) b(:,2) ln_size(i+5,:)' ln_beme(i+6,:)']);
% end
% Ave_gamma_f_0 = mean(gamma_f(:,1));
% Ave_gamma_f_M = mean(gamma_f(:,2));
% Ave_gamma_f_size = mean(gamma_f(:,3));
% Ave_gamma_f_beme = mean(gamma_f(:,4));
% Ste_gamma_f_0 = std(gamma_f(:,1))/sqrt(T-6);
% Ste_gamma_f_M = std(gamma_f(:,2))/sqrt(T-6);
% Ste_gamma_f_size = std(gamma_f(:,3))/sqrt(T-6);
% Ste_gamma_f_beme = std(gamma_f(:,4))/sqrt(T-6);
% tstat_gamma_f_0 = Ave_gamma_f_0/Ste_gamma_f_0;
% tstat_gamma_f_M = Ave_gamma_f_M/Ste_gamma_f_M;
% tstat_gamma_f_size = Ave_gamma_f_size/Ste_gamma_f_size;
% tstat_gamma_f_beme = Ave_gamma_f_beme/Ste_gamma_f_beme;
% % Make plots
% plot1d(Ave_R_i,b);
% %% Exercise 3
% % input values
% T = 1085;
% n = 25;
% % Compute values
% [dates,portfolios,R_m,r_f,Size,BEME] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS3\Problem_Set3.xls');
% % missing data 
% [portfolios,ln_size,ln_beme] = Dataprocess1(portfolios,Size,BEME,n,T);
% % R_i
% % R_i = zeros(T,n);
% % for j = 1:n
% %     R_i(:,j) = portfolios(:,j)-r_f;
% % end
% R_i = portfolios;
% % sample mean and covariance, TP
% mean_r = zeros(n,1);
% for j = 1:n
%     mean_r(j,1) = nanmean(R_i(:,j));
% end
% Rf = nanmean(r_f);
% CovMatrix_r = cov(R_i);
% [frontier,MVP,MVP_w, TanP, TanP_w]= mvp(mean_r', CovMatrix_r, Rf, 0, 'TitleString', 'PlotName');
% r_tp = portfolios * TanP_w;
% R_tp = r_tp-r_f;
% % estimate betas
% b = zeros(n,2);
% for j = 1:n
%     b(j,:) = regress(R_i(:,j),[ones(T,1) R_tp]);
% end
% % c estimate gammas
% Ave_R_i = zeros(n,1);
% for j = 1:n
%     Ave_R_i(j,1) = nanmean(R_i(:,j));
% end
% gamma_c = regress(Ave_R_i,[ones(n,1) b(:,2)]);
% re = fitlm(b(:,2),Ave_R_i);
% CM = re.CoefficientCovariance;
% Ste_gamma_c = diag(sqrt(CM));
% % % Make plots
% plot1d(Ave_R_i,b);
%% Exercise 4
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