module Main where
import Data.Dynamic
import System.Posix.DynamicLinker
import Foreign.Ptr
import Foreign.C
import OfxCore

type GetNumPluginsFun = IO CInt
foreign import ccall "dynamic"
  mkFun :: FunPtr GetNumPluginsFun -> GetNumPluginsFun

type GetPluginFun = CInt -> IO HOfxPluginPtr 
foreign import ccall "dynamic"
  mkGetPlugin :: FunPtr GetPluginFun -> GetPluginFun

ofxFetchSuite :: Ptr () -> CString -> CInt -> IO (Ptr ())

main :: IO ()
main = do
  -- store the list of plugins
  lib <- dlopen "../plugins/HOpenFX.ofx.bundle/Contents/Linux-x86-64/HOpenFX.ofx" [RTLD_LAZY]
  fun <- dlsym lib "OfxGetNumberOfPlugins"
  np <- mkFun fun
  putStrLn $ "nbplugins:" ++ show np
  getPluginsPtr <- dlsym lib "OfxGetPlugin"
  plugin1 <- mkGetPlugin getPluginsPtr 1
  --(setHost plugin1) host
  print "done" 

  -- TODO create a host structure
  -- pass it to the plugin
  --plug->setHost(NULL);
  --const int k = plug->mainEntry( "OfxTest", NULL, NULL, NULL);
