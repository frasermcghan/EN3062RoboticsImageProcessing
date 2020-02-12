% student_name:   Fraser McGhan
% student_number: C1629329

function [ret] = fiducialprojection2(X, Y, Z, focallength)

% X, Y, Z: object coordinate in the world frame
% focallength: camera focal length
% ret: the projected coordinate of [X,Y,Z] on the image plane

ret = [0, 0];    % initial value [0, 0]

% ... start your code now ...

% define camera model
cam = CentralCamera('focal', focallength);

% define point in world frame
P = [X, Y, Z]';

% calculate image-plane coordinates when camera has been moved
ret = cam.project(P, 'pose', SE3(0.03, 0, 0.3));

% ret should be calculated and update above this line
% ... end of the code ...






    

 