clear all;
clc;

premium = [22.4, 24.5,21.6,22.4,24.8,21.7,23.4,23.3,21.6,20.0];
regular = [17.7,19.6,12.1,15.4,14.0,14.8,19.6,14.8,12.6,12.2];
N1 = length(premium);
N2 = length(regular);
alpha = input("significance level: ");
quantile1 = finv(alpha / 2, N1 - 1, N2 - 1)
quantile2 = finv(1 - alpha / 2, N1 - 1, N2 - 1)

%a)
[H,P,CI, STATS] = vartest2(premium, regular, alpha, 0)
if STATS.fstat < quantile1 || STATS.fstat > quantile2
    fprintf("No the variances are not equal\n");
    [H,P,CI, STATS] = ttest2(premium, regular, alpha, 1, "unequal")
    if H == 1
        fprintf("Gas mileage of premium on average is greater\n");
        
    else
        fprintf("Gas mileage of premium on average is the same");
        %fprintf("The gas milage is not higher when premium gasoline is used\n");
    end
    
else
    fprintf("The variances are equal\n");
    quantilertt = tinv(1-alpha, N1+N2-2)
    [H,P,CI, STATS] = ttest2(premium, regular, alpha, 1, "equal")
    if H == 1 && quantilertt < STATS.tstat %inside the rejection region
        fprintf("Gas mileage of premium on average is greater\n");
        
    else
        fprintf("Gas mileage of premium on average is the same");
        %fprintf("The gas milage is not higher when premium gasoline is used\n");
    end
        %fprintf("The gas milage is not higher when premium gasoline is used\n");
end


