% This file is part of the project CLASS (https://github.com/beckel/class).
% Licence: GPL 2.0 (http://www.gnu.org/licenses/gpl-2.0.html)
% Copyright: ETH Zurich & TU Darmstadt, 2012
% Authors: Christian Beckel (beckel@inf.ethz.ch), Leyna Sadamori (sadamori@inf.ethz.ch)

function [t, distance] = classify_svm(sC)

    svm_scaling_factor = 0.2;
    
    if (strcmp(sC, 'supports_distance'))
        t = 1;
        return;
    end
    
    options = '';
 	options = [options, ' -h 1']; % use no shrinking heuristic
%  	options = [options, ' -t 2']; % kernel type
    options = [options, ' -b 1']; % output probabilities
% 	options = [options, ' -m 500']; % memory size
%   options = [options, ' -s 0']; % svm type
    options = [options, ' -q']; % quiet mode
    
    num_samples = length(sC.training_truth);
    s = RandStream('mcg16807','Seed',0);
    RandStream.setGlobalStream(s); 
    rand_inds = randperm(num_samples, uint32(num_samples*svm_scaling_factor));
    
    training_truth = sC.training_truth(rand_inds)';
    training_set = sC.training_set(rand_inds)';

    model = svmtrain(training_truth, training_set, options);
    
    [predict_label, ~, class_probabilities] = svmpredict(sC.test_truth', sC.test_set', model, '-b 1');
    t = predict_label';
    distance = class_probabilities(:,1);

end
