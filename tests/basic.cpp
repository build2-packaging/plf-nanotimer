#include <iostream>

#include "plf_nanotimer.h"

// Code extracted from the readme.

int main()
{
    plf::nanotimer timer;

    timer.start();

    // Do something here

    double results = timer.get_elapsed_ns();
    std::cout << "Timing: " << results << " nanoseconds." << std::endl;

    timer.start(); // "start" has the same semantics as "restart".

    // Do something else

    results = timer.get_elapsed_ms();
    std::cout << "Timing: " << results << " milliseconds." << std::endl;

    timer.start();

    plf::microsecond_delay(15); // Delay program for 15 microseconds

    results = timer.get_elapsed_us();
    std::cout << "Timing: " << results << " microseconds." << std::endl;
}
