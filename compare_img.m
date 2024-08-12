function percent = compare_img(img, imgt)
count = 0;
[m n] = size(img);
total_pixel = m*n;

    for x = 1:m
        for y = 1:n
            if img(x,y) == imgt(x,y)
                count = count + 1;            
            end
        end
    end

percent = (count / total_pixel)*100;
end