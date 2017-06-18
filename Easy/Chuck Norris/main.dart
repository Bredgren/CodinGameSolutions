import 'dart:io';
import 'dart:math';

void main() {
    String message = stdin.readLineSync();
    String bits = message.codeUnits.fold("", (prev, elem) =>
        prev + elem.toRadixString(2).padLeft(7, '0')
    );
    String answer = bits.replaceAllMapped(new RegExp(r'1+|0+'), (match) =>
        "${match[0].contains('1') ? '0' : '00'} ${'0' * match[0].length} "
    );

    print(answer.trim());

    // To debug: stderr.writeln('Debug messages...');
}
