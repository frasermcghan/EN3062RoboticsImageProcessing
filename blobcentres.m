% student_name:   Fraser McGhan
% student_number: C1629329

function [ret] = blobcentres(im)

% im: image to be processed
% ret: return [x1, y1; x2, y2]

ret = [0, 0; 0, 0];    % initial value [0, 0, 0, 0]

% ... start your code now ...

% Read in image and convert to greyscale
image = iread(im, 'grey', 'double');

% Apply 3x3 median filter for noise reduction
filtered = irank(image, ones(3,3), 5);

% Determine suitable threshold value (~0.6 for "q2.jpg")
ihist(filtered) 

% Convert to binary image
binary = (filtered > 0.6);

% Display binary image
idisp(binary)

% Identify blobs in image
[label] = ilabel(binary);

% Select blob for region R1
R1 = (label == 2);

% Select blob for region R2
R2 = (label == 3);

% Calcuate moments for R1
R1_m00 = mpq(R1, 0, 0);
R1_m01 = mpq(R1, 0, 1);
R1_m10 = mpq(R1, 1, 0);

% Calculate moment for R2
R2_m00 = mpq(R2, 0, 0);
R2_m01 = mpq(R2, 0, 1);
R2_m10 = mpq(R2, 1, 0);

% Calculate centre coordinates for R1
R1_x = R1_m10 / R1_m00;
R1_y = R1_m01 / R1_m00;

% Calculate centre coordinates for R2
R2_x = R2_m10 / R2_m00;
R2_y = R2_m01 / R2_m00;

% Plot red markers on centres 
plot_point([R1_x, R1_y]', 'rx');
plot_point([R2_x, R2_y]', 'rx');

% Return coordinates of centres
ret = [R1_x, R1_y; R2_x, R2_y]; 

% ret should be calculated and update above this line
% ... end of the code ...
