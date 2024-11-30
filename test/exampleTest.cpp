#include "../src/Solution.h"
#include "../src/cppunit.h"

// Test examples.
class Cppunit_tests : public Cppunit {
  void single_test() {
    // Arrange
    Solution solution;
    unsigned expected = 4;

    // Act
    unsigned actual = solution.add(1, 3);

    // Assert
    CHECK(actual, expected);
  }
};
int main() { return (new Cppunit_tests)->run(); }
