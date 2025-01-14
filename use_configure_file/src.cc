#include "src.h"
#include "namespace.h"
#include <iostream>
using namespace std;

START_NAMESPACE
void callfunc() { std::cout << "call new namespace \n"; }
END_NAMESPACE

int main() {
#ifdef USE_DEMO
    std::cout << "use demo" << std::endl;
#else
    std::cout << "not use dmeo" << std::endl;
#endif

    X_NAMESPACE::callfunc();

    return 0;
}