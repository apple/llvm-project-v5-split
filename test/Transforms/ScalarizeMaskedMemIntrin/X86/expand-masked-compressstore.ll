; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S %s -scalarize-masked-mem-intrin -mtriple=x86_64-linux-gnu | FileCheck %s

define void @scalarize_v2i64(i64* %p, <2 x i1> %mask, <2 x i64> %data) {
; CHECK-LABEL: @scalarize_v2i64(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <2 x i1> [[MASK:%.*]], i64 0
; CHECK-NEXT:    br i1 [[TMP1]], label [[COND_STORE:%.*]], label [[ELSE:%.*]]
; CHECK:       cond.store:
; CHECK-NEXT:    [[TMP2:%.*]] = extractelement <2 x i64> [[DATA:%.*]], i64 0
; CHECK-NEXT:    store i64 [[TMP2]], i64* [[P:%.*]], align 1
; CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds i64, i64* [[P]], i32 1
; CHECK-NEXT:    br label [[ELSE]]
; CHECK:       else:
; CHECK-NEXT:    [[PTR_PHI_ELSE:%.*]] = phi i64* [ [[TMP3]], [[COND_STORE]] ], [ [[P]], [[TMP0:%.*]] ]
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <2 x i1> [[MASK]], i64 1
; CHECK-NEXT:    br i1 [[TMP4]], label [[COND_STORE1:%.*]], label [[ELSE2:%.*]]
; CHECK:       cond.store1:
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <2 x i64> [[DATA]], i64 1
; CHECK-NEXT:    store i64 [[TMP5]], i64* [[PTR_PHI_ELSE]], align 1
; CHECK-NEXT:    br label [[ELSE2]]
; CHECK:       else2:
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.compressstore.v2i64.p0v2i64(<2 x i64> %data, i64* %p, <2 x i1> %mask)
  ret void
}

define void @scalarize_v2i64_ones_mask(i64* %p, <2 x i64> %data) {
; CHECK-LABEL: @scalarize_v2i64_ones_mask(
; CHECK-NEXT:    br i1 true, label [[COND_STORE:%.*]], label [[ELSE:%.*]]
; CHECK:       cond.store:
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <2 x i64> [[DATA:%.*]], i64 0
; CHECK-NEXT:    store i64 [[TMP1]], i64* [[P:%.*]], align 1
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i64, i64* [[P]], i32 1
; CHECK-NEXT:    br label [[ELSE]]
; CHECK:       else:
; CHECK-NEXT:    [[PTR_PHI_ELSE:%.*]] = phi i64* [ [[TMP2]], [[COND_STORE]] ], [ [[P]], [[TMP0:%.*]] ]
; CHECK-NEXT:    br i1 true, label [[COND_STORE1:%.*]], label [[ELSE2:%.*]]
; CHECK:       cond.store1:
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x i64> [[DATA]], i64 1
; CHECK-NEXT:    store i64 [[TMP3]], i64* [[PTR_PHI_ELSE]], align 1
; CHECK-NEXT:    br label [[ELSE2]]
; CHECK:       else2:
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.compressstore.v2i64.p0v2i64(<2 x i64> %data, i64* %p, <2 x i1> <i1 true, i1 true>)
  ret void
}

define void @scalarize_v2i64_zero_mask(i64* %p, <2 x i64> %data) {
; CHECK-LABEL: @scalarize_v2i64_zero_mask(
; CHECK-NEXT:    br i1 false, label [[COND_STORE:%.*]], label [[ELSE:%.*]]
; CHECK:       cond.store:
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <2 x i64> [[DATA:%.*]], i64 0
; CHECK-NEXT:    store i64 [[TMP1]], i64* [[P:%.*]], align 1
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i64, i64* [[P]], i32 1
; CHECK-NEXT:    br label [[ELSE]]
; CHECK:       else:
; CHECK-NEXT:    [[PTR_PHI_ELSE:%.*]] = phi i64* [ [[TMP2]], [[COND_STORE]] ], [ [[P]], [[TMP0:%.*]] ]
; CHECK-NEXT:    br i1 false, label [[COND_STORE1:%.*]], label [[ELSE2:%.*]]
; CHECK:       cond.store1:
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x i64> [[DATA]], i64 1
; CHECK-NEXT:    store i64 [[TMP3]], i64* [[PTR_PHI_ELSE]], align 1
; CHECK-NEXT:    br label [[ELSE2]]
; CHECK:       else2:
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.compressstore.v2i64.p0v2i64(<2 x i64> %data, i64* %p, <2 x i1> <i1 false, i1 false>)
  ret void
}

define void @scalarize_v2i64_const_mask(i64* %p, <2 x i64> %data) {
; CHECK-LABEL: @scalarize_v2i64_const_mask(
; CHECK-NEXT:    br i1 false, label [[COND_STORE:%.*]], label [[ELSE:%.*]]
; CHECK:       cond.store:
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <2 x i64> [[DATA:%.*]], i64 0
; CHECK-NEXT:    store i64 [[TMP1]], i64* [[P:%.*]], align 1
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i64, i64* [[P]], i32 1
; CHECK-NEXT:    br label [[ELSE]]
; CHECK:       else:
; CHECK-NEXT:    [[PTR_PHI_ELSE:%.*]] = phi i64* [ [[TMP2]], [[COND_STORE]] ], [ [[P]], [[TMP0:%.*]] ]
; CHECK-NEXT:    br i1 true, label [[COND_STORE1:%.*]], label [[ELSE2:%.*]]
; CHECK:       cond.store1:
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x i64> [[DATA]], i64 1
; CHECK-NEXT:    store i64 [[TMP3]], i64* [[PTR_PHI_ELSE]], align 1
; CHECK-NEXT:    br label [[ELSE2]]
; CHECK:       else2:
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.compressstore.v2i64.p0v2i64(<2 x i64> %data, i64* %p, <2 x i1> <i1 false, i1 true>)
  ret void
}

declare void @llvm.masked.compressstore.v2i64.p0v2i64(<2 x i64>, i64*, <2 x i1>)