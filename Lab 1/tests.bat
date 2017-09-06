set PROGRAM="%~1"

rem ¬вод без аргументов
%PROGRAM% 
if NOT ERRORLEVEL 1 goto err

rem ¬вод с одним аргументов
%PROGRAM% 1
if NOT ERRORLEVEL 1 goto err

rem ¬вод с двум€ аргументами
%PROGRAM% 1 2
if NOT ERRORLEVEL 1 goto err

rem ¬вод с трем€ аргументами
%PROGRAM% 1 2 1
if NOT ERRORLEVEL 0 goto err

rem ¬вод с некорректным количеством аргументов
%PROGRAM% 1 2 1 2 1 2 3 4
if NOT ERRORLEVEL 0 goto err

rem ¬вод с отрицательным числом
%PROGRAM% -1 2 1
if NOT ERRORLEVEL 1 goto err

rem ¬вод с несколькими отрицательными числами
%PROGRAM% -1 -2 -100
if NOT ERRORLEVEL 1 goto err

rem ¬вод с символом вместо числа
%PROGRAM% 1 a 2
if NOT ERRORLEVEL 1 goto err

rem ¬вод со строкой вместо числа
%PROGRAM% 1 lol 12
if NOT ERRORLEVEL 1 goto err

rem ¬вод со строками и символами вместо чисел
%PROGRAM% a little B
if NOT ERRORLEVEL 1 goto err

rem ¬вод со знаками, не €вл€ющимис€ буквами и числами
%PROGRAM% . ' ';'
if NOT ERRORLEVEL 1 goto err

rem ¬вод аргументов дл€ не треугольника
%PROGRAM% 1 2 3
if NOT ERRORLEVEL 0 goto err

rem ¬вод аргументов дл€ обычного треугольника
%PROGRAM% 3 4 5
if NOT ERRORLEVEL 0 goto err

rem ¬вод аргументов дл€ равнобедренного треугольника
%PROGRAM% 3 3 5
if NOT ERRORLEVEL 0 goto err

rem ¬вод аргументов дл€ равностороннего треугольника
%PROGRAM% 6 6 6
if NOT ERRORLEVEL 0 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1