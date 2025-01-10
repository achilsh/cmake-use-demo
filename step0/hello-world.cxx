#include <atomic>
#include <cstdlib>
#include <iostream>
#include "config_ak.h"
using namespace std;

int main() {
    std::atomic<int> aa;
    aa.store(1);
    const double xyz = std::stod("123.123");

    std::cout << HelloWorld_VERSION_MAJOR << std::endl;

    std::cout << aa.load() << std::endl;
    std::cout << "this is hello world project" << std::endl;
}
