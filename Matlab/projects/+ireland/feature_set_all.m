% This file is part of the project CLASS (https://github.com/beckel/class).
% Licence: GPL 2.0 (http://www.gnu.org/licenses/gpl-2.0.html)
% Copyright: ETH Zurich & TU Darmstadt, 2012
% Authors: Christian Beckel (beckel@inf.ethz.ch), Leyna Sadamori (sadamori@inf.ethz.ch)

function feat_set = feature_set_all(option)
	if (nargin == 0)
		feat_set = {...
			@e_energy.features.cons_day_avg, ...
			@e_energy.features.cons_evening_weekday_avg, ...
			@e_energy.features.cons_morning_weekday_avg, ...
			@e_energy.features.cons_night_weekday_avg, ...
			@e_energy.features.cons_noon_weekday_avg, ...
			@e_energy.features.cons_weekday_avg, ...
			@e_energy.features.cons_weekend_avg, ...
			@e_energy.features.consumption_variability_weekday_avg, ...
			@first_time_above_1000_weekday_avg, ...
			@first_time_above_2000_weekday_avg, ...
			@first_time_daily_max_weekday_avg, ...
			@e_energy.features.max_cons_avg, ...
			@e_energy.features.min_cons_avg, ...
			@e_energy.features.num_peaks_avg, ...
			@time_above_mean_weekday_avg, ...
			@time_above_mean_weekend_avg, ...
			@e_energy.features.variance_avg, ...
            @e_energy.features.ratio_morning_noon_weekday_avg, ...
            @e_energy.features.ratio_evening_noon_weekday_avg, ...
            @e_energy.features.ratio_night_day_avg, ...
            @e_energy.features.ratio_min_avg_avg, ...
			@ratio_workday_weekend, ...
		};
	elseif (nargin == 1)
		if (strcmp(option, 'name'))
			feat_set = 'all';
		else
			error('This option is not supported');
		end
	end
end