HOPENFX
=======

Incomplete OpenFX bindings for haskell with test plugin and mini host. This project is just a sandbox to test the foreign function interface in haskell.

Build
=======

change the src/plugins/Makefile to point to the correct libHSrts.

make

Testing
=======
export OFX_PLUGIN_PATH=/path/to/src/plugins/
open -a nuke
