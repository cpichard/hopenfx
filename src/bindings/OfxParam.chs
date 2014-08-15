

module OfxParam where

import OfxProperty

#include "../ofx/ofxParam.h"

-- Brute force copy of defines
kOfxParameterSuite = "OfxParameterSuite"
kOfxTypeParameter = "OfxTypeParameter"
kOfxTypeParameterInstance = "OfxTypeParameterInstance"


--typedef struct OfxParamStruct *OfxParamHandle;
type OfxParamHandle = Ptr ()

--typedef struct OfxParamSetStruct *OfxParamSetHandle;
type OfxParamSetHandle = Ptr ()

-- | Variable argument. How do we handle varargs with ffi ?
type VarArg = Ptr ()

-- Brute force copy of defines
kOfxParamTypeInteger = "OfxParamTypeInteger"
kOfxParamTypeDouble = "OfxParamTypeDouble"
kOfxParamTypeBoolean = "OfxParamTypeBoolean"
kOfxParamTypeChoice = "OfxParamTypeChoice"
kOfxParamTypeRGBA = "OfxParamTypeRGBA"
kOfxParamTypeRGB = "OfxParamTypeRGB"
kOfxParamTypeDouble2D = "OfxParamTypeDouble2D"
kOfxParamTypeInteger2D = "OfxParamTypeInteger2D"
kOfxParamTypeDouble3D = "OfxParamTypeDouble3D"
kOfxParamTypeInteger3D = "OfxParamTypeInteger3D"
kOfxParamTypeString = "OfxParamTypeString"
kOfxParamTypeCustom = "OfxParamTypeCustom"
kOfxParamTypeGroup = "OfxParamTypeGroup"
kOfxParamTypePage = "OfxParamTypePage"
kOfxParamTypePushButton = "OfxParamTypePushButton"
kOfxParamHostPropSupportsCustomAnimation = "OfxParamHostPropSupportsCustomAnimation"
kOfxParamHostPropSupportsStringAnimation = "OfxParamHostPropSupportsStringAnimation"
kOfxParamHostPropSupportsBooleanAnimation = "OfxParamHostPropSupportsBooleanAnimation"
kOfxParamHostPropSupportsChoiceAnimation = "OfxParamHostPropSupportsChoiceAnimation"
kOfxParamHostPropSupportsCustomInteract = "OfxParamHostPropSupportsCustomInteract"
kOfxParamHostPropMaxParameters = "OfxParamHostPropMaxParameters"
kOfxParamHostPropMaxPages = "OfxParamHostPropMaxPages"
kOfxParamHostPropPageRowColumnCount = "OfxParamHostPropPageRowColumnCount"
kOfxParamPageSkipRow = "OfxParamPageSkipRow"
kOfxParamPageSkipColumn = "OfxParamPageSkipColumn"
kOfxParamPropInteractV1 = "OfxParamPropInteractV1"
kOfxParamPropInteractSize = "OfxParamPropInteractSize"
kOfxParamPropInteractSizeAspect = "OfxParamPropInteractSizeAspect"
kOfxParamPropInteractMinimumSize = "OfxParamPropInteractMinimumSize"
kOfxParamPropInteractPreferedSize = "OfxParamPropInteractPreferedSize"
kOfxParamPropType = "OfxParamPropType"
kOfxParamPropAnimates = "OfxParamPropAnimates"
kOfxParamPropCanUndo = "OfxParamPropCanUndo"
kOfxPropParamSetNeedsSyncing = "OfxPropParamSetNeedsSyncing"
kOfxParamPropIsAnimating = "OfxParamPropIsAnimating"
kOfxParamPropPluginMayWrite = "OfxParamPropPluginMayWrite"
kOfxParamPropPersistant = "OfxParamPropPersistant"
kOfxParamPropEvaluateOnChange = "OfxParamPropEvaluateOnChange"
kOfxParamPropSecret = "OfxParamPropSecret"
kOfxParamPropScriptName = "OfxParamPropScriptName"
kOfxParamPropCacheInvalidation = "OfxParamPropCacheInvalidation"
kOfxParamInvalidateValueChange = "OfxParamInvalidateValueChange"
kOfxParamInvalidateValueChangeToEnd = "OfxParamInvalidateValueChangeToEnd"
kOfxParamInvalidateAll = "OfxParamInvalidateAll"
kOfxParamPropHint = "OfxParamPropHint"
kOfxParamPropDefault = "OfxParamPropDefault"
kOfxParamPropDoubleType = "OfxParamPropDoubleType"
kOfxParamDoubleTypePlain = "OfxParamDoubleTypePlain"
kOfxParamDoubleTypeScale = "OfxParamDoubleTypeScale"
kOfxParamDoubleTypeAngle = "OfxParamDoubleTypeAngle"
kOfxParamDoubleTypeTime = "OfxParamDoubleTypeTime"
kOfxParamDoubleTypeAbsoluteTime = "OfxParamDoubleTypeAbsoluteTime"
kOfxParamDoubleTypeNormalisedX = "OfxParamDoubleTypeNormalisedX"
kOfxParamDoubleTypeNormalisedY = "OfxParamDoubleTypeNormalisedY"
kOfxParamDoubleTypeNormalisedXAbsolute = "OfxParamDoubleTypeNormalisedXAbsolute"
kOfxParamDoubleTypeNormalisedYAbsolute = "OfxParamDoubleTypeNormalisedYAbsolute"
kOfxParamDoubleTypeNormalisedXY = "OfxParamDoubleTypeNormalisedXY"
kOfxParamDoubleTypeNormalisedXYAbsolute = "OfxParamDoubleTypeNormalisedXYAbsolute"
kOfxParamDoubleTypeX = "OfxParamDoubleTypeX"
kOfxParamDoubleTypeY = "OfxParamDoubleTypeY"
kOfxParamDoubleTypeXAbsolute = "OfxParamDoubleTypeXAbsolute"
kOfxParamDoubleTypeYAbsolute = "OfxParamDoubleTypeYAbsolute"
kOfxParamDoubleTypeXY = "OfxParamDoubleTypeXY"
kOfxParamDoubleTypeXYAbsolute = "OfxParamDoubleTypeXYAbsolute"
kOfxParamPropDefaultCoordinateSystem = "OfxParamPropDefaultCoordinateSystem"
kOfxParamCoordinatesCanonical = "OfxParamCoordinatesCanonical"
kOfxParamCoordinatesNormalised = "OfxParamCoordinatesNormalised"
kOfxParamPropHasHostOverlayHandle = "OfxParamPropHasHostOverlayHandle"
kOfxParamPropUseHostOverlayHandle = "kOfxParamPropUseHostOverlayHandle"
kOfxParamPropShowTimeMarker = "OfxParamPropShowTimeMarker"
kOfxPluginPropParamPageOrder = "OfxPluginPropParamPageOrder"
kOfxParamPropPageChild = "OfxParamPropPageChild"
kOfxParamPropParent = "OfxParamPropParent"
kOfxParamPropGroupOpen = "OfxParamPropGroupOpen"
kOfxParamPropEnabled = "OfxParamPropEnabled"
kOfxParamPropDataPtr = "OfxParamPropDataPtr"
kOfxParamPropChoiceOption = "OfxParamPropChoiceOption"
kOfxParamPropMin = "OfxParamPropMin"
kOfxParamPropMax = "OfxParamPropMax"
kOfxParamPropDisplayMin = "OfxParamPropDisplayMin"
kOfxParamPropDisplayMax = "OfxParamPropDisplayMax"
kOfxParamPropIncrement = "OfxParamPropIncrement"
kOfxParamPropDigits = "OfxParamPropDigits"
kOfxParamPropDimensionLabel = "OfxParamPropDimensionLabel"
kOfxParamPropIsAutoKeying = "OfxParamPropIsAutoKeying"
kOfxParamPropCustomInterpCallbackV1 = "OfxParamPropCustomCallbackV1"
kOfxParamPropStringMode = "OfxParamPropStringMode"
kOfxParamPropStringFilePathExists = "OfxParamPropStringFilePathExists"
kOfxParamStringIsSingleLine = "OfxParamStringIsSingleLine"
kOfxParamStringIsMultiLine = "OfxParamStringIsMultiLine"
kOfxParamStringIsFilePath = "OfxParamStringIsFilePath"
kOfxParamStringIsDirectoryPath = "OfxParamStringIsDirectoryPath"
kOfxParamStringIsLabel = "OfxParamStringIsLabel"
kOfxParamPropCustomValue = "OfxParamPropCustomValue"
kOfxParamPropInterpolationTime = "OfxParamPropInterpolationTime"
kOfxParamPropInterpolationAmount = "OfxParamPropInterpolationAmount"

