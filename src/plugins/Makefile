# Old compilation options
#ghc -O2 --make -no-hs-main -static -optl-pthread -optl-static -optc '-DMODULE=OfxPlugin' -o  OfxPlugin.so OfxPlugin.hs library_init.c
#ghc -O2 -no-hs-main -shared -fPIC -dynamic -optl-pthread -optc '-DMODULE=OfxPlugin' -L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -o  OfxPlugin.so OfxPlugin.hs library_init.c
#ghc -O2 -no-hs-main -shared -dynamic -fPIC -optl-pthread -optc '-DMODULE=OfxPlugin' -L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  OfxPlugin.so OfxPlugin.hs library_init.c
#ghc -O2 -no-hs-main -shared -dynamic -fPIC -optc '-DMODULE=HOpenFX' -L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/ -optc '-L/usr/local/lib/ghc-7.4.1/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  HOpenFX.ofx.bundle/Contents/Linux-x86-64/HOpenFX.ofx library_init.c HOpenFX.hs

#GHCLIB=/usr/local/lib/ghc-7.4.1/
PLUGINDIR=HOpenFX.ofx.bundle/Contents/MacOS-x86-64/
#all:
#	mkdir -p $(PLUGINDIR);\
#    ghc -O2 -no-hs-main -shared -dynamic -fPIC -optc '-DMODULE=HOpenFX' -i../bindings/ -L$(GHCLIB)/base-4.5.0.0/ -optc '-L$(GHCLIB)/base-4.5.0.0/' -lHSrts-ghc7.4.1 -o  $(PLUGINDIR)/HOpenFX.ofx library_init.c HOpenFX.hs

all: $(PLUGINDIR)
	ghc -O2 -no-hs-main -shared \
	-optl -v -optl -lCffi -optl -L/Users/cyril/opt/ghc-7.8.2/lib/ghc-7.8.2/rts-1.0/ -optl -lHSrts \
    -optc '-DMODULE=HOpenFX' -i../bindings/ \
	-o $(PLUGINDIR)/HOpenFX.ofx library_init.c HOpenFX.hs

$(PLUGINDIR):
	mkdir -p $(PLUGINDIR);


clean:
	rm *.o *.hi
