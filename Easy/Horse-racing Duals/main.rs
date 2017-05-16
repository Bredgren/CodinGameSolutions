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


// Cool solutions by someone else
use std::io;
use std::io::prelude::*;

fn main() {
    let stdin = io::stdin();

    let mut lines = stdin.lock().lines().map(|x| x.unwrap());

    let n: usize = lines.next().unwrap().parse().unwrap();

    let mut strengths: Vec<i32> = lines.map(|x| x.parse().unwrap())
                                       .collect::<Vec<i32>>();

    strengths.sort();

    let mindiff: i32 = strengths.iter()
                                .zip(strengths.iter().skip(1))
                                .map(|(x, y)| (x - y).abs())
                                .min()
                                .unwrap();

    println!("{}", mindiff);
}

//
use std::io::*;

fn main() {
    let stdin = stdin();
    let mut lines = stdin.lock().lines().map(Result::unwrap);
    let _ = lines.next();
    let mut horses: Vec<i32> = lines.map(|x| x.parse().unwrap()).collect::<Vec<i32>>();
    horses.sort();
    println!("{}", horses.iter().zip(horses.iter().skip(1)).map(|(x, y)| (x - y).abs()).min().unwrap());
}
