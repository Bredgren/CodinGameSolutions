use std::io;

macro_rules! print_err {
    ($($arg:tt)*) => (
        {
            use std::io::Write;
            writeln!(&mut ::std::io::stderr(), $($arg)*).ok();
        }
    )
}

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

fn convertNum(s: &str) -> f64 {
    s.replace(",", ".").parse::<f64>().unwrap().to_radians()
}

fn distance(lonA: f64, latA: f64, lonB: f64, latB: f64) -> f64 {
    let x = (lonB - lonA) * ((latA + latB) / 2.0).cos();
    let y = latB - latA;
    x.hypot(y) * 6371.0
}

fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let lonA = convertNum(input_line.trim());

    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let latA = convertNum(input_line.trim());

    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);

    let mut minDist = 0.0;
    let mut answer = String::new();

    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let line = input_line.trim_right();
        let defib: Vec<&str> = line.split(';').collect();

        let lonB = convertNum(defib[4]);
        let latB = convertNum(defib[5]);

        let dist = distance(lonA, latA, lonB, latB);
        if answer.is_empty() || dist < minDist {
            minDist = dist;
            answer = defib[1].to_string();
        }
    }

    println!("{}", answer);

    // To debug: print_err!("Debug message...");
}
