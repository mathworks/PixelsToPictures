function writeGifFrame(fileName,inImg,idx,delayTime)
% This function saves multiple images as a GIF
% It takes the output file name, gif frame image, current index and
% delay between frames as input. 
% It does not have any outputs since it writes a file directly to the disk.
%  
% Inputs:
%         filename    : (char array) Desired name of the GIF file
%         Image       : (RGB image) 3-D matrix that represents the current 
%                         frame of GIF image
%         index       : (scalar) The index of the current frame being written
%         delay_time  : (scalar) Delay time for change of frames
%        
% Example:
%           img1 = imread('MyImage1'); 
%           img2 = imread('MyImage2'); 
%           img3 = imread('MyImage3'); 
%           allFrames = {img1, img2, img3};
%           for idx = 1:length(allFrames)
%               writeGifFrame('MyGIF.gif', allFrames{idx}, idx, 0.1);
%           end

% To save the image into a GIF file.  Because
% three-dimensional data is not supported for GIF files, call |rgb2ind| to
% convert the RGB data in the image to an indexed image |A|
% with a colormap |map|. To append multiple images to the first image, 
% call |imwrite| with the name-value pair argument |'WriteMode','append'|.

[gifFrame,map] = rgb2ind(inImg,256);
    
if idx == 1
    imwrite(gifFrame,map,fileName,'gif','LoopCount',Inf,'DelayTime',delayTime);
else
    imwrite(gifFrame,map,fileName,'gif','WriteMode','append','DelayTime',delayTime);
end

end