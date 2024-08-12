function sign_name = diamond_sign(sign)


merge_t = set_up_img(imread('merge_test.jpg'));
turn_t = set_up_img(imread('ST_test.jpg'));
T_t = set_up_img(imread('T_test.jpg'));

compare_merge = compare_img(sign, merge_t);
compare_sharpT = compare_img(sign, turn_t);
compare_T = compare_img(sign, T_t);

similar_per = [compare_merge,compare_sharpT,compare_T];
[p, index] = max(similar_per);

switch index
    case 1
      sign_name =('Merge Sign Detect');
    case 2
      sign_name =('Sharp Turn Detect');
    case 3
      sign_name =('T Intersection Detect');
    otherwise
      sign_name = ('IDK');
end




end