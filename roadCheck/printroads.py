#!/usr/bin/env python
for bar1 in range(0,32):
    for bar2 in range(0,50):
        test1 = (6.0-bar1)/6 + (bar2-25.8)/18 #max z0 cut
        test2 = (31.1-bar1)/31 + (bar2-5.9)/42 #min z0 cut
        test3 = (18.8-bar1)/10 + (bar2-46.2)/3 #H4Y acceptance
        if ((test1<1.0 and not (bar1==3 and bar2==34)) and (test2>1.0 or (bar1==4 and bar2==11) or (bar1==15 and bar2==26)) and test3<1.0):
            print("{0} {1}".format(bar1,bar2))

