{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable, TypeSynonymInstances  #-}

module OfxProperty where

import C2HS
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
#include "ofxProperty.h"

-- | TODO : find a way to automagically pass all defines 
kOfxPropertySuite = "OfxPropertySuite" 

-- |Blind pointer on a property set handle
type OfxPropertySetHandle = Ptr ()

-- |Bindings to a property suite.
-- |A property suite contains lots of functions used to retrieve and set properties
-- |to OFX objects.
data HOfxPropertySuiteV1 = 
  HOfxPropertySuiteV1 
    {
        propSetPointer :: FunPtr (OfxPropertySetHandle 
                       -> CString
                       -> CInt
                       -> Ptr ()
                       -> IO CInt)

    }


instance Storable HOfxPropertySuiteV1 where
    sizeOf _ = {#sizeof OfxPropertySuiteV1#}
    alignment _ = 4
    peek p = 
      HOfxPropertySuiteV1
        <$> {#get OfxPropertySuiteV1->propSetPointer#} p
    
    poke p x = do
      {#set OfxPropertySuiteV1.propSetPointer #} p (propSetPointer x)

