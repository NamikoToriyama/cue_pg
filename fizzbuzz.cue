// cue export --out text fizzbuzz.cue
// reference: https://gist.github.com/evant/556b20e8db671869272386a5d5cf3236
import "strings"

_numbers: [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15,16,17,18,19,20 ]

// return fizzbuzz character
_f: {
    n: int,
    k: string | *n
    out: k,
    if n mod 3 == 0 && n mod 5 != 0 {
        out: "Fizz",
    }
    if n mod 5 == 0 && n mod 3 != 0 {
        out: "Buzz"
    }
    if n mod 3 == 0 && n mod 5 == 0 {
        out: "FizzBuzz"
    }
}

// "\((_f & {n: 15}).out)" 
_fizzbuzz: [ for i in _numbers {"\((_f & {n: i}).out)"}]
"\(strings.Join(_fizzbuzz, "\n"))"

// //////
// _var: 10
// hoge: _var

// //////
// import "text/template"

// tmplHello: """
// 	Hi! {{.name}}.
// 	"""

// data: {
// 	name: "Namiko"
// }

// out: template.Execute(tmplHello, data)

// /////
// #user: {
//   name: string,
//   age: int,
//   if age <= 50 {
//     isOld: false,
//   }
//   if age > 50 {
//     isOld: true,
//   }
// }

// you: #user & {
//   "name": "hoge",
//   "age": 10,
// }

// me: #user & {
//   "name": "hoge",
//   "age": 100,
// }


// if sentence
// _user: {
//   name: string,
//   age: int,
//   if age <= 50 {
//     isOld: false,
//   }
//   if age > 50 {
//     isOld: true,
//   }
// }

// how to write loop
// [for x in #items if x rem 2 == 0 { x*x }]