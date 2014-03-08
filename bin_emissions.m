function [seq_binned,y] = bin_emissions(seq_unbinned,d)
%BIN_EMISSIONS takes a sequence of real-valued emissions and calculates a
%sequence of discrete emissions by binning the real-valued emissions.
%The bin bounds are given by quantiles.
% INPUT     seq_unbinned    Long sequence of emissions
%           d               Number of bins / emissions
% OUTPUT    seq_binned      Sequence with discrete emissions after binning
%           y               Vector of quantiles
%
% Carl Mattfeld, 2014
% Version 2014-03-08

% Calculate quantiles
y = quantile(seq_unbinned,d-1);

% Bin the emission values according to quantiles using logical operators
seq_binned = (seq_unbinned <= y(1)).*1;
for j=2:(d-1)
    seq_binned = seq_binned +...
        (seq_unbinned > y(j-1) & seq_unbinned <= y(j)).*j;
end
seq_binned = seq_binned + (seq_unbinned > y(d-1)).*d;


end

