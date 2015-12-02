% This is the main file that will call the functions to generate data, Pla
% algorithm and the pseudoinverse algorithm for linear regression.

for N = [10, 50, 100, 200, 500, 1000]
    
    iterations1 = []; %vector for number of iterations for PLA without weight initialization
    iterations2 = []; %vector for number of iterations for PLA with weight initialization using linear regression
    avg = zeros([2 1]);
    title('Average iterations');
    xlabel('# of iterations');
    ylabel('# of training data (N)');
    hold on;
    fprintf('\nResult for N = %d :',N);
    for i = 1 :100
        
        %calls the function to generate N*2 matrix (X) of points uniformly sampled from
        %[-1,1] to [-1,1] and corresponding vector of labels (Y)
        [X Y] = generateData(N); 

        %call the PLA without initializing weights
        w0 = zeros([3 1]);
        [w iters] = pla(X, Y, w0);
        iterations1 = [iterations1 iters];
        
        %call Pseudoinverse algorithm for linear regression
        w = pseudoinverse(X,Y);

        %call PLA using weight vector from pseudoinverse
        [w iters] = pla(X,Y,w);
        iterations2 = [iterations2 iters];
      
    end
    
    %calculate the average number of iterations for each algorithm
    avg1 = mean(iterations1);   %without initialization
    avg2 = mean(iterations2);   %with initialization using linear regression
    fprintf('\nAverage of number of iterations for PLA without weight initialization: %f',avg1);
    fprintf('\nAverage of number of iterations for PLA with with weight initialization using linear regression: %f\n',avg2);
    scatter(N,avg1,'r','.');
    t = text(N,avg1,num2str(avg1));
    t.FontSize = 8;
    %legend('without initialization','Location','southeast');
    hold on;
    scatter(N,avg2,'r','*');
    x = text(N,avg2,num2str(avg2));
    x.FontSize = 8;
    legend('without initialization','with initialization','Location','southeast');
    hold on;
end
