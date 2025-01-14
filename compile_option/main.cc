#include <iostream>
using namespace std;

int main() {

// USE_MOD_SRC 是 CMakeLists.txt 中 add_compile_defintions()中指定变量。
#ifdef USE_MOD_SRC
    std::cout << "use mod logic" << std::endl;
#else
    std::cout << "Not use mod logic \n";
#endif
    // std::cout << USE_MOD_SRC << std::endl;
    return 0;
}