{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable, TypeSynonymInstances  #-}
{-# LANGUAGE CPP #-}
module OfxCore where

#include "ofxCore.h"
import C2HS
import System.IO.Unsafe
import Foreign
import Foreign.C
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr
import Control.Monad
import Control.Applicative
import Data.Typeable


#include "ofxCore.h"
{#context lib="openfx" #}

{#pointer *OfxHost as HOfxHostPtr -> HOfxHost #}

type OfxStatus = CInt

-- |
data HOfxHost =
  HOfxHost
    { host :: Ptr ()
    , fetchSuite :: FunPtr (Ptr () -> CString -> CInt -> IO (Ptr ()))
    }

-- type OfxPlugin = {#type OfxPlugin #}
{#pointer *OfxPlugin as HOfxPluginPtr -> HOfxPlugin #}

instance Storable HOfxHost where
  sizeOf _ = {#sizeof OfxHost#}
  alignment _ = 4
  peek p =
    HOfxHost
      <$> ({#get OfxHost->host#} p)
      <*> ({#get OfxHost->fetchSuite #}p)
  poke p x = do
    {#set OfxHost.host#} p (host x)
    {#set OfxHost.fetchSuite#} p (fetchSuite x)

-- | Simplifying the types of args for the main entry functions
type MainEntryArgs = CString -> Ptr () -> Ptr () -> Ptr ()

data HOfxPlugin =
  HOfxPlugin
    { pluginApi :: !CString
    , apiVersion :: !CInt
    , pluginIdentifier :: !CString
    , pluginVersionMajor :: !CInt
    , pluginVersionMinor :: !CInt
    , setHost :: FunPtr (HOfxHostPtr -> IO ())
    , mainEntry :: FunPtr (CString -> Ptr () -> Ptr () -> Ptr () -> IO CInt)
    } deriving (Show, Typeable)

instance Storable HOfxPlugin where
    sizeOf _ = {#sizeof OfxPlugin #}
    alignment _ = 4
    peek p =
      HOfxPlugin
          <$> {#get OfxPlugin->pluginApi#} p
          <*> liftM cIntConv ({#get OfxPlugin->apiVersion#} p)
          <*> ({#get OfxPlugin->pluginIdentifier#} p)
          <*> liftM cIntConv ({#get OfxPlugin->pluginVersionMajor#} p)
          <*> liftM cIntConv ({#get OfxPlugin->pluginVersionMinor#} p)
          <*> {#get OfxPlugin->setHost#} p
          <*> {#get OfxPlugin->mainEntry#} p
    poke p x = do
      {#set OfxPlugin.pluginApi #} p (pluginApi x)
      {#set OfxPlugin.apiVersion #} p (cIntConv $ apiVersion x)
      {#set OfxPlugin.pluginIdentifier #} p (pluginIdentifier x)
      {#set OfxPlugin.pluginVersionMajor #} p (cIntConv $ pluginVersionMajor x)
      {#set OfxPlugin.pluginVersionMinor #} p (cIntConv $ pluginVersionMinor x)
      {#set OfxPlugin.setHost#} p (setHost x)
      {#set OfxPlugin.mainEntry#} p (mainEntry x)


