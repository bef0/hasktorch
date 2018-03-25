{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
module Torch.Types.THC.Byte where

import Foreign.C.Types
import Foreign (ForeignPtr)
import GHC.TypeLits (Nat)
import GHC.Word
import Torch.Types.TH (C'THLongStorage, C'THLongTensor)
import Torch.Types.THC

type CState = C'THCState
type CDescBuff = C'THCDescBuff
type CAllocator = C'THCState
type CTensor = CTHCudaByteTensor
type CStorage = CTHCByteStorage
type CIndexTensor = C'THCudaLongTensor
type CIndexStorage = C'THCLongStorage
type CReal = CUChar
type CAccReal = CLong
type HsReal = Word8
type HsAccReal = Word64

type CMaskTensor = C'THCudaByteTensor
type CInt' = CLLong

-- type CByteTensor = C'THCudaByteTensor
-- type CCharTensor = C'THCudaCharTensor
-- type CShortTensor = C'THCudaShortTensor
-- type CIntTensor = C'THCudaIntTensor
-- type CLongTensor = C'THCudaLongTensor
-- type CFloatTensor = C'THCudaFloatTensor
-- type CDoubleTensor = C'THCudaDoubleTensor
-- type CHalfTensor = C'THCudaHalfTensor

hs2cReal :: HsReal -> CReal
hs2cReal = fromIntegral

hs2cAccReal :: HsAccReal -> CAccReal
hs2cAccReal = fromIntegral

c2hsReal :: CReal -> HsReal
c2hsReal = fromIntegral

c2hsAccReal :: CAccReal -> HsAccReal
c2hsAccReal = fromIntegral

newtype Storage = Storage { storage :: ForeignPtr CStorage }
  deriving (Eq, Show)

asStorage = Storage

newtype DynTensor = DynTensor { tensor :: ForeignPtr CTensor }
  deriving (Show, Eq)

asDyn = DynTensor

newtype Tensor (ds :: [Nat]) = Tensor { dynamic :: DynTensor }
  deriving (Show, Eq)

asStatic = Tensor
