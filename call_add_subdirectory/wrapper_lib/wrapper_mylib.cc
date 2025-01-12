#include "wrapper_mylib.h"
#include <iostream>
using namespace std;

namespace call_add_subdirectory {
void callMyLib() {
    std::cout << "call mylib func\n";
    display();
}
} // namespace call_add_subdirectory