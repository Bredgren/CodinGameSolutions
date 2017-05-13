#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int N;
    cin >> N; cin.ignore();

    vector<int> strengths;
    for (int i = 0; i < N; i++) {
        int Pi;
        cin >> Pi; cin.ignore();
        strengths.push_back(Pi);
    }

    sort(strengths.begin(), strengths.end());

    int min = strengths[1] - strengths[0];
    for (int i = 0; i < strengths.size() - 1; i++) {
        int d = strengths[i + 1] - strengths[i];
        if (d < min) {
            min = d;
        }
    }

    cout << min << endl;
}
