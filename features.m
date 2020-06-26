%% Set layer to first conv layer

layer = 2;
name = net.Layers(layer).Name

%% Use deepDreamImage to visualize the 36 learned features

channels = 1:36;
I = deepDreamImage(net,name,channels, ...
    'PyramidLevels',1);

%% Show the learned features

figure
I = imtile(I,'ThumbnailSize',[64 64]);
imshow(I)
title(['Layer ',name,' Features'],'Interpreter','none')

%% Layer 154 features

layer = 154;
name = net.Layers(layer).Name

channels = 1:6;
I = deepDreamImage(net,name,channels, ...
    'Verbose',false, ...
    'NumIterations',20, ...
    'PyramidLevels',2);
figure
I = imtile(I,'ThumbnailSize',[512 512]);
imshow(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'],'Interpreter','none')

%% Fully Connected layer features

layer = 176;
name = net.Layers(layer).Name

channels = [1 114 293 484 563 950];
net.Layers(end).Classes(channels)

%%

I = deepDreamImage(net,name,channels, ...
    'Verbose',false, ...
    'NumIterations',100, ...
    'PyramidLevels',2);
figure
I = imtile(I,'ThumbnailSize',[250 250]);
imshow(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'])