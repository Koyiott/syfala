import("stdfaust.lib");

ba = library("basics.lib");
si = library("signals.lib");

import("tubes.lib");
import("tonestacks.lib");

// ------------------ Looper ----------------------------------

selector=nentry("Selector", 1, 1, 3, 1);
//vol1=hslider("Volume Looper 1", 1, 0, 1, 0.01);
//vol2=hslider("Volume Looper 2", 1, 0, 1, 0.01);

stop = button("Stop [switch:6]") : int;
stopLatched=|(stop)~(_*(1-record));

looperLength=15;//time in sec
tableSize = (48000*looperLength)+1;
endOfRecordLatched=|(recordLooper1)~(_*(1-stopLatched));

record = button("Record [switch:5]") : int;
recordLooper1=record*(selector==1);
recordLooper2=record*(selector==2);

endOfRecordLooper1=(recordLooper1'==1)&(recordLooper1==0);
endOfTable=recIndexMinusOne:ba.latch(1-endOfRecordLooper1);
recIndexMinusOne = +(1)~*(recordLooper1'') : %(tableSize-1);


recIndex1 = +(1)~*(recordLooper1): %(tableSize-1),tableSize:select2(1-recordLooper1);
readIndex= +(1)~*(endOfRecordLatched) : %(endOfTable),recIndex1:select2(recordLooper1);
looper1 = rwtable(tableSize,0.0,recIndex1-1,_,readIndex-1);

recIndex2 = readIndex,tableSize:select2(1-recordLooper2);
looper2 = rwtable(tableSize,0.0,recIndex2-1,_,readIndex-1);

// ------------------ TUBE SCREAMER ----------------------------------


/****************************************************************************************
 * 1-dimensional function tables for nonlinear interpolation
****************************************************************************************/
nonlininterpolation(table, low, high, step, size, x) = ts9(low, step, size, table, x),inverse(x) : ccopysign;

//-- Interpolate value from table
ts9(low, step, size, table, x) = interpolation(table, getCoef(low, step, size, x),
										nonlinindex(low, step, x) : boundIndex(size));

//-- Calculate non linear index
nonlinindex(low, step, x) = (abs(x)/(3.0 + abs(x)) - low) * step;

//--Get interpolation factor
getCoef(low, step, size, x) = boundFactor(size, nonlinindex(low, step, x), nonlinindex(low, step, x) : boundIndex(size));

/********* Faust Version of ts9nonlin.cc, generated by tools/ts9sim.py ****************/

ts9comp = nonlininterpolation(ts9table, low, high, step, size)
with {

// Characteristics of the wavetable
low = 0.0;
high = 0.970874;
step = 101.97;
size = 99; // (real size = 100, set the actual size at 100-1 for interpolation to work at the last point)

ts9table = waveform{0.0,-0.0296990148227,-0.0599780676992,-0.0908231643281,-0.122163239629,
	-0.15376009788,-0.184938007182,-0.214177260107,-0.239335434213,-0.259232575019,
	-0.274433909887,-0.286183308354,-0.29553854444,-0.303222323477,-0.309706249977,
	-0.315301338712,-0.320218440785,-0.324604982281,-0.328567120703,-0.332183356975,
	-0.335513124719,-0.33860236542,-0.34148724693,-0.344196707008,-0.346754233717,
	-0.34917913798,-0.351487480543,-0.35369275887,-0.355806424152,-0.357838275995,
	-0.359796767655,-0.361689244919,-0.363522135105,-0.365301098113,-0.367031148289,
	-0.368716753588,-0.370361916943,-0.371970243537,-0.373544996828,-0.375089145544,
	-0.376605403346,-0.378096262548,-0.379564022938,-0.381010816596,-0.382438629377,
	-0.383849319643,-0.385244634694,-0.386626225283,-0.387995658543,-0.389354429565,
	-0.39070397188,-0.392045667012,-0.393380853288,-0.39471083403,-0.396036885269,
	-0.397360263098,-0.398682210753,-0.400003965547,-0.401326765733,-0.402651857394,
	-0.403980501471,-0.405313980999,-0.406653608692,-0.40800073496,-0.409356756504,
	-0.410723125631,-0.412101360439,-0.413493056085,-0.414899897347,-0.416323672745,
	-0.417766290556,-0.419229797097,-0.420716397759,-0.422228481377,-0.423768648654,
	-0.425339745558,-0.426944902828,-0.428587583057,-0.430271637224,-0.432001373102,
	-0.433781638746,-0.435617925286,-0.437516494692,-0.439484540257,-0.441530390423,
	-0.443663770898,-0.445896146322,-0.448241172434,-0.450715304661,-0.453338632988,
	-0.45613605235,-0.45913894467,-0.46238766699,-0.465935359011,-0.469854010456,
	-0.474244617411,-0.479255257451,-0.48511588606,-0.492212726244,-0.501272723631
	};
};
ts9sim = ts9nonlin : lowpassfilter : *(gain)
with {
    driveSl=vslider("h: TS9/Drive", 0.2, 0, 1, 0.01);
    toneSl=vslider("h: TS9/Tone[log]", 800, 100, 1000, 1.03);
    gainSl=vslider("h: TS9/Level", -9, -20, 4, 0.1);
    R1 = 4700;
    R2 = 51000 + 500000 * driveSl;
    C = 0.047 * 1e-6;
    a1 = (R1 + R2) * C * 2 * ma.SR;
    a2 = R1 * C * 2 * ma.SR;
    B0 = (1 + a1) / (1 + a2);
    B1 = (1 - a1) / (1 + a2);
    A1 = (1 - a2) / (1 + a2);
    X2 = fi.tf1(B0, B1, A1);

    ts9nonlin = _ <: _ ,(X2,_ : - : ts9comp) : - :> _;

    fc = toneSl;
    lowpassfilter = fi.lowpass(1,fc);
    gain =  gainSl : ba.db2linear : si.smoo;
};

// ------------------ WFS ----------------------------------

celerity = 343;

// Creates a speaker array for one source
speakerArray(NC,SD,x,y) = _ <:
    par(i,NC,de.fdelay(intSpeakMaxDel,smallDel(i))/d(i))
with{
    maxDistanceDel = mD*ma.SR/celerity;
    intSpeakMaxDel = NC*SD*ma.SR/celerity;
    d(j) = (x-(SD*j))^2 + y^2 : sqrt;
    largeDel = y*ma.SR/celerity;
    smallDel(j) = (d(j)-y)*ma.SR/celerity;
};

// For future versions...
speakerArraySpheric(NC,SD,x,y) = par(i,NC,de.delay(ma.SR,d(i))*(1/d(i)))
with{
    d(j) = (x-(SD*j))^2 + y^2 : sqrt : *(ma.SR)/celerity;
};

// In the current version the position of sources is static...
sourcesArray(NC,SD,s) = par(i,ba.count(s),ba.take(i+1,s) :
    speakerArray(NC,SD,x(i),y(i))) :> par(i,NC,_)
with{
    x(0) = hslider("v: Looper 0/x0",SD*NC/2,0,SD*NC,0.01);
    y(0) = hslider("v: Looper 0/y0",1.5,1,mD,0.01);
    x(1) = hslider("v: Looper 1/x1  ",SD*NC/2,0,SD*NC,0.01);
    y(1) = hslider("v: Looper 1/y1  ",1.5,1,mD,0.01);
    x(2) = hslider("v: Looper 2/x2  ",SD*NC/2,0,SD*NC,0.01);
    y(2) = hslider("v: Looper 2/y2  ",1.5,1,mD,0.01);
};

// ------------------ Implementation ----------------------------------

nSpeakers = 32; // number of speakers
nSources = 3; // number of sources
mD = 10; // maxim distance in meters
speakersDist = 0.0783; // distance between speakers

process =ts9sim<:looper1,looper2,_*(1-recordLooper1)*(1-recordLooper2):sourcesArray(nSpeakers,speakersDist,par(i,nSources,_));
