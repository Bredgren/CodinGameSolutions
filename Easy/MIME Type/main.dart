import 'dart:io';
import 'dart:math';

void main() {
    List inputs;
    int numElems = int.parse(stdin.readLineSync());
    int numFiles = int.parse(stdin.readLineSync());

    var table = {};

    for (int i = 0; i < numElems; i++) {
        inputs = stdin.readLineSync().split(' ');
        table[inputs[0].toLowerCase()] = inputs[1];
    }

    for (int i = 0; i < numFiles; i++) {
        String line = stdin.readLineSync();
        List<String> fname = line.split('.');
        String ext = fname[fname.length-1].toLowerCase();
        if (table.containsKey(ext) && line.contains('.')) {
            print(table[ext]);
        } else {
            print("UNKNOWN");
        }

    }

    // To debug: stderr.writeln('Debug messages...');
}
