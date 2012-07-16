#include <stdio.h>
#include <dlfcn.h>

#include "ofxCore.h"

/** Test plugin exports without nuke
 */


void test_hopenfx(void) {

    void *dl = dlopen("./HOpenFX.ofx.bundle/Contents/Linux-x86-64/HOpenFX.ofx", RTLD_LAZY);
    if(dl) {
        printf("\ntest:Library loaded\n");
    }


    int (*numberOfPlugin)() = (int(*)(int)) dlsym(dl, "OfxGetNumberOfPlugins");
    if(numberOfPlugin) {
        printf("test:number of plugin found\n");
        printf("test:number of plugins:%d\n", numberOfPlugin() );
    }

    void *(*getPlugin)(int) = (void *(*)(int)) dlsym(dl, "OfxGetPlugin");

    if(getPlugin) {
        printf("test:getPlugin function found\n");
        OfxPlugin *plug = getPlugin(0);
        printf("test:getPlugin called\n");
        printf("test:plug at adress:%d\n", plug);
        printf("test:calling set host\n");
        plug->setHost(NULL);
        printf("test:set host called\n");
        printf("test:calling main entry\n");
        const int k = plug->mainEntry( "OfxTest", NULL, NULL, NULL);  
        printf("test:main entry called and returned %d\n", k);
    }

    if(dl) dlclose(dl);
}

int main(int argc, char *argv[]) {
    test_hopenfx();
    return 0;
}
