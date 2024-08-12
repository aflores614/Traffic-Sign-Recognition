%%  Andres Flores ECE 551 
clear
close all
color_img1= imread('yield_sign.jpg');
color_img2= imread('stop_sign.jpg');
color_img3= imread('merge.jpg');
color_img4= imread('stop_2.jpg');
color_img5= imread('stop3.jpg');
color_img6= imread('sharp_turn.jpg');
color_img7= imread('fmerge.jpg');
color_img8= imread('speed.jpg');


x1 = shape_recognition(color_img1);
x2 = shape_recognition(color_img2);
x3 = shape_recognition(color_img3);
x4 = shape_recognition(color_img4);
x5 = shape_recognition(color_img5);
x6 = shape_recognition(color_img6);
x7 = shape_recognition(color_img7);
x8 = shape_recognition(color_img8);













