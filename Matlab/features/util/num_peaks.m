% This file is part of the project CLASS (https://github.com/beckel/class).
% Licence: GPL 2.0 (http://www.gnu.org/licenses/gpl-2.0.html)
% Copyright: ETH Zurich & TU Darmstadt, 2012
% Authors: Christian Beckel (beckel@inf.ethz.ch), Leyna Sadamori (sadamori@inf.ethz.ch)

% number of peaks: number (on a day) of values with two neighbors that have at least 200mW less consumption
function feature = num_peaks(consumption)
    N = length(consumption);
    D = N/7;
    
    feature = zeros(7,1);
    for i=1:7
        count = 0;
        start = (i-1)*D + 1;
        for j=1:D-2
            b1 = consumption(start+j) - consumption(start+j-1);
            b2 = consumption(start+j) - consumption(start+j+1);
            if b1 > 0.2 && b2 > 0.2
                count = count + 1;
            end
        end

        feature(i) = count;
    end
end
