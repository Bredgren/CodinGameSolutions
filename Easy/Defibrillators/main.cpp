#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>

using namespace std;

double convertNum(string &str) {
    size_t pos = str.find(",");
    str.replace(pos, 1, ".");
    return stod(str) / 180 * M_PI;
}

double parseNum() {
    string str;
    cin >> str; cin.ignore();
    return convertNum(str);
}

void parseLine(string &line, vector<string> &res) {
    stringstream ss;
    ss.str(line);
    string item;
    while (getline(ss, item, ';')) {
        res.push_back(item);
    }
}

double distance(double lonA, double latA, double lonB, double latB) {
    double x = (lonB - lonA) * cos((latA + latB) / 2);
    double y = (latB - latA);
    return sqrt(x*x + y*y) * 6371;
}

int main() {
    double lon = parseNum();
    double lat = parseNum();

    int n;
    cin >> n; cin.ignore();

    double minDist;
    string answer;

    vector<string> items;
    for (int i = 0; i < n; i++) {
        string defib;
        getline(cin, defib);
        parseLine(defib, items);
        double lonB = convertNum(items[4]);
        double latB = convertNum(items[5]);

        double dist = distance(lon, lat, lonB, latB);
        if (!answer.length() || dist < minDist) {
            minDist = dist;
            answer = items[1];
        }

        items.clear();
    }

    cout << answer << endl;

    // To debug: cerr << "Debug messages..." << endl;
}
