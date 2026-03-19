Do = 0
Dc = 1
LacY = 0

c1  = 0.01    # activation (moderate, cooperative)
c2  = 0.01      # slow deactivation
c3  = 0.001     # very low basal production
c3p = 50.0      # strong ON production
c4  = 0.05      # degradation

R1:
    Dc + {2.0} LacY > Do + {2.0} LacY
    c1*Dc

R2:
    Do > Dc 
    c2*Do

R3:
    Do > Do + LacY
    c3p*Do

R4:
    $pool > LacY
    c3

R5:
    LacY > $pool
    c4*LacY
