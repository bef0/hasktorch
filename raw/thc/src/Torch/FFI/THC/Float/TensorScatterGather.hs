{-# LANGUAGE ForeignFunctionInterface #-}
module Torch.FFI.TH.Float.TensorScatterGather
  ( c_gather
  , c_scatter
  , c_scatterAdd
  , c_scatterFill
  , p_gather
  , p_scatter
  , p_scatterAdd
  , p_scatterFill
  ) where

import Foreign
import Foreign.C.Types
import Torch.Types.TH
import Data.Word
import Data.Int

-- | c_gather :  state tensor src dim index -> void
foreign import ccall "THCTensorScatterGather.h THFloatTensor_gather"
  c_gather :: Ptr (CTHState) -> Ptr (CTHFloatTensor) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> IO (())

-- | c_scatter :  state tensor dim index src -> void
foreign import ccall "THCTensorScatterGather.h THFloatTensor_scatter"
  c_scatter :: Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> Ptr (CTHFloatTensor) -> IO (())

-- | c_scatterAdd :  state tensor dim index src -> void
foreign import ccall "THCTensorScatterGather.h THFloatTensor_scatterAdd"
  c_scatterAdd :: Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> Ptr (CTHFloatTensor) -> IO (())

-- | c_scatterFill :  state tensor dim index value -> void
foreign import ccall "THCTensorScatterGather.h THFloatTensor_scatterFill"
  c_scatterFill :: Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> CFloat -> IO (())

-- | p_gather : Pointer to function : state tensor src dim index -> void
foreign import ccall "THCTensorScatterGather.h &THFloatTensor_gather"
  p_gather :: FunPtr (Ptr (CTHState) -> Ptr (CTHFloatTensor) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> IO (()))

-- | p_scatter : Pointer to function : state tensor dim index src -> void
foreign import ccall "THCTensorScatterGather.h &THFloatTensor_scatter"
  p_scatter :: FunPtr (Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> Ptr (CTHFloatTensor) -> IO (()))

-- | p_scatterAdd : Pointer to function : state tensor dim index src -> void
foreign import ccall "THCTensorScatterGather.h &THFloatTensor_scatterAdd"
  p_scatterAdd :: FunPtr (Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> Ptr (CTHFloatTensor) -> IO (()))

-- | p_scatterFill : Pointer to function : state tensor dim index value -> void
foreign import ccall "THCTensorScatterGather.h &THFloatTensor_scatterFill"
  p_scatterFill :: FunPtr (Ptr (CTHState) -> Ptr (CTHFloatTensor) -> CInt -> Ptr (CTHLongTensor) -> CFloat -> IO (()))