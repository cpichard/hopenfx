-- GENERATED by C->Haskell Compiler, version 0.16.3 Crystal Seed, 24 Jan 2009 (Haskell)
-- Edit the ORIGNAL .chs file instead!


{-# LINE 1 "OfxProperty.chs" #-}{-# LANGUAGE ForeignFunctionInterface, DeriveDataTypeable, TypeSynonymInstances  #-}

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
import OfxCore


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
                      -> Ptr ( CDouble)
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
    sizeOf _ = 72
{-# LINE 140 "OfxProperty.chs" #-}
    alignment _ = 4
    peek p =
      HOfxPropertySuiteV1
        <$> (\ptr -> do {peekByteOff ptr 0 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr ()) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 4 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CChar) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 8 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> (CDouble -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 12 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> (CInt -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 16 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 20 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 24 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 28 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 32 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 36 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 40 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 44 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 48 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 52 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 56 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 60 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt))))))}) p
        <*> (\ptr -> do {peekByteOff ptr 64 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> (IO CInt))))}) p
        <*> (\ptr -> do {peekByteOff ptr 68 ::IO (FunPtr ((Ptr ()) -> ((Ptr CChar) -> ((Ptr CInt) -> (IO CInt)))))}) p

    poke p x = do
      (\ptr val -> do {pokeByteOff ptr 0 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr ()) -> (IO CInt)))))))}) p (propSetPointer x)
      (\ptr val -> do {pokeByteOff ptr 4 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CChar) -> (IO CInt)))))))}) p (propSetString x)
      (\ptr val -> do {pokeByteOff ptr 8 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> (CDouble -> (IO CInt)))))))}) p (propSetDouble x)
      (\ptr val -> do {pokeByteOff ptr 12 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> (CInt -> (IO CInt)))))))}) p (propSetInt x)
      (\ptr val -> do {pokeByteOff ptr 16 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt)))))))}) p (propSetPointerN x)
      (\ptr val -> do {pokeByteOff ptr 20 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt)))))))}) p (propSetStringN x)
      (\ptr val -> do {pokeByteOff ptr 24 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt)))))))}) p (propSetDoubleN x)
      (\ptr val -> do {pokeByteOff ptr 28 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt)))))))}) p (propSetIntN x)
      (\ptr val -> do {pokeByteOff ptr 32 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt)))))))}) p (propGetPointer x)
      (\ptr val -> do {pokeByteOff ptr 36 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt)))))))}) p (propGetString x)
      (\ptr val -> do {pokeByteOff ptr 40 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt)))))))}) p (propGetDouble x)
      (\ptr val -> do {pokeByteOff ptr 44 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt)))))))}) p (propGetInt x)
      (\ptr val -> do {pokeByteOff ptr 48 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr ())) -> (IO CInt)))))))}) p (propGetPointerN x)
      (\ptr val -> do {pokeByteOff ptr 52 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr (Ptr CChar)) -> (IO CInt)))))))}) p (propGetStringN x)
      (\ptr val -> do {pokeByteOff ptr 56 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CDouble) -> (IO CInt)))))))}) p (propGetDoubleN x)
      (\ptr val -> do {pokeByteOff ptr 60 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (CInt -> ((Ptr CInt) -> (IO CInt)))))))}) p (propGetIntN x)
      (\ptr val -> do {pokeByteOff ptr 64 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> (IO CInt)))))}) p (propReset x)
      (\ptr val -> do {pokeByteOff ptr 68 (val::(FunPtr ((Ptr ()) -> ((Ptr CChar) -> ((Ptr CInt) -> (IO CInt))))))}) p (propGetDimension x)

