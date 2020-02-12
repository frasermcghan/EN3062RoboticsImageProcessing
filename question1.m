%% Question 1
%% Derive forward kinematics model

% Define DH-Parameter variables, converting angles to radians
theta1 = deg2rad(30);  d1 = 10.25;  a1 = 0;  alpha1 = deg2rad(90);
theta2 = deg2rad(45);  d2 = 0;      a2 = 9;  alpha2 = 0; 
theta3 = deg2rad(-90); d3 = 0;      a3 = 9;  alpha3 = 0;
theta4 = deg2rad(45);  d4 = 0;      a4 = 0;  alpha4 = deg2rad(90);
theta5 = deg2rad(60);  d5 = 6.25;   a5 = 0;  alpha5 = 0;

% Define homogeneous transform matrix for each coordinate frame
T1 = [cos(theta1) -sin(theta1)*cos(alpha1)   sin(theta1)*sin(alpha1)      a1*cos(theta1);
      sin(theta1)  cos(theta1)*cos(alpha1)  -cos(theta1)*sin(alpha1)      a1*sin(theta1);
                0              sin(alpha1)               cos(alpha1)                  d1;
                0                        0                         0                   1];

T2 = [cos(theta2) -sin(theta2)*cos(alpha2)   sin(theta2)*sin(alpha2)      a2*cos(theta2);
      sin(theta2)  cos(theta2)*cos(alpha2)  -cos(theta2)*sin(alpha2)      a2*sin(theta2);
                0              sin(alpha2)               cos(alpha2)                  d2;
                0                        0                         0                   1];

T3 = [cos(theta3) -sin(theta3)*cos(alpha3)   sin(theta3)*sin(alpha3)      a3*cos(theta3);
      sin(theta3)  cos(theta3)*cos(alpha3)  -cos(theta3)*sin(alpha3)      a3*sin(theta3);
                0              sin(alpha3)               cos(alpha3)                  d3;
                0                        0                         0                   1];

T4 = [cos(theta4) -sin(theta4)*cos(alpha4)   sin(theta4)*sin(alpha4)      a4*cos(theta4);
      sin(theta4)  cos(theta4)*cos(alpha4)  -cos(theta4)*sin(alpha4)      a4*sin(theta4);
                0              sin(alpha4)               cos(alpha4)                  d4;
                0                        0                         0                   1];

T5 = [cos(theta5) -sin(theta5)*cos(alpha5)   sin(theta5)*sin(alpha5)      a1*cos(theta5);
      sin(theta5)  cos(theta5)*cos(alpha5)  -cos(theta5)*sin(alpha5)      a1*sin(theta5);
                0              sin(alpha5)               cos(alpha5)                  d5;
                0                        0                         0                   1];


% Calculate forward kinematics model
T1to5 = T1*T2*T3*T4*T5;

%% Create forward kinematics model using "SerialLink" 

% create each link, NOTE: Link() method assumes all joints are revolute
L(1) = Link([0 d1 a1  alpha1]);
L(2) = Link([0 d2 a2  alpha2]);
L(3) = Link([0 d3 a3  alpha3]);
L(4) = Link([0 d4 a4  alpha4]);
L(5) = Link([0 d5 a5  alpha5]);

robot = SerialLink(L);
robot.name = 'Question 1';

%% Experiment using "teach()"

robot.teach()

% notice that there are no constraints applied to the joints so robot can
% be manipulated into positions that would be impossible in real life

%% Compute end-effector pose at given angles using "fkine"

effector = robot.fkine([theta1 theta2 theta3 theta4 theta5]);

%% Compute inverse kinematics using "ikine"

joint_coords = robot.ikine(effector); 

% an error is raised because the solution space has more dimensions than
% there are joints. Therefore there are no solutions for the
% inverse kinematics of the system as the number of DoFs < 6.
% Another DoF is needed to reach a solution.