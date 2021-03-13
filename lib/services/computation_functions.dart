import 'dart:math';

double addition(String variableX, String variableY) =>
    (double.parse(variableX) + double.parse(variableY));

double subtraction(String variableX, String variableY) =>
    (double.parse(variableX) - double.parse(variableY));

double multiplication(String variableX, String variableY) =>
    (double.parse(variableX) * double.parse(variableY));

double division(String variableX, String variableY) =>
    (double.parse(variableX) / double.parse(variableY));

double squareRoot(String variableX) {
  return sqrt(double.parse(variableX));
}

double factorial(String variableX) {
  if (variableX.contains('.'))
    return double.nan;
  else {
    double number = double.parse(variableX);
    if (number == 0 || number == 1) return 1;
    double result = 1;
    while (number != 0) {
      result *= number;
      number--;
    }
    return result;
  }
}

double naturalLog(String variableX) => log(double.parse(variableX));

double power(String variableX, String variableY) =>
    pow(double.parse(variableX), double.parse(variableY));
