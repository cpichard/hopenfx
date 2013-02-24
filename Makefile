#
#ghc -O2 --make -no-hs-main -static -optl-pthread -optl-static -optc '-DMODULE=OfxPlugin' -o  OfxPlugin.so OfxPlugin.hs library_init.c
#ghc -O2 -no-hs-main -shared -fPIC -dynamic -optl-pthread -optc '-DMODULE=OfxPlugin' -L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -o  OfxPlugin.so OfxPlugin.hs library_init.c
#ghc -O2 -no-hs-main -shared -dynamic -fPIC -optl-pthread -optc '-DMODULE=OfxPlugin' -L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  OfxPlugin.so OfxPlugin.hs library_init.c


#ghc -O2 -no-hs-main -shared -dynamic -fPIC -optc '-DMODULE=HOpenFX' -L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/code/work/cyril/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  HOpenFX.ofx.bundle/Contents/Linux-x86-64/HOpenFX.ofx library_init.c HOpenFX.hs


GHCLIB=/usr/local/lib/ghc-7.4.1/

all: host bindings

bindings:
	ghc -O2 -no-hs-main -shared -dynamic -fPIC -optc '-DMODULE=HOpenFX' -L$(GHCLIB)/base-4.5.0.0/ -optc '-L$(GHCLIB)/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  HOpenFX.ofx.bundle/Contents/Linux-x86-64/HOpenFX.ofx library_init.c HOpenFX.hs

host: test.o
	gcc test.o -ldl

test.o:
	gcc -c test.c

clean:
	rm *.o *.hi *.chi a.out