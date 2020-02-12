%% Question 2
%% Display the kinematics model of "Puma560"

mdl_puma560;

p560.plot([0 0 0 0 0 0])

%% Compute end-effector pose using "fkine"

puma_effector_pose = p560.fkine([30 45 -30 45 90 -45], 'deg');

%% Compute inverse kinematics using "ikine" 

puma_joint_coords = p560.ikine(puma_effector_pose);

% inverse kinematics can be calculated because the puma robot has 6 DoFs.
% notice that the returned values for the joint angles are different to the
% ones used to compute the end-effector pose, this is because there are
% multiple combinations of joint angles that will all result in the same
% end-effector pose. However, the number of possible solutions will be
% reduced in reality as joint angles will be physically constrained by      
% minimum and maximum operating ranges.
