clear all;
clc;
clf;
option = input('What model do you want to use:\n normal/student/chi2/fisher: ', 's');
switch(option)
    case 'normal'
        fprintf("Normal model\n");
        mu = input('First parameter: ');
        sgma = input('Second parameter: ');
        a1 = normcdf(0, mu, sgma);
        
        fprintf("P(X<=0)= %9.5f\n", a1);
        a2 = 1 - a1;
        fprintf("P(X>=0)= %9.5f\n", a2);

        b1 = normcdf(1, mu,sgma)- normcdf(-1, mu, sgma);
        fprintf("P(-1<=X<=1)= %9.5f\n", b1);
        b2 = 1 - b1;
        fprintf("P(X <= -1 or X >= 1)= %9.5f\n", b2);
        
        alph = input("Percentage you want to achieve alpha = ");
        c1 = norminv(alph, mu, sgma);
        fprintf("X = %9.5f\n", c1);
        beta = input("Percentage you want to at least achieve P(X >= ?) = beta, beta = ");
        d1 = norminv((1-beta), mu, sgma);
        fprintf("X = %9.5f\n", d1);
    case 'student'
        fprintf("Student model");
        n = ("First parameter: ");
        a1 = tcdf(0, n);
        fprintf("P(X<=0) = %9.5f\n", a1);
        a2 = 1 - a1;
        fprintf("P(X>0) = %9.5f\n", a2);

        b1 = tcdf(1, n) - tcdf(-1, n);
        fprintf("P(-1<=X<=1)= %9.5f\n", b1);
        b2 = 1 - b1;
        fprintf("P(X<=-1 or X>=1)= %9.5f\n", b2);
        alph = input("Percentage you want to achieve: ");
        c1 = tinv(alph, n);
        fprintf("X = %9.5f", c1);
        beta = input("Percentage you want to achieve at least P(X >= ?) = beta, beta = ");
        d1 = tinv((1-beta), n);
        fprintf("X = %9.5f\n", d1);
    case 'chi2'
        fprintf("Chi2 model")
        n = ("First parameter: ");
        a1 = chi2cdf(0, n);
        fprintf("P(X<=0) = %9.5f\n", a1);
        a2 = 1 - a1;
        fprintf("P(X>0) = %9.5f\n", a2);

        b1 = chi2cdf(1, n) - chi2cdf(-1, n);
        fprintf("P(-1 <= X <= 1) = %9.5f\n", b1);
        b2 = 1 - b1;
        fprintf("P(X <= -1 or 1 <= X) = %9.5f\n", b2);
        alph = input("Percentage you want to achieve alpha: ");
        c1 = chi2inv(alph, n);
        fprintf("X = %9.5f\n", c1);
        beta = input("Percentage you want to achieve at least achieve beta: ");
        d1 = chi2inv((1 - beta), n);
        fprintf("X = %9.5f\n", d1);
    case 'fisher'
        fprintf("Fisher model\n")
        m = input('First parameter:');
        n = input('Second parameter: ');
        a1 = fcdf(0, m,n);
        fprintf("P(X<=0) = %9.5f\n", a1);
        a2 = 1 - a1;
        fprintf("P(X>0) = %9.5f\n", a2);
        b1 = fcdf(1, m,n) - fcdf(-1, m,n);
        fprintf("P(-1 <= X <= 1) = %9.5f\n", b1);
        b2 = 1 - b1;
        fprintf("P(X <= -1 or 1 <= X) = %9.5f\n", b2);
        alph = input('Percentage you want to achieve alpha: ');
        c1 = finv(alph, m, n);
        beta = input('Percentage you want to achieve at least beta: ');
        d1 = finv((1-beta), m, n);
        fprintf("X = %9.5f\n", d1);
    otherwise
        fprintf("Invalid option!")
end






