function  [portfolios,ln_size,ln_beme] = Dataprocess(portfolios,Size,BEME,n,T)

for i = 1:T
    for j = 1:n
        if portfolios(i,j) == -99.99 || portfolios(i,j) == -999
            portfolios(i,j) = NaN;
        end
    end
end
for i = 1:T
    for j = 1:n
        if Size(i,j) < 0
            Size(i,j) = NaN;
        end
    end
end
ln_size = log(Size);
for i = 1:91
    for j = 1:n
        if BEME(i,j) < 0
            BEME(i,j) = NaN;
        end
    end
end

BEME1 = zeros(T,n);
for i = 1:6
    BEME1(i,:) = BEME(1,:);
end
for i = 1:89
    for j = 1:12
        BEME1(6+(i-1)*12+j,:) = BEME(i+1,:);
    end
end
for j = 1:11
        BEME1(6+89*12+j,:) = BEME(91,:);
end
ln_beme = log(BEME1);
