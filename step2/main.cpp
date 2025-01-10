#include <iostream>
#include "mylib/demoLib.h"



using namespace std;

int main() {
#ifdef USE_LIB
    demoCall();
#endif
    return 0;
}