-- TODO bind the following function
--typedef OfxStatus (OfxCustomParamInterpFuncV1)(OfxParamSetHandle instance,
--					       OfxPropertySetHandle inArgs,
--					       OfxPropertySetHandle outArgs);

data HOfxParameterSuiteV1 =
  HOfxParameterSuiteV1
    {
--  OfxStatus (*paramDefine)(OfxParamSetHandle paramSet,
--			   const char *paramType,
--			   const char *name,
--			   OfxPropertySetHandle *propertySet);
      paramDefine :: FunPtr (OfxParamSetHandle
                       -> CString
                       -> CString
                       -> OfxPropertySetHandle
                       -> IO OfxStatus)

--  OfxStatus (*paramGetHandle)(OfxParamSetHandle paramSet,
--			      const char *name,
--			      OfxParamHandle *param,
--			      OfxPropertySetHandle *propertySet);
    , paramGetHandle :: FunPtr (OfxParamSetHandle
                        -> CString
                        -> OfxParamHandle
                        -> OfxPropertySetHandle
                        -> IO OfxStatus)

--  OfxStatus (*paramSetGetPropertySet)(OfxParamSetHandle paramSet,
--				      OfxPropertySetHandle *propHandle);
    , paramSetGetPropertySet :: FunPtr (OfxParamSetHandle
                                 -> OfxPropertySetHandle
                                 -> IO OfxStatus)
--
--  OfxStatus (*paramGetPropertySet)(OfxParamHandle param,
--				   OfxPropertySetHandle *propHandle);
    , paramGetPropertySet :: FunPtr (OfxParamHandle
                                -> OfxPropertySetHandle
                                -> IO OfxStatus)

--  OfxStatus (*paramGetValue)(OfxParamHandle  paramHandle,
--			     ...);
    , paramGetValue :: FunPtr (OfxParamHandle
                        -> VarArg
                        -> IO OfxStatus)

--  OfxStatus (*paramGetValueAtTime)(OfxParamHandle  paramHandle,
--				   OfxTime time,
--				   ...);
    , paramGetValueAtTime :: FunPtr (OfxParamHandle
                                -> OfxTime,
                                -> VarArg
                                -> IO OfxStatus)

--  OfxStatus (*paramGetDerivative)(OfxParamHandle  paramHandle,
--				  OfxTime time,
--				  ...);
    , paramGetDerivative :: FunPtr (OfxParamHandle
                                -> OfxTime
                                -> VarArg
                                -> IO OfxStatus)


--  OfxStatus (*paramGetIntegral)(OfxParamHandle  paramHandle,
--				OfxTime time1, OfxTime time2,
--				...);
    , paramGetIntegral :: FunPtr (OfxParamHandle
                                -> OfxTime
                                -> OfxTime
                                -> VarArg
                                -> IO OfxStatus)

--  OfxStatus (*paramSetValue)(OfxParamHandle  paramHandle,
--			     ...);
    , paramSetValue :: FunPtr (OfxParamHandle
                        -> VarArg
                        -> IO OfxStatus)
--
--  OfxStatus (*paramSetValueAtTime)(OfxParamHandle  paramHandle,
--				   OfxTime time,  // time in frames
--				   ...);
    , paramSetValueAtTime :: FunPtr (OfxParamHandle
                                -> OfxTime
                                -> VarArg
                                -> IO OfxStatus)

--  OfxStatus (*paramGetNumKeys)(OfxParamHandle  paramHandle,
--			       unsigned int  *numberOfKeys);
    , paramGetNumKeys :: FunPtr (OfxParamHandle
                            -> Ptr CUInt
                            -> IO OfxStatus)

--  OfxStatus (*paramGetKeyTime)(OfxParamHandle  paramHandle,
--			       unsigned int nthKey,
--			       OfxTime *time);
    , paramGetKeyTime :: FunPtr (OfxParamHandle
                            -> CUInt
                            -> Ptr OfxTime
                            -> IO OfxStatus)


--  OfxStatus (*paramGetKeyIndex)(OfxParamHandle  paramHandle,
--				OfxTime time,
--				int     direction,
--				int    *index);
    , paramGetKeyIndex :: FunPtr (OfxParamHandle
                            -> OfxTime
                            -> CInt
                            -> Ptr CInt
                            -> IO OfxStatus)



--  OfxStatus (*paramDeleteKey)(OfxParamHandle  paramHandle,
--			      OfxTime time);
    , paramDeleteKey :: FunPtr (OfxParamHandle
                            -> OfxTime
                            -> IO OfxStatus)

--  OfxStatus (*paramDeleteAllKeys)(OfxParamHandle  paramHandle);
    , paramDeleteAllKeys :: FunPtr (OfxParamHandle
                                -> IO OfxStatus)


--  OfxStatus (*paramCopy)(OfxParamHandle  paramTo, OfxParamHandle  paramFrom, OfxTime dstOffset, OfxRangeD *frameRange);
    , paramCopy :: FunPtr (OfxParamHandle
                    -> OfxParamHandle
                    -> OfxParamHandle
                    -> OfxTime
                    -> Ptr OfxRangeD
                    -> IO OfxStatus)

--  OfxStatus (*paramEditBegin)(OfxParamSetHandle paramSet, const char *name);
    , paramEditBegin :: FunPtr (OfxParamSetHandle
                        -> CString
                        -> IO OfxStatus)

--  OfxStatus (*paramEditEnd)(OfxParamSetHandle paramSet);
    , paramEditEnd :: FunPtr (OfxParamSetHandle
                        -> IO OfxStatus)
 }




