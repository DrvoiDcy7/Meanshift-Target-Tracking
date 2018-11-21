# Meanshift-Target-Tracking
  Implement meanshift to track target, analyze good and bad performances  
  College of Electrical Information Engineering, Tongji University  
  Chengyuan Deng, 2017  

  ### Introduction
  This project implemented Meanshift algorithm to track down the movement of a target using Matlab.  
  It includes 2 labs, corresponding to **successfull (lab1)** and **failed (lab2)** result respectively.  
  <br />
  To understand Meanshift algorithm, refer to [Wikipedia](https://en.wikipedia.org/wiki/Mean_shift) for details.   
  <br />
  Schematic diagram of Meanshift
  <br />
  ![meanshift](https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/fig1.jpg)
  <br />
  ### First Step  
  Execute preprocess.m file to extract frame pictures from videos.  
  ```matlab
obj = VideoReader('D:/matlab/data/meanshift/Mean shift tracking 3.mp4');
numFrames = obj.NumberOfFrames;
for k = 1 : 200     
     frame = read(obj,k); imwrite(frame,strcat('D:/matlab/data/meanshift/img',num2str(k),'.jpg'),'jpg');
end
  ```
  <br />
  # Analysis of Results
