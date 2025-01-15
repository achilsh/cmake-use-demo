#include <iostream>
using namespace std;
extern void show();
extern void subCall();

int main() {
    std::cout << "this is dmeo" << std::endl;
    show();
    subCall();

    return 0;
}