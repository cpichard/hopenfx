#define CAT(a,b) XCAT(a,b)
#define XCAT(a,b) a ## b
#define STR(a) XSTR(a)
#define XSTR(a) #a
 
#include <HsFFI.h>
#include <stdio.h> 
extern void CAT(__stginit_, MODULE)(void);
//extern void CAT(__stginit_, OfxPlugin)(void);
 
static void library_init(void) __attribute__((constructor));
static void library_init(void)
{
    /* This seems to be a no-op, but it makes the GHCRTS envvar work. */
    static char *argv[] = { STR(MODULE) ".so", 0 }, **argv_ = argv;
    static int argc = 1;
    printf("Loading library OfxPlugin and initializing rts"); 
    hs_init(&argc, &argv_);
    hs_add_root(CAT(__stginit_, MODULE));
    //hs_add_root(CAT(__stginit_, OfxPlugin));
}
 
static void library_exit(void) __attribute__((destructor));
static void library_exit(void)
{
    printf("Unloading library OfxPlugin "); 
    hs_exit();
}
