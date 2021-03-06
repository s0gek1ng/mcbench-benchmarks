function createfigure(x1, y1, y2)
%CREATEFIGURE(X1,Y1,Y2)
%  X1:  vector of x data
%  Y1:  matrix of y data
%  Y2:  matrix of y data
 
%  Auto-generated by MATLAB on 18-Aug-2005 20:24:11
%  Copyright 2006-2009 The MathWorks, Inc.
 
%% Create figure
figure1 = figure;
 
%% Create axes
axes1 = axes(...
  'Position',[0.13 0.11 0.3297 0.815],...
  'XGrid','on',...
  'YGrid','on',...
  'Parent',figure1);
title(axes1,'Motor 1');
xlabel(axes1,'Speed (rpm)');
ylabel(axes1,'Noise (dBA)');
box(axes1,'on');
hold(axes1,'all');
 
%% Create mutliple lines using matrix input to plot
plot1 = plot(x1,y1);
set(plot1(1),'Marker','.');
set(plot1(2),'Marker','.');
set(plot1(3),'Marker','.');
set(plot1(4),'Marker','.');
 
%% Create axes
axes2 = axes(...
  'Position',[0.5703 0.11 0.3297 0.815],...
  'XGrid','on',...
  'YGrid','on',...
  'Parent',figure1);
ylim(axes2,[67.5 71.5]);
hold(axes2,'all');
 
%% Create mutliple lines using matrix input to plot
plot2 = plot(x1,y2);
set(plot2(1),'Marker','.');
set(plot2(2),'Marker','.');
set(plot2(3),'Marker','.');
set(plot2(4),'Marker','.');
 
