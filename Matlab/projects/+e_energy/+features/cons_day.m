% This file is part of the project CLASS (https://github.com/beckel/class).
% Licence: GPL 2.0 (http://www.gnu.org/licenses/gpl-2.0.html)
% Copyright: ETH Zurich & TU Darmstadt, 2012
% Authors: Christian Beckel (beckel@inf.ethz.ch), Leyna Sadamori (sadamori@inf.ethz.ch)

% average consumption during day (06am - 10pm)
function feature = cons_day(consumption)
    if (strcmp(consumption, 'dim'))
		feature = 7;
    elseif (strcmp(consumption, 'input_dim'))
        feature = 48*7;
    else
		feature = zeros(7,1);
        for i=1:7
            start = (i-1) * 48 + 13;
            stop = (i-1) * 48 + 44;
            indices = start : stop;
            feature(i) = mean(consumption(indices));
            
            if (feature(i) > 1.5)
                feature(i) = 1.5;
            end
        end
        
        
    end
end 
   