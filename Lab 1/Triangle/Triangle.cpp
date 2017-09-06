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
		if (number[i] <= '0' || number[i] > '9')
		{			
			result = false;
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
		cout << "�������� ���������� ����������. ������ �����: Triangle.exe 5 5 5" << endl;
		return 1;
	}

	unsigned int a, b, c;

	if (!ValidInput(argv))
	{
		cout << "������ �����. ������ �����: Triangle.exe 5 5 5" << endl;
		cout << "��������� ������ ������������� �����" << endl;
		return 1;
	}
	
	a = stoi(argv[1]);
	b = stoi(argv[2]);
	c = stoi(argv[3]);

	// ������� �������� ����������� ���� ����� ������� ������ ����� ���� ������	
	unsigned int maxLine = max(a, b);
	maxLine = max(maxLine, c);

	unsigned const int twoLinesSum = a + b + c - maxLine;

	if (maxLine >= twoLinesSum)
	{
		cout << "������ �� �������� �������������" << endl;
		return 1;
	}
		
	string result;
	if (a == b && b == c && c == a)
	{
		result = "����������� ��������������";
	}
	else if (a == b || b == c || a == c)
	{
		result = "����������� ��������������";
	}	
	else
	{
		result = "������� �����������";
	}

	cout << result << endl;
    return 0;
}