function extent = pixel_count(shape)
%%calcaute the ratio between the Bounding Box and the shape
count = 0;
[m n] = size(shape);
total_pixel = m*n;
    for x = 1:m
        for y = 1:n
            if shape(x,y) == 1
                count = count + 1;            
            end
        end
    end 
extent = count/total_pixel;
end

