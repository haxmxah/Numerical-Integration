# Numerical-Integration
Trapezoids and Simpson numerical methods applied to the orbit of comet Crommelin.

## 1 Orbit of comet Crommelin
Describes an ellipse.

$$f(x) = a \sqrt{1-\frac{(x+2b)^2}{b^2}}$$

With the parameters $a= 1376.3 \cdot 10^6$ km and $b=542.617\cdot 10^6$ km.

## Computation the area of the ellipse 
We calculate the are with the Simpson and Trapezoids method.

$$Area=A= 4 \int_{-3b}^{-2b} f(x)dx$$

## Study of how the error of the area calculation varies with the length of the subintervals h.
Knowing that the exact value is 

$$A= \pi ab$$

## Study of the error of the error associated comparing both methods
We are now going to study the behavior of the two methos computing:

$$A_2 = \int_{-5b/2}^{-2b}$$

Where $A_{exact}= ab(3\sqrt{3}+2\pi)/24$.

# Compilation and execution of the program
This program was written in _Fortran_ 77 and the graphics were plotted with _Gnuplot_.
## Linux and Mac
### Compilation

```
gfortran -name_of_the_file.f -o name_of_the_output_file.out
```
### Execution
```
./name_of_the_output_file.out
```

## Windows
### Compilation
```
gfortran -name_of_the_file.f -o name_of_the_output_file.exe
```
### Execution
```
./name_of_the_output_file.exe
```
