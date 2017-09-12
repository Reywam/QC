#include "stdafx.h"
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

bool IsValidNumber(const string &number)
{
	bool result = true;

	for (size_t i = 0; i < number.size(); i++)
	{
		size_t firstDelimiter = 0;		
		if (i == 0 && number[i] == '0')
		{
			continue;
		}
		if (i != 0 && (number[i] == ',') && firstDelimiter == 0)
		{
			firstDelimiter++;
		}
		else if (number[i] <= '0' || number[i] > '9')
		{			
			result = false;
			break;
		}
	}
	return result;
}

bool ValidInput(char* argv[])
{
	string a = argv[1];
	string b = argv[2];
	string c = argv[3];
	
	bool result = true;

	if (!IsValidNumber(a)
		|| !IsValidNumber(b)
		|| !IsValidNumber(c))
	{
		result = false;
	}
	return result;
}

int main(int argc, char* argv[])
{
	setlocale(LC_ALL, "Rus");

	if (argc != 4)
	{
		cout << "Неверное количество аргументов. Формат ввода: Triangle.exe 5 5 5" << endl;
		return 1;
	}

	double a, b, c;

	if (!ValidInput(argv))
	{
		cout << "Ошибка ввода. Формат ввода: Triangle.exe 5 5 5" << endl;
		cout << "Допустимы только положительные числа" << endl;
		return 1;
	}
	
	a = stod(argv[1]);
	b = stod(argv[2]);
	c = stod(argv[3]);

	// Отрезки образуют треугольник если самый больший меньше суммы двух других	
	double maxLine = max(a, b);
	maxLine = max(maxLine, c);

	const double twoLinesSum = a + b + c - maxLine;

	if (maxLine > twoLinesSum
		|| (abs(maxLine - twoLinesSum) <= DBL_EPSILON))
	{
		cout << "Фигура не является треугольником" << endl;
		return 1;
	}
		
	string result;
	if (a == b && b == c && c == a)
	{
		result = "Треугольник равносторонний";
	}
	else if (a == b || b == c || a == c)
	{
		result = "Треугольник равнобедренный";
	}	
	else
	{
		result = "Обычный треугольник";
	}

	cout << result << endl;
    return 0;
}