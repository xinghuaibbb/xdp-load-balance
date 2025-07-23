#include "xdp_lb_kern.h"

// ip 都是以 172.18.0 开头的---硬编码
#define IP_ADDRESS(x) (unsigned int)(172 + (18 << 8) + (0 << 16) + (x << 24))

// 所有服务器的 IP 地址最后一位, 即 x
#define BACKEND_A 2
#define BACKEND_B 3
#define CLIENT 4
#define LB 5

SEC("xdp")   // 这是自定义的 字段, 表示 这是一个 XDP的负载均衡器 ---  0.2 libbpf后, 就不能自定义了

int xdp_load_balancer(struct xdp_md *ctx)
{
    bpf_printk("XDP Load Balancer started\n");  // 打印日志, 跟踪xdp生效了
    return XDP_PASS;  // 直接放行, 不做任何处理
}

char LICENSE[] SEC("license") = "GPL";  // 这是一个GPL协议的内核模块



