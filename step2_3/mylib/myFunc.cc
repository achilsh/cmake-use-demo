#include "myFunc.h"
double sqrt(double x) {

#ifdef USE_LIB
    #include "mysqrt.h"
    return callSqrt(x);
#else
    return x * x * x;
#endif
    
}