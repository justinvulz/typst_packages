// #show regex("\p{script=Han}"):it=>[
//   #set text(font: ("Times New Roman","DFKai-SB"))
//   #text(weight: "bold")[#it]
// ]

#set text(font: ("Times New Roman","DFKai-SB"))

#let f(n)  ={n}
#let t = (f)(3)

#t