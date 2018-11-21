# Meanshift-Target-Tracking
  Implement meanshift to track target, analyze good and bad performances  
  College of Electrical Information Engineering, Tongji University  
  Chengyuan Deng, 2017  

  ### Introduction
  This project implemented Meanshift algorithm to track down the movement of a target using Matlab.  
  It includes 2 labs, corresponding to `successfull (lab1)` and `failed (lab2)` result respectively.  
  <br />
  To understand Meanshift algorithm, refer to [Wikipedia](https://en.wikipedia.org/wiki/Mean_shift) for details.   
  <br />
  Schematic diagram of Meanshift
  <br />
  ![meanshift](https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/fig1.jpg)
  <br />
  ### Step 1  
  Execute preprocess.m file to extract frame pictures from videos.  
  ```matlab
obj = VideoReader('D:/matlab/data/meanshift/Mean shift tracking 3.mp4');
numFrames = obj.NumberOfFrames;
for k = 1 : 200     
     frame = read(obj,k); imwrite(frame,strcat('D:/matlab/data/meanshift/img',num2str(k),'.jpg'),'jpg');
end
  ```
  ### Lab 1
  On the first frame of the picture, select the target (should be one of the players) you would to track down by draggling a rectangle with your mouse.  
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig2.jpg">
  </div>
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig3.jpg">
  </div>
  <br/>
  Try to track down in the first 20 frames, a locus will be displayed, but not obvious since the little amount of frames.  
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig4.jpg">
  </div>
  <br/>
  Then use the first 100 frames to track down the player. A significant locus will be found.   
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig6.jpg">
  </div>
  </br>
  Try another player.  
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig7.jpg">
  </div>
  <br/>
  <div align=center>
	<img src="https://raw.githubusercontent.com/DrvoiDcy7/Meanshift-Target-Tracking/master/img/lab1/fig8.jpg">
  </div>
  <br/>
  
  ### Lab 2