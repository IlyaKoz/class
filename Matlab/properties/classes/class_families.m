% This file is part of the project CLASS (https://github.com/beckel/class).
% Licence: GPL 2.0 (http://www.gnu.org/licenses/gpl-2.0.html)
% Copyright: ETH Zurich & TU Darmstadt, 2012
% Authors: Christian Beckel (beckel@inf.ethz.ch), Leyna Sadamori (sadamori@inf.ethz.ch)

function sClass = class_families(option)
	if (nargin == 0)
		sClass.classes = { ...
			'Family', ...
			'Other', ...
			};
		sClass.constr = { ...
			'Adults > 1 AND Children > 0', ...
			'Adults < 2 OR Children = 0', ...
			};
	elseif (nargin == 1)
		if (strcmp(option, 'name'))
			sClass = 'Families';
		else
			error('This option is not supported');
		end
	end
end