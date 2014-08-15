-- OpenFX API Hacking in haskell
{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable  #-}
--
-- Main interest is testing the C foreign function interface in haskell
--
-- docs from :
-- http://weblog.haskell.cz/pivnik/building-a-shared-library-in-haskell/
--
-- http://openfx.sourceforge.net/Documentation/1.3/index.html
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
module HOpenFX where

import Foreign
import Foreign.ForeignPtr
import Foreign.C.Types
import Foreign.C.String
import Control.Applicative
import Data.IORef
import OfxProperty
import OfxCore
import System.IO.Unsafe

-- |Global state variable to store the pointer to the host given by the
-- host itself
gHost :: IORef HOfxHostPtr
gHost = unsafePerformIO (newIORef nullPtr)
{-# NOINLINE gHost #-}


loadPlugin :: Ptr () -> Ptr () -> Ptr () -> IO CInt
loadPlugin _ _ _= return kOfxStatOK

unloadPlugin :: Ptr () -> Ptr() -> Ptr() -> IO CInt
unloadPlugin _ _ _= return kOfxStatOK

-- |Hack to statically define a FunPtr to a haskell function
foreign export ccall "setOfxHost" setOfxHost :: HOfxHostPtr -> IO ()
foreign import ccall "&setOfxHost" setOfxHostPtr :: FunPtr (HOfxHostPtr -> IO ())
setOfxHost :: HOfxHostPtr -> IO ()
setOfxHost h = do
    print h
    putStrLn "haskell:setOfxHost"
    writeIORef gHost h
    putStrLn "haskell:host stored in IORef"
    return ()

-- |Hack to statically define a FunPtr to a haskell function
--  Defines the main entry function the host use to run the plugin
foreign export ccall "mainEntryFunc" mainEntryFunc :: (CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt)
foreign import ccall "&mainEntryFunc" mainEntryFuncPtr :: FunPtr (CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt)
mainEntryFunc :: CString -- Action
              -> Ptr ()  -- Handle
              -> Ptr ()  -- InArgs
              -> Ptr ()  -- OutArgs
              -> IO CInt -- Return kOfxStatXXX
mainEntryFunc act han ina out = do
    putStrLn "haskell:mainEntryFunc called"
    action <- peekCString act
    print action
    --host <- readIORef gHost
    --print host

    -- Dispatch functions given the action
    case lookup action functions of
      Just func  -> func han ina out
      Nothing -> do putStrLn $ "haskell:No function found for action " ++ show action
                    return kOfxStatFailed
    where functions
            = [ (kOfxActionLoad, loadPlugin)
              , (kOfxActionUnload, unloadPlugin)
              ]

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
    putStrLn "haskell:ofxGetNumber of plugins called"
    return 1

-- |Returns the plugin structure
foreign export ccall "OfxGetPlugin" ofxGetPlugin :: CInt -> IO (Ptr HOfxPlugin)
ofxGetPlugin :: CInt -> IO (Ptr HOfxPlugin)
ofxGetPlugin i = do
  putStrLn "haskell:ofxGetPlugin called "
  --print i
  myPlug <- newPlugin
  --print myPlug
  new myPlug


