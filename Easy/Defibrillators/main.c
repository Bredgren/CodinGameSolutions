#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define STR_LEN 51
#define STR_LEN_BIG 257
#define PI 3.14159265358979323846

void replaceComma(char *str) {
    for (int i = 0; str[i] != NULL; i++) {
        if (str[i] == ',') {
            str[i] = '.';
        }
    }
}

void extractFields(char *name, char *lon, char *lat, char *str_orig) {
    const char delim[2] = ";";
    int i = 0;
    char *str = strdup(str_orig);
    char *token;
    while ((token = strsep(&str, delim)) != NULL) {
        switch (i) {
            case 1:
                strncpy(name, token, STR_LEN);
                break;
            case 4:
                strncpy(lon, token, STR_LEN);
                replaceComma(lon);
                break;
            case 5:
                strncpy(lat, token, STR_LEN);
                replaceComma(lat);
                break;
        }
        i++;
  }
}

double rad(double deg) {
    return deg / 180 * PI;
}

double distance(double lonA, double latA, double lonB, double latB) {
    double x = (lonB - lonA) * cos((latA + latB) / 2);
    double y = (latB - latA);
    return sqrt(x*x + y*y) * 6371;
}

double convertPos(char *pos) {
    return rad(strtod(pos, NULL));
}

int main() {
    char lonstr[STR_LEN];
    scanf("%s", lonstr);
    replaceComma(lonstr);
    double lonA = convertPos(lonstr);

    char latstr[STR_LEN];
    scanf("%s", latstr);
    replaceComma(latstr);
    double latA = convertPos(latstr);

    int n;
    scanf("%d", &n); fgetc(stdin);

    char closest[STR_LEN];
    double dist = -1.0;

    char name[STR_LEN];
    char lonBstr[STR_LEN];
    char latBstr[STR_LEN];
    for (int i = 0; i < n; i++) {
        char defib[STR_LEN_BIG];
        fgets(defib, STR_LEN_BIG, stdin);
        defib[strlen(defib)-1] = '\0'; // remove newline
        extractFields(name, lonBstr, latBstr, defib);

        double lonB = convertPos(lonBstr);
        double latB = convertPos(latBstr);

        double d = distance(lonA, latA, lonB, latB);
        if (dist < 0 || d < dist) {
            dist = d;
             strncpy(closest, name, STR_LEN);
        }
    }

    printf("%s\n", closest);

    return 0;

    // Write an action using printf(). DON'T FORGET THE TRAILING \n
    // To debug: fprintf(stderr, "Debug messages...\n");
}
