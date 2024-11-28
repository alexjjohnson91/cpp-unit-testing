#include "../src/Solution.h"
#include "../src/cppunit.h"

// Test examples.
class Cppunit_tests : public Cppunit {
  void single_test() {
    // Integral type match check.
    CHECK(2 + 2, 4);

    // Boolean type value check.
    CHECKT(2 + 2 == 4);

    // String match check.
    CHECKS("a"
           "b",
           "ab");

    // Stdin override example.
    CHECK((new Solution)->add(2, 2), 4);
  }
};
int main() { return (new Cppunit_tests)->run(); }
