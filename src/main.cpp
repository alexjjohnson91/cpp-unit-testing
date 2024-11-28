#include <iostream>

using namespace std;

void log(string);

int main() {
  log("Hello World");

  return EXIT_SUCCESS;
}

void log(string msg) { cout << msg << endl; }
