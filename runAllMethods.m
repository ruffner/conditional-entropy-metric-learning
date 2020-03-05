%% RUN ALL THE METHODS


% use 1 fold to use all data 

num_runs = 1;
num_folds = 1;
knn_neighbor_size = 4;


for i  = 1:num_runs
  
    
    %%% Conditional Entropy Metric Learning (Proposed Method)
    d_y = 3;
    d_y = length(unique(labels_orig));
    sigma = sqrt(d_y);
    alpha = 1.01;
    acc(i).CEML = CrossValidateKNN2(labels, X, @(labels, X) CondEntropyMetricLearning(X, labels, 3, sigma, alpha), knn_neighbor_size, yTest, xTest);
    disp(sprintf('CEML kNN cross-validated accuracy = %f', acc(i).CEML));
    
    %%% Information Theoretic Metric Learning (Davis 2007)
    acc(i).ITML = CrossValidateKNN2(labels, X, @(labels,X) MetricLearningAutotuneKnn(@ItmlAlg, labels, X), knn_neighbor_size, yTest, xTest);
    disp(sprintf('ITML kNN cross-validated accuracy = %f', acc(i).ITML));
    
    %%% Neigbourghood Component Analys (Goldberger 2004)
    acc(i).NCA = CrossValidateKNN2(labels, X, @(labels, X) ncaWrap(X, labels, 3), knn_neighbor_size, yTest, xTest);
    disp(sprintf('NCA kNN cross-validated accuracy = %f', acc(i).NCA));
    
    %%% Maximally Collapsing Metric Learning (Globerson 2005)
    acc(i).MCML = CrossValidateKNN2(labels, X, @(labels, X) mcmlWrap(X, labels, 1), knn_neighbor_size, yTest, xTest);
    disp(sprintf('MCML kNN cross-validated accuracy = %f', acc(i).MCML));
    
    
    %%% Large Margin Nearest Neighbor (Weinberger 2005)
    acc(i).LMNN = CrossValidateKNN2(labels, X, @(labels, X) lmnnWrap(X, labels, 1), knn_neighbor_size, yTest, xTest);
    disp(sprintf('LMNN kNN cross-validated accuracy = %f', acc(i).LMNN));
    
    
    %%% Inverse Covariance (Whitening)
    acc(i).invCov = CrossValidateKNN2(labels, X, @(labels, X) invCovWrap(X, labels), knn_neighbor_size, yTest, xTest);
    disp(sprintf('InvCov kNN cross-validated accuracy = %f', acc(i).invCov));
    
    
    %%% Eucledian Distance
    acc(i).Euclidean = CrossValidateKNN2(labels, X, @(labels, X) euclideanWrap(X, labels), knn_neighbor_size, yTest, xTest);
    disp(sprintf('Euclidean kNN cross-validated accuracy = %f', acc(i).Euclidean));
    

end
