{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable, TypeSynonymInstances  #-}

module OfxProperty where

import System.IO.Unsafe
import Foreign
import Foreign.C
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr
import Control.Monad
import Control.Applicative
import Data.Typeable
import OfxCore

#include "../ofx/ofxProperty.h"

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
                       -> IO OfxStatus)

    ,   propSetString :: FunPtr (OfxPropertySetHandle
                      -> CString -- property
                      -> CInt    -- index
                      -> CString -- value
                      -> IO OfxStatus)

    ,   propSetDouble :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> CDouble
                      -> IO OfxStatus)

    ,   propSetInt :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> CInt
                      -> IO OfxStatus)

    ,   propSetPointerN :: FunPtr (OfxPropertySetHandle
                        -> CString
                        -> CInt
                        -> Ptr (Ptr ())
                        -> IO OfxStatus)

    ,   propSetStringN :: FunPtr (OfxPropertySetHandle
                       -> CString
                       -> CInt
                       -> Ptr (CString)
                       -> IO OfxStatus)

    ,  propSetDoubleN :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (CDouble)
                      -> IO OfxStatus)

    ,  propSetIntN    :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (CInt)
                      -> IO OfxStatus)

    , propGetPointer  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (Ptr () )
                      -> IO OfxStatus)

    , propGetString  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (CString)
                      -> IO OfxStatus)

    , propGetDouble  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr CDouble
                      -> IO OfxStatus)

    , propGetInt  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr CInt
                      -> IO OfxStatus)

    , propGetPointerN  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (Ptr () )
                      -> IO OfxStatus)

    , propGetStringN  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr (CString)
                      -> IO OfxStatus)

    , propGetDoubleN  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr CDouble
                      -> IO OfxStatus)

    , propGetIntN  :: FunPtr (OfxPropertySetHandle
                      -> CString
                      -> CInt
                      -> Ptr CInt
                      -> IO OfxStatus)

    , propReset :: FunPtr (OfxPropertySetHandle
                -> CString
                -> IO OfxStatus)

    , propGetDimension :: FunPtr (OfxPropertySetHandle
                       -> CString
                       -> Ptr CInt
                       -> IO OfxStatus)
    }


instance Storable HOfxPropertySuiteV1 where
    sizeOf _ = {#sizeof OfxPropertySuiteV1#}
    alignment _ = 4
    peek p =
      HOfxPropertySuiteV1
        <$> {#get OfxPropertySuiteV1->propSetPointer#} p
        <*> {#get OfxPropertySuiteV1->propSetString#} p
        <*> {#get OfxPropertySuiteV1->propSetDouble#} p
        <*> {#get OfxPropertySuiteV1->propSetInt#} p
        <*> {#get OfxPropertySuiteV1->propSetPointerN#} p
        <*> {#get OfxPropertySuiteV1->propSetStringN#} p
        <*> {#get OfxPropertySuiteV1->propSetDoubleN#} p
        <*> {#get OfxPropertySuiteV1->propSetIntN#} p
        <*> {#get OfxPropertySuiteV1->propGetPointer#} p
        <*> {#get OfxPropertySuiteV1->propGetString#} p
        <*> {#get OfxPropertySuiteV1->propGetDouble#} p
        <*> {#get OfxPropertySuiteV1->propGetInt#} p
        <*> {#get OfxPropertySuiteV1->propGetPointerN#} p
        <*> {#get OfxPropertySuiteV1->propGetStringN#} p
        <*> {#get OfxPropertySuiteV1->propGetDoubleN#} p
        <*> {#get OfxPropertySuiteV1->propGetIntN#} p
        <*> {#get OfxPropertySuiteV1->propReset#} p
        <*> {#get OfxPropertySuiteV1->propGetDimension#} p

    poke p x = do
      {#set OfxPropertySuiteV1.propSetPointer #} p (propSetPointer x)
      {#set OfxPropertySuiteV1.propSetString #} p (propSetString x)
      {#set OfxPropertySuiteV1.propSetDouble #} p (propSetDouble x)
      {#set OfxPropertySuiteV1.propSetInt #} p (propSetInt x)
      {#set OfxPropertySuiteV1.propSetPointerN #} p (propSetPointerN x)
      {#set OfxPropertySuiteV1.propSetStringN #} p (propSetStringN x)
      {#set OfxPropertySuiteV1.propSetDoubleN #} p (propSetDoubleN x)
      {#set OfxPropertySuiteV1.propSetIntN #} p (propSetIntN x)
      {#set OfxPropertySuiteV1.propGetPointer #} p (propGetPointer x)
      {#set OfxPropertySuiteV1.propGetString #} p (propGetString x)
      {#set OfxPropertySuiteV1.propGetDouble #} p (propGetDouble x)
      {#set OfxPropertySuiteV1.propGetInt #} p (propGetInt x)
      {#set OfxPropertySuiteV1.propGetPointerN #} p (propGetPointerN x)
      {#set OfxPropertySuiteV1.propGetStringN #} p (propGetStringN x)
      {#set OfxPropertySuiteV1.propGetDoubleN #} p (propGetDoubleN x)
      {#set OfxPropertySuiteV1.propGetIntN #} p (propGetIntN x)
      {#set OfxPropertySuiteV1.propReset #} p (propReset x)
      {#set OfxPropertySuiteV1.propGetDimension #} p (propGetDimension x)

