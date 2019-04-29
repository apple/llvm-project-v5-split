; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-linux        | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-linux-gnux32 | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-nacl         | FileCheck %s

define zeroext i16 @t1(i32 %on_off) nounwind {
; CHECK-LABEL: t1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $edi killed $edi def $rdi
; CHECK-NEXT:    leal -2(%rdi,%rdi), %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %t0 = sub i32 %on_off, 1
  %t1 = mul i32 %t0, 2
  %t2 = trunc i32 %t1 to i16
  %t3 = zext i16 %t2 to i32
  %t4 = trunc i32 %t3 to i16
  ret i16 %t4
}

define i32 @t2(i32 %on_off) nounwind {
; CHECK-LABEL: t2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $edi killed $edi def $rdi
; CHECK-NEXT:    leal -2(%rdi,%rdi), %eax
; CHECK-NEXT:    movzwl %ax, %eax
; CHECK-NEXT:    retq
  %t0 = sub i32 %on_off, 1
  %t1 = mul i32 %t0, 2
  %t2 = and i32 %t1, 65535
  ret i32 %t2
}