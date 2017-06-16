#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

void printBlock(int digit, int count) {
    cout << (digit ? "0" : "00") << " ";
    for (;count > 0; count--) {
        cout << "0";
    }
}

int main() {
    string message;
    getline(cin, message);

    int currentDigit = 0;
    int count = 0;
    for (auto it = message.begin(); it < message.end(); it++) {
        char c = *it;
        for (int i = 6; i >= 0; i--) {
            int digit = (c & (1 << i)) > 0;
            if (currentDigit != digit) {
                if (count) {
                    printBlock(currentDigit, count);
                    cout << " ";
                }
                currentDigit = digit;
                count = 1;
            } else {
                count++;
            }
        }
    }
    printBlock(currentDigit, count);

    // To debug: cerr << "Debug messages..." << endl;
}

/* Cool solution by someone else
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>

using namespace std;

int main()
{
    string MESSAGE;
    getline(cin, MESSAGE);

    bool pbit = MESSAGE[0] & 0x40;
    cout << (pbit ? "0 " : "00 ");
    for (auto c: MESSAGE)
    {
        for (unsigned char bm = 0x40; bm != 0; bm /= 2)
        {
            bool bit = (c & bm);
            cout << ((bit == pbit) ? "0"
                                   : (pbit = bit) ? " 0 0"
                                         : " 00 0");
        }
    }
}
*/
