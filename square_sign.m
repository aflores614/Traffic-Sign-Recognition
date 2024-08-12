function sign_name = square_sign(sign)


Speed25 = set_up_img(imread('speed25test.jpg'));
Speed30 = set_up_img(imread('speed30test.jpg'));
noleft = set_up_img(imread('noleftturn.jpg'));

compare_25 = compare_img(sign, Speed25);
compare_30 = compare_img(sign, Speed30);
compare_noleft = compare_img(sign, noleft);

similar_per = [compare_25,compare_30,compare_noleft];
[p, index] = max(similar_per);

switch index
    case 1
      sign_name =('Speed limit 25 Detect');
    case 2
      sign_name =('Speed limit 30 Detect');
    case 3
      sign_name =('NO left turn Detect');
    otherwise
      sign_name = ('IDK');
end



end