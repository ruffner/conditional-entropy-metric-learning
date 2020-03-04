
methods = {'CEML(proposed method)','ITML','NCA','MCML','LMNN','invCov','Euclidean'};
datasets = {'Wine','Ionosphere','Scale','Iris'};
load results_wineData
errors = [mean([acc.CEML])  mean([acc.ITML]) mean([acc.NCA]) mean([acc.MCML]) mean([acc.LMNN]) mean([acc.invCov]) mean([acc.Euclidean])]; 
load results_ionosphereData
errors = [ errors; [mean([acc.CEML])  mean([acc.ITML]) mean([acc.NCA]) mean([acc.MCML]) mean([acc.LMNN]) mean([acc.invCov]) mean([acc.Euclidean])] ]; 
load results_balanceData
errors = [ errors; [mean([acc.CEML])  mean([acc.ITML]) mean([acc.NCA]) mean([acc.MCML]) mean([acc.LMNN]) mean([acc.invCov]) mean([acc.Euclidean])] ]; 
load results_irisData
errors = [ errors; [mean([acc.CEML])  mean([acc.ITML]) mean([acc.NCA]) mean([acc.MCML]) mean([acc.LMNN]) mean([acc.invCov]) mean([acc.Euclidean])] ]; 
errors = 1 - errors;


figure
h = bar(errors,'group')
legend(methods)
grid on
set(gca,'XTickLabel',datasets)
ylabel('Error')