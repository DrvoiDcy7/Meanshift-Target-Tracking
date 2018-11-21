% Transformat the video to pictures by frame
% Customize the video name and your file path, make sure it's correct in the following process
% For lab1 and lab2, just modify the source video file

clear,clc
obj = VideoReader('D:/matlab/data/meanshift/Mean shift tracking 3.mp4');
numFrames = obj.NumberOfFrames;
 for k = 1 : 200     
     frame = read(obj,k); imwrite(frame,strcat('D:/matlab/data/meanshift/img',num2str(k),'.jpg'),'jpg');
 end
