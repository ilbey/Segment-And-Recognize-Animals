clear all;
clc;

%TEST IMAGE
imgtst = imread('1.jpg');
testimg = imresize(imgtst,[200,200]);
if ndims(testimg) == 3
   testimg = rgb2gray(testimg);
end


%SEGMENTAION PART

S = imgaussfilt(testimg,3);

height=size(testimg,1);
width=size(testimg,2);

center= S(floor(width/2),floor(height/2));


T = graythresh(testimg)  % find the threshold for input image
mean = mean(mean(S));



if(T<0.5)

    if(center>128)
        S=imbinarize(S,T);
    else   
        S=imbinarize(S,T);
        S=1-S;
    end

else

  
  if(center>128)
          S=imbinarize(S,T);
            S=1-S;
    else   
        S=imbinarize(S,T);
    end
end


[B,L,N] = bwboundaries(S);


subplot(1,2,1),imshow(testimg),title('Original Image');
subplot(1,2,2),imshow(S),title('Thresholded Image');hold on;

for k=1:length(B)
   boundary = B{k};
   if(k > N)
     mark = plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
   else
     plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
     
   end
end



%TRAINING BUTTERFLY
image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\butterfly'; % Name of the butterfly folder
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totalbut = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);  % it will specify images names with full path and extension
    our_images = imread(full_name);       
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totalbut] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totalbut,pcaimgbut] = extractFeatures(double(our_images),points);
    %totalbut = graycomatrix(double(our_images));
 end
 
%TRAINING CRAB
image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\crab'; %  Enter name of crab folder
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totalcrab = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
    our_images = imread(full_name);                
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totalcrab] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totalcrab,pcaimgcrab] = extractFeatures(double(our_images),points);
    %totalcrab = graycomatrix(double(our_images));
 end

 
 %TRAINING DOLPHIN
 image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\dolphin'; %  Enter name of dolphin folder
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totaldolp = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
    our_images = imread(full_name);               
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totaldolp] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totaldolp,pcaimgdolp] = extractFeatures(double(our_images),points);
    %totaldolp = graycomatrix(double(our_images));
 end
    
%TRAINING ELEPHANT
 image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\elephant'; %  Enter name of elephant folder
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totalelep = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
    our_images = imread(full_name);       
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totalelep] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totalelep,pcaimgelep] = extractFeatures(double(our_images),points);
    %totalelep = graycomatrix(double(our_images));
 end
 
 %TRAINING FLAMINGO
  image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\flamingo'; %  Enter name of flaming folder 
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totalfla = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
    our_images = imread(full_name);             
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totalfla] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totalfla,pcaimgfla] = extractFeatures(double(our_images),points);
    %totalfla = graycomatrix(double(our_images));
 end
 
 %TRAINING SCORPION
image_folder = 'C:\Users\ilbey\Desktop\image project\Dataset\scorpion'; %  Enter name of scorpion folder 
filenames = dir(fullfile(image_folder, '*.jpg'));  %read all images with JPG extention
 total_images = numel(filenames);    %count total number of photos in this folder
 
 totalsco = zeros(total_images,1);
 for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);         % it will specify images names with full path and extension
    our_images = imread(full_name);             
    our_images = imgaussfilt(our_images,3);
    our_images = imresize(our_images,[200,200]);
    if ndims(our_images) == 3
      our_images = rgb2gray(our_images);
    end
    [pcaimg,totalsco] = pca(double(our_images));
    %points = detectSURFFeatures(double(our_images));      
    %[totalsco,pcaimgsco] = extractFeatures(double(our_images),points);
    %totalsco = graycomatrix(double(our_images));
 end
 


[testpcaimg,testscores] = pca(double(testimg));


%COMPARISION OF TESTIMAGE MATRIX AND TRAINED MATRIX
simbut = ssim(testscores,totalbut);
simcrab = ssim(testscores,totalcrab);
simdolp = ssim(testscores,totaldolp);
simelep = ssim(testscores,totalelep);
simfla = ssim(testscores,totalfla);
simsco = ssim(testscores,totalsco);



%points = detectSURFFeatures(double(testimg));      
%[testscores,testpcaimg] = extractFeatures(double(our_images),points);
%testscores = graycomatrix(double(testimg));

%cosSimbut = mean(dot(testscores,totalbut)/(norm(testscores)*norm(totalbut)));
%cosSimcrab = mean(dot(testscores(100,1),totalcrab(100,1))/(norm(testscores)*norm(totalcrab)));
%cosSimdolp = mean(dot(testscores(100,1),totaldolp(100,1))/(norm(testscores)*norm(totaldolp)));
%cosSimelep = mean(dot(testscores(100,1),totalelep(100,1))/(norm(testscores)*norm(totalelep)));
%cosSimfla = mean(dot(testscores(100,1),totalfla(100,1))/(norm(testscores)*norm(totalfla)));
%cosSimsco = mean(dot(testscores(100,1),totalsco(100,1))/(norm(testscores)*norm(totalsco)));

% %distbut = immse(testscores,totalbut);
% %distcrab = immse(testscores,totalcrab);
% distdolp = immse(testscores,totaldolp);
% distelep = immse(testscores,totalelep);
% distfla = immse(testscores,totalfla);
% distsco = immse(testscores,totalsco);

%simbut = psnr(testscores,totalbut);
%simcrab = psnr(testscores,totalcrab);
%simdolp = psnr(testscores,totaldolp);
%simelep = psnr(testscores,totalelep);
%simfla = psnr(testscores,totalfla);
%simsco = psnr(testscores,totalsco);

%distbut = (simbut+distbut)/2;
%distbut = (simcrab+distcrab)/2;
%distbut = (simdolp+distdolp)/2;
%distbut = (simelep+distelep)/2;
%distbut = (simfla+distfla)/2;
%distbut = (simsco+distsco)/2;

%A = [distbut distcrab distdolp distelep distfla distsco];


A = [simbut simcrab simdolp simelep simfla simsco];

%CHECKING MAXIMUM VALUE AND WRITING THE GUESSES
if max(A) == simbut
   figure; imshow(imgtst); title('Butterfly');
end

if max(A) == simcrab
   figure; imshow(imgtst); title('Crab');
end

if max(A) == simdolp
   figure; imshow(imgtst); title('Dolphin');
end

if max(A) == simelep
   figure; imshow(imgtst); title('Elephant');
end

if max(A) == simfla
   figure; imshow(imgtst); title('Flamingo');
end

if max(A) == simsco
   figure; imshow(imgtst); title('Scorpion');
end

