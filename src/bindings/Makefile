
.SUFFIXES= .chs .hs

all: OfxCore.hs OfxProperty.hs OfxParam.hs

%.hs: %.chs
	c2hs $<

clean:
	rm Ofx*.hs Ofx*.chs.h Ofx*.chi *.o *.hi
