{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable  #-}
module HOpenFX where
-- OpenFX API Hacking in haskell
--
-- Main interest is to test the C foreign function interface in haskell
--
-- docs from : 
-- http://weblog.haskell.cz/pivnik/building-a-shared-library-in-haskell/
--
-- These two functions have to be implemented to initiate the communication 
-- with the host :
--    int OfxGetNumberOfPlugins(void) 
--      - identifies how many plug-ins are implemented in the file,
--    OfxPlugin *OfxGetPlugin(int N) 
--      - returns a structure identifying the Nth plug-in in the file.

--
-- The OfxPlugin has a predefined structure
--
--
import Foreign
import Foreign.ForeignPtr
import OfxCore
import Foreign.C.Types
import Foreign.C.String
import Control.Applicative
import Data.IORef
import OfxProperty

-- |Global state variable to store the pointer to the host given by the 
-- host itself
gHost :: IORef HOfxHostPtr 
gHost = unsafePerformIO (newIORef nullPtr)
{-# NOINLINE gHost #-}

-- |Functions called by the host via mainEntryFunc
-- pluginFunctions = [("kActionLoadPlugin", loadPlugin)]

-- |Hack to statically define a FunPtr to a haskell function
foreign export ccall "setOfxHost" setOfxHost :: HOfxHostPtr -> IO ()
foreign import ccall "&setOfxHost" setOfxHostPtr :: FunPtr (HOfxHostPtr -> IO ())
setOfxHost :: HOfxHostPtr -> IO ()
setOfxHost h = do
    print h
    putStrLn "haskell:setOfxHost passed"
    writeIORef gHost h    
    putStrLn "haskell:host stored in IORef"
    return ()

-- |Hack to statically define a FunPtr to a haskell function
--  Defines the main entry function the host use to run the plugin
foreign export ccall "mainEntryFunc" mainEntryFunc :: (CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt)
foreign import ccall "&mainEntryFunc" mainEntryFuncPtr :: FunPtr (CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt)
mainEntryFunc :: CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt
mainEntryFunc a _ _ _   = do 
    putStrLn "haskell:mainEntryFunc called"
    action <- peekCString a
    print action
    -- TODO : return kOfxStatOk
    -- find a way to pass all the define constants 
    host <- readIORef gHost
    print host
    return 0

-- |Creates the default plugin informations that will be passed
--  to the host when it will load the plugin
newPlugin :: IO HOfxPlugin
newPlugin =
  HOfxPlugin
    <$> newCString "OfxImageEffectPluginAPI"
    <*> return 1    -- Api version
    <*> newCString "HOpenFX"
    <*> return 1    -- plugin major version
    <*> return 1    -- plugin minor version
    <*> return setOfxHostPtr
    <*> return mainEntryFuncPtr
----------------------------------------
-- The two ofx mandatory functions
----------------------------------------

-- |Returns the number of plugins in this module
foreign export ccall "OfxGetNumberOfPlugins" ofxGetNumberOfPlugins :: IO CInt
ofxGetNumberOfPlugins :: IO CInt
ofxGetNumberOfPlugins = do
    putStrLn "ofxGetNumber of plugins called"
    return 1


-- |Returns the plugin structure
foreign export ccall "OfxGetPlugin" ofxGetPlugin  :: CInt -> IO (Ptr HOfxPlugin)
ofxGetPlugin :: CInt -> IO (Ptr HOfxPlugin)
ofxGetPlugin i = do
  putStrLn "ofxGetPlugin called "
  print i
  myPlug <- newPlugin
  print myPlug
  new myPlug


