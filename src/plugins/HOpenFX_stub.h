#include "HsFFI.h"
#ifdef __cplusplus
extern "C" {
#endif
extern void setOfxHost(HsPtr a1);
extern HsInt32 mainEntryFunc(HsPtr a1, HsPtr a2, HsPtr a3, HsPtr a4);
extern HsInt32 OfxGetNumberOfPlugins(void);
extern HsPtr OfxGetPlugin(HsInt32 a1);
#ifdef __cplusplus
}
#endif

