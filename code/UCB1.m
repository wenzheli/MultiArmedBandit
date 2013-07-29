function [regret, pulls]= UCB1(k, arms,std,rounds)
%    The function implements UCB1 policy for multi-armed bandit problems
%     Input: 
%         k:  number of arms
%         std:  standard deviation
%         rounds: number of trials
%     Output: 
%         regret: regret for each round. row vector 
%         pulls: number of pulls for each arm

optimal = max(arms);         % the reward for optimal arm
pulls = zeros(k,1);          % initialize pulls
regret = zeros(1,rounds); 
average = zeros(k,1);
% Play each machine once
for i=1:k
    pulls(i) = pulls(i) + 1;
    average(i) = normrnd(arms(i),std(i));
    regret(1,i) = optimal - arms(i);
end

% play machine j that maximize average_xj + sqrt(2*lgn/nj)
for i = k+1:rounds
    % select the arm to pull
    temp = zeros(k,1);
    index = 1;
    m = 0;
    for j=1:k
        temp(j) = average(j,1) + sqrt(2*log(i)/pulls(j,1));
        if m < temp(j)
            m = temp(j);
            index = j;
        end
    end
    
    % play arm with index
    regret(1,i) = optimal - arms(index);
    average(index) = (average(index) * pulls(index) + normrnd(arms(index),std))/(pulls(index)+1);
    pulls(index) = pulls(index) + 1;
end




