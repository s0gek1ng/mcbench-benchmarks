% Small technical example. 
% Shows how to retrieve the details on a rectangular grid, after a multi- 
% resolution decomposition has been performed.
%
disp('Small technical example.');
disp('Shows how to retrieve the details on a rectangular grid, after a multi-');
disp('resolution decomposition has been performed.');
disp('FOR MORE INFORMATION:  help retrieveR');
disp(' ');
disp('See also the report http://repository.cwi.nl:8888/cwi_repository/docs/IV/04/04178D.pdf');
disp('Dr. Paul M. de Zeeuw <Paul.de.Zeeuw@cwi.nl>');
disp(' (C) 1998-2006 Stichting CWI, Amsterdam, The Netherlands');
disp(' ');
%---PARAMETERS-----------------------------------------------------------------
% How to execute, set parameters
N = 6;                   %  maximum level (even number) in lifting scheme
filtername = 'Neville4';
%
%---INSERT YOUR IMAGE HERE-----------------------------------------------------
if exist('imread','file') == 2
  Orig = double(imread('zenithgray.TIF','tiff'));
else
  load zenithgray; Orig = zenithgray; clear zenithgray;
end
%
disp([' Dimensions of original      ' int2str( size(Orig) )]);
%---DECOMPOSITION--------------------------------------------------------------
disp([' Filter type is ' filtername]);
[C,S] = QLiftDec2(Orig,N,filtername);
%
%---RETRIEVE APPROXIMATION-----------------------------------------------------
A = retrieveR(N, 'a', C, S);
sizeA = size(A);
%
%---RETRIEVE DETAIL AT EVEN LEVEL----------------------------------------------
level = N-2;
disp([' Level ' int2str(level)]);
D = retrieveR(level, 'd', C, S);
%
disp(['The dimensions of the detail function read as follows ' int2str(size(D))]);
