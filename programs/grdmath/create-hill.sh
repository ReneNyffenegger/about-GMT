  grdmath -R10/12/2/4 -I0.025  X 11 SUB     DUP  ABS     0.8     LT    EXCH    0.8     DIV          PI        MUL           COS         1       ADD        MUL               Y 2 SUB 2 DIV 0.95 MUL PI MUL SIN     MUL       3.5 Y SUB   -0.4 MUL          ADD = hill.nc    
# #                                                      0.8                   0.8                  π                                   1                                                                                
# #                                         d   |d|     |d|      α     d       d       d/0.8        d/0.8     x₁=π*d/0.8    cos(x₁)     cos(x₁) 1+cos(x₁)                    y₁=sin((Y-2/2)*0.95*π)                          3.5-Y       y₂=-0.4*(3.5-Y)
# #                            d=11-x       d    d       d       d     α       α       α            α         α             α           α       α          x₂=α(1+cos(X₁))                                         z₁=x₂*y₁                                z₁+y₂           
