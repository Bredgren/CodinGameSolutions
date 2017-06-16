#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <map>

using namespace std;

int main() {
    int numElems, numFiles;
    cin >> numElems; cin.ignore();
    cin >> numFiles; cin.ignore();

    map<string, string> table;

    for (int i = 0; i < numElems; i++) {
        string ext, mt;
        cin >> ext >> mt; cin.ignore();
        transform(ext.begin(), ext.end(), ext.begin(), ::tolower);
        table[ext] = mt;
    }

    for (int i = 0; i < numFiles; i++) {
        string fname;
        getline(cin, fname);
        string ext = fname.substr(fname.find_last_of(".") + 1);
        if (ext == fname) {
            ext = "";
        }
        transform(ext.begin(), ext.end(), ext.begin(), ::tolower);
        if (table.count(ext) == 0) {
            cout << "UNKNOWN" << endl;
        } else {
            cout << table[ext] << endl;
        }
    }

    // To debug: cerr << "Debug messages..." << endl;
}

/* Cool solution by someone else
#include <iostream>
#include <string>
#include <map>

using namespace std;

string toupper(string str)
{
    for (auto & c: str) c = toupper(c);
    return str;
}

int main()
{
    int N, Q;
    cin >> N >> Q; cin.ignore();

    map<string, string> mime;
    for (int i = 0; i < N; i++)
    {
        string key, value;
        cin >> key >> value; cin.ignore();
        mime[toupper(key)] = value;
    }

    string str;
    while (getline(cin, str))
    {
        int pos = str.find_last_of(".");
        str = (pos == -1) ? "" : toupper(str.substr(pos +1));
        cout << (mime.count(str) ? mime[str] : "UNKNOWN") << endl;
    }
}
*/
