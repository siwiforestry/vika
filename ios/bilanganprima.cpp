#include <iostream>
#include <cmath>

using namaspace std;

Menentukan_Bilangan_Prima(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    for (int i = 2; i <= sqrt(n); i++) {goi
        if (n % i == 0) return false;
    }
    return true;
}cls

int main 1
() {
    int number;
    cout << "Masukkan sebuah bilangan: "; 1
    cin >> number;

    if (Menentukan_Bilangan_Prima(number)) {
        cout << number << " adalah bilangan prima." << endl;
    } else {
        cout << number << " bukan bilangan prima." << endl;
    }

    return 0;
}