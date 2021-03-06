function [mag,Wf]=find_harm(res,p3) 
% ���������� �������� �������� ������� 
% ������� ����������: 
%   res - ����������� ������ ������ �������  �� ������������ ��� 
%   p3  - ������������� �� 
% �������� ����������:  
%   mag - ��������� �����-������� 
%   Wf  - ���� ��� ��������� ���������� �������� �����

down=fix(256/p3);   % ������ ������� �������� �������
M=fix(p3/4);        % ����� �������� 
% ����������� 10 �������� �������� �������
if M<10  
    for n=1:M 
        up=fix((n+0.5)*512/p3); 
        mag(n)=max(res(down:up)); 
        down=up+1; 
    end
    mag=mag*sqrt(M)/norm(mag);
    mag(M+1:10)=1; 
else
    for n=1:10
        up=fix((n+0.5)*512/p3); 
        mag(n)=max(res(down:up)); 
        down=up+1; 
    end
    mag=mag*sqrt(10)/norm(mag);
end

% ������ ����� ��� ��������� ���������� �������� �����-�������
w0 = 2*pi/p3; % ������ �������� �������
for j=1:10
    % ����������� � ������������ �� ������ ������
	Wf(j) = 117/(25 + 75*power(1 + 1.4*sqrt(w0*j/(0.25*pi)),0.69));
end