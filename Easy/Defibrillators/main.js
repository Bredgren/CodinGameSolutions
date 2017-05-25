function convertNum(s) {
    return parseFloat(s.replace(",", ".")) / 180 * Math.PI;
}

function distance(lonA, latA, lonB, latB) {
    var x = (lonB - lonA) * Math.cos((latA + latB) / 2);
    var y = latB - latA;
    return Math.sqrt(x*x + y*y) * 6371;
}

var lon = convertNum(readline());
var lat = convertNum(readline());

var answer = "";
var minDist = 0;

var n = parseInt(readline());
for (var i = 0; i < n; i++) {
    var defib = readline().split(";");
    var dist = distance(lon, lat, convertNum(defib[4]), convertNum(defib[5]));
    if (answer === "" || dist < minDist) {
        answer = defib[1];
        minDist = dist;
    }
}

print(answer);

// To debug: printErr('Debug messages...');

/* Cool solutions by others
// lets define some usefull stuff:
const pow = Math.pow.bind(Math);
const sqrt = Math.sqrt.bind(Math);
const dist = (a, b) => sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1],2));

// now get the current position of the person as array and convert them to floats
const p = [0,0].map(x=>+readline().replace(",","."));

// turn the data into an array and loop through it
print(new Array(+readline()).fill()
    // split the data as defined using a ;
    .map(x=>readline().split(";"))
    // now turn each row into an object
    .map(x=>{
        x = {
            // n == name of the location
            n: x[1],
            // p == [LON, LAT]
            // convert them to floats
            p: x.splice(-2).map(x=>+x.replace(",","."))
        };
        // d == distance to person
        x.d = dist(x.p, p);
        // return on the fly created object
        return x;
    })
    // sort the dataset based on distance
    .sort((a,b)=>a.d-b.d)
    // return the name of the row with the closest distance
    .shift().n
// print it!
);


//voila…
*/