instance Storable HOfxParameterSuiteV1 where
    sizeOf _ = {#sizeof OfxParameterSuiteV1#}
    alignment _ = 4
    peek p =
      HOfxParameterSuiteV1
        <$> {#get OfxParameterSuiteV1->paramDefine#} p
        <*> {#get OfxParameterSuiteV1->paramGetHandle#} p
        <*> {#get OfxParameterSuiteV1->paramSetGetPropertySet#} p
        <*> {#get OfxParameterSuiteV1->paramGetPropertySet#} p
        <*> {#get OfxParameterSuiteV1->paramGetValue#} p
        <*> {#get OfxParameterSuiteV1->paramGetValueAtTime#} p
        <*> {#get OfxParameterSuiteV1->paramGetDerivative#} p
        <*> {#get OfxParameterSuiteV1->paramGetIntegral#} p
        <*> {#get OfxParameterSuiteV1->paramSetValue#} p
        <*> {#get OfxParameterSuiteV1->paramSetValueAtTime#} p
        <*> {#get OfxParameterSuiteV1->paramGetNumKeys#} p
        <*> {#get OfxParameterSuiteV1->paramGetKeyTime#} p
        <*> {#get OfxParameterSuiteV1->paramGetKeyIndex#} p
        <*> {#get OfxParameterSuiteV1->paramDeleteKey#} p
        <*> {#get OfxParameterSuiteV1->paramDeleteAllKeys#} p
        <*> {#get OfxParameterSuiteV1->paramCopy#} p
        <*> {#get OfxParameterSuiteV1->paramEditBegin#} p
        <*> {#get OfxParameterSuiteV1->paramEditEnd#} p

    poke p x = do
      {#set OfxParameterSuiteV1.paramDefine #} p (paramDefine x)
      {#set OfxParameterSuiteV1.paramGetHandle #} p (paramGetHandle x)
      {#set OfxParameterSuiteV1.paramSetGetPropertySet #} p (paramSetGetPropertySet x)
      {#set OfxParameterSuiteV1.paramGetPropertySet #} p (paramGetPropertySet x)
      {#set OfxParameterSuiteV1.paramGetValue #} p (paramGetValue x)
      {#set OfxParameterSuiteV1.paramGetValueAtTime #} p (paramGetValueAtTime x)
      {#set OfxParameterSuiteV1.paramGetDerivative #} p (paramGetDerivative x)
      {#set OfxParameterSuiteV1.paramGetIntegral #} p (paramGetIntegral x)
      {#set OfxParameterSuiteV1.paramSetValue #} p (paramSetValue x)
      {#set OfxParameterSuiteV1.paramSetValueAtTime #} p (paramSetValueAtTime x)
      {#set OfxParameterSuiteV1.paramGetNumKeys #} p (paramGetNumKeys x)
      {#set OfxParameterSuiteV1.paramGetKeyTime #} p (paramGetKeyTime x)
      {#set OfxParameterSuiteV1.paramGetKeyIndex #} p (paramGetKeyIndex x)
      {#set OfxParameterSuiteV1.paramDeleteKey #} p (paramDeleteKey x)
      {#set OfxParameterSuiteV1.paramDeleteAllKeys #} p (paramDeleteAllKeys x)
      {#set OfxParameterSuiteV1.paramCopy #} p (paramCopy x)
      {#set OfxParameterSuiteV1.paramEditBegin #} p (paramEditBegin x)
      {#set OfxParameterSuiteV1.paramEditEnd #} p (paramEditEnd x)



