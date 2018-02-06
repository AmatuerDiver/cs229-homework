function [q, steps_per_episode] = qlearning(episodes)

% set up parameters and initialize q values
alpha = 0.05;
gamma = 0.99;
num_states = 100;
num_actions = 2;
actions = [-1, 1];
q = zeros(num_states, num_actions);

for i=1:episodes,
  [x, s, absorb] =  mountain_car([0.0 -pi/6], 0);
  %%% YOUR CODE HERE
  [maxq, a] = max(q(s,:));
  if q(s,1) == q(s,2)
    a = ceil(rand()*num_actions);
  end 
  steps = 0;
  
  while (~absorb)
     [x, sn, absorb] = mountain_car(x, action(a));
     reward = -double(absorb==0);
     
     [maxq, an] = max(q(sn,:));
     if q(sn,1) == q(sn,2)
       a = ceil(rand()*num_actions);
     end 
     q(s,a) = (1 - alpha)*q(s,a) + alpha*(reward + gamma*maxq);
     a = an;
     s = sn;  
     steps = steps+1;
  end 
  steps_per_episode(i) =  steps;  
end