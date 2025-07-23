; ModuleID = 'xdp_lb_kern.c'
source_filename = "xdp_lb_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@__const.xdp_load_balancer.____fmt = private unnamed_addr constant [27 x i8] c"XDP Load Balancer started\0A\00", align 1
@LICENSE = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @LICENSE, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_load_balancer to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_load_balancer(%struct.xdp_md* nocapture readnone %0) #0 section "xdp" {
  %2 = alloca [27 x i8], align 1
  %3 = getelementptr inbounds [27 x i8], [27 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %3) #3
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(27) %3, i8* noundef nonnull align 1 dereferenceable(27) getelementptr inbounds ([27 x i8], [27 x i8]* @__const.xdp_load_balancer.____fmt, i64 0, i64 0), i64 27, i1 false)
  %4 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef nonnull %3, i32 noundef 27) #3
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %3) #3
  ret i32 2
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
