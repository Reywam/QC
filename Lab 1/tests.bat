set PROGRAM="%~1"

rem ���� ��� ����������
%PROGRAM% 
if NOT ERRORLEVEL 1 goto err

rem ���� � ����� ����������
%PROGRAM% 1
if NOT ERRORLEVEL 1 goto err

rem ���� � ����� �����������
%PROGRAM% 1 2
if NOT ERRORLEVEL 1 goto err

rem ���� � ����� �����������
%PROGRAM% 1 2 1
if NOT ERRORLEVEL 0 goto err

rem ���� � ������������ ����������� ����������
%PROGRAM% 1 2 1 2 1 2 3 4
if NOT ERRORLEVEL 0 goto err

rem ���� � ������������� ������
%PROGRAM% -1 2 1
if NOT ERRORLEVEL 1 goto err

rem ���� � ����������� �������������� �������
%PROGRAM% -1 -2 -100
if NOT ERRORLEVEL 1 goto err

rem ���� � �������� ������ �����
%PROGRAM% 1 a 2
if NOT ERRORLEVEL 1 goto err

rem ���� �� ������� ������ �����
%PROGRAM% 1 lol 12
if NOT ERRORLEVEL 1 goto err

rem ���� �� �������� � ��������� ������ �����
%PROGRAM% a little B
if NOT ERRORLEVEL 1 goto err

rem ���� �� �������, �� ����������� ������� � �������
%PROGRAM% . ' ';'
if NOT ERRORLEVEL 1 goto err

rem ���� ���������� ��� �� ������������
%PROGRAM% 1 2 3
if NOT ERRORLEVEL 0 goto err

rem ���� ���������� ��� �������� ������������
%PROGRAM% 3 4 5
if NOT ERRORLEVEL 0 goto err

rem ���� ���������� ��� ��������������� ������������
%PROGRAM% 3 3 5
if NOT ERRORLEVEL 0 goto err

rem ���� ���������� ��� ��������������� ������������
%PROGRAM% 6 6 6
if NOT ERRORLEVEL 0 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1