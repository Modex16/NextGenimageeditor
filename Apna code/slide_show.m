vPlayer= vision.VideoPlayer('Name','IMAGE','Position',[10 100 660 500]);
count=0;
j=1;
while j~=12
    if count==400
        j=j+1;
        count=0;
    end
    if j==12
        break;
    end
    if count==0
    filename=strcat('Ankit',num2str(j),'.jpg');
    a=imread(filename);
    a=imresize(a,[480 640]);
    
    end
    if count==1
        pause(2);
    end
    a(:,:,:)=a(:,:,:)-1;
    count=count+1;
  %  pause(0.5);
    
    step(vPlayer,a);
end
tts('opening gallery');
tts('swipe left or right to view the previous or next image respectively');
gallery;