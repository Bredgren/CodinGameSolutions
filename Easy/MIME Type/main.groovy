input = new Scanner(System.in);

numElems = input.nextInt()
numFiles = input.nextInt()

def table = [:]

for (; numElems > 0; numElems--) {
    table.put(input.next().toLowerCase(), input.next())
    input.nextLine()
}

for (; numFiles > 0; numFiles--) {
    fname = input.nextLine().toLowerCase()
    ext = fname.substring(fname.lastIndexOf('.') + 1)
    if (ext != fname && table.containsKey(ext)) {
        println table[ext]
    } else {
        println "UNKNOWN"
    }
}

// To debug: System.err << "Debug messages...\n"
