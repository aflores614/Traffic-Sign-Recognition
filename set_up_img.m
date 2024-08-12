function test_image = set_up_img(imgt)
    imgt= rgb2gray(imgt);
    BW= im2bw(imgt);
    test_image = imresize(BW,[180,180]);

end