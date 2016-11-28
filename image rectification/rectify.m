startup_rvc % Using pter corke machine vision toolbox

%%%%%%%%%%%%%%%%%%%%%%%%%% For white board 001.bmp %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

white_board = imread('white board 001.bmp'); % reading image

p1 = [0,0;721,0;721,470;0,470];  % from world co-ordinates
p2 = [319,179;1244,122;1482,808;608,1134];  % corresponding pixel co-ordinates

H = homography(p1,p2); % finding homography matrix

new_white_board = homwarp(H,white_board,'full'); % warping the image

imwrite(new_white_board,'white board 001_corrected.bmp','bmp'); % writing corrected image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% For hallway001.bmp %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hallway = imread('hallway001.bmp'); % reading image

p1 = [0,0;413,0;413,313;0,313];  % from world co-ordinates
p2 = [141,464;928,366;946,1102;131,1102];  % corresponding pixel co-ordinates

H = homography(p1,p2); % finding homography matrix

new_hallway = homwarp(H,hallway,'full'); % warping the image

imwrite(new_hallway,'hallway001_corrected.bmp','bmp'); % writing corrected image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




