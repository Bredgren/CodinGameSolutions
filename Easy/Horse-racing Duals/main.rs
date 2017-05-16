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

fn main() {
    let mut input_line = String::new();
    io::stdin().read_line(&mut input_line).unwrap();
    let n = parse_input!(input_line, i32);
    let mut strengths: Vec<i32> = vec![];
    for i in 0..n as usize {
        let mut input_line = String::new();
        io::stdin().read_line(&mut input_line).unwrap();
        let pi = parse_input!(input_line, i32);
        strengths.push(pi);
    }

    strengths.sort();

    let mut min = strengths[1] - strengths[0];
    for i in 1..(n-1) as usize {
        let d = strengths[i+1] - strengths[i];
        if d < min {
            min = d;
        }
    }

    println!("{}", min);

    // Write an action using println!("message...");
    // To debug: print_err!("Debug message...");
}
