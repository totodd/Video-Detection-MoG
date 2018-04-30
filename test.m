clc;
clear all;
close all;

xyloObj = VideoReader('sample.mp4');

vidWidth = xyloObj.Width;
vidHeight = xyloObj.Height;
fps = xyloObj.FrameRate;

mov = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),...
    'colormap',[]);
% 
% k = 1;
% while hasFrame(xyloObj)
%     mov(k).cdata = readFrame(xyloObj);
%     k = k+1;
% end
% 
% hf = figure;
% set(hf,'position',[150 150 vidWidth vidHeight]);
% 
% movie(hf,mov,1,xyloObj.FrameRate);
k = 1;
while hasFrame(xyloObj)
    mov(k).cdata = readFrame(xyloObj,'native');    
    k = k+1;
end

% fr = mov(1).cdata;
% 
% imshow(fr,[]);
% 
% 
% xyloObj = VideoReader(fileName);
% vidWidth = xyloObj.Width;
% vidHeight = xyloObj.Height;
% fps = xyloObj.FrameRate;

out = VideoWriter('out.avi');
out.FrameRate = fps;
open(out);
% while hasFrame(xyloObj)
%     frame = readFrame(xyloObj);
%     writeVideo(out, frame);
% end


for i = 1:length(mov)
   writeVideo(out, mov(i).cdata); 
end

close(out);