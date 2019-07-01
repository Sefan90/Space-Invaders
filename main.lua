L=love
G=L.graphics
R=G.rectangle
K=L.keyboard.isDown
F="fill"
N={5,5,5,5,5,5,5,5,5,5,5}
x=0

B=0
V=0
D=1

I=0
O=0
P=0

function L.draw()
    W,H=G.getDimensions()
    S=W/30
    y=H-S

    if K("a")and x-1>0 then
        x=x-1
    end
    if K("d")and x+1<W-S then
        x=x+1
    end
    if K("w")and D>0 then
        B=x
        V=y
        D=0
    end

    if I<1 then
        O=O+.05
    else
        O=O-.05
    end
    if O>S then 
        I=1
        P=P+S
    end
    if O<-S then
        I=0
        P=P+S
    end
    V=V-1

    if D<1 then
        R(F,B,V,1,S)
    end
    if V<0 then
        D=1
    end
    for i=1,11 do
        for j=1,4 do
            if B>2*i*S+O and B<2*i*S+O+S and V>2*j*S+P and V<2*j*S+P+S and N[i] > j and D<1 then
                D=1
                N[i]=N[i]-1
            end
            if N[i] > j then
                R(F,2*i*S+O,2*j*S+P,S,S)
            end
        end
    end
    R(F,x,y,S,S)
end