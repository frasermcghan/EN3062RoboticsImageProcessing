% student_name:   Fraser McGhan
% student_number: C1629329

function [ret] = fiducialprojection(X, Y, Z, focallength)

% X, Y, Z: object coordinate in the world frame
% focallength: camera focal length
% ret: the projected coordinate of [X,Y,Z] on the image plane

ret = [0, 0];    % initial value [0, 0]

% ... start your code now ...

% define camera model
cam = CentralCamera('focal', focallength);

% define point in world frame
P = [X, Y, Z]';

% calculate image-plane coordinates
ret = cam.project(P);

% ret should be calculated and update above this line
% ... end of the code ...
