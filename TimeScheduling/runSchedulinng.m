function [solution,chromosome,noConflicts,fitnessValue,noAssignments,assignmentEffeciency] = runSchedulinng(filename,noGenerations)

global values;
global description
readInput(filename);
options = gaoptimset('PopulationType','bitstring','Display','iter','UseParallel','never','Vectorized','off','PlotFcns',{@gaplotbestindiv,@myPlotFcn});
if nargin > 1
 options = gaoptimset(options,'Generations',noGenerations);
end;

n = length(values);
[chromosome, fitnessValue] = ga(@(x)fitness(x),n,[],[],[],[],[],[],[],options);
noAssignments = sum(chromosome);
solution = cell(noAssignments+1,5);
for k = 1:5
    solution{1,k} = description{k};
end;

j = 2;
for i = 1:n
    if chromosome(i) == 1
        for k = 1:5
        solution{j,k} =  values{i}(k);
        end;
        j = j + 1;
    end;
end;
noConflicts = conflicts(chromosome);
%% TODO calculate Assignment Effeciency
assignmentEffeciency = 0;
%% TODO check if solution is surly not optimal
%% TODO write report function 
%% TODO myPlotFcn implemntation