# Consistency, Replication, Quorum và CAP Trade-offs


1. Các kiểu consistency (tóm tắt)
+ Strong consistency / Linearizability
Mọi read trả về giá trị của write gần nhất theo thứ tự toàn cục — giống như hệ thống hoạt động theo một bản sao thứ tự duy nhất. Dễ nghĩ và đúng cho banking, nhưng thường làm tăng latency.
+ Sequential consistency
Thứ tự các operation là nhất quán với thứ tự tại mỗi client, nhưng không cần global real-time order.
+ Causal consistency
Nếu A gây ra B (causal), mọi node nhìn thấy A trước B; các event không gây quan hệ thì có thể thấy khác nhau.
+ Eventual consistency
Nếu không có update mới, tất cả replica cuối cùng converge về cùng một giá trị. Độ trễ giữa việc ghi và nhìn thấy cập nhật ở các replica khác là chấp nhận được. Thích hợp cho social feed, cacheable content.
+ Read-your-writes, Monotonic reads (subliness)
Các guarantees nhỏ hơn, thường dùng phối hợp để cải thiện UX.
2. Kiểu replication & trade-offs

- Primary-Replica (Master-Slave)

    Master chịu writes, replicate sang replicas.

    Ưu: đơn giản, dễ đảm bảo sequential/strong cho writes.

    Nhược: master là single point of write; failover phức tạp.  
- Multi-Master (Multi-Primary)

    Nhiều node chấp nhận writes.

    Ưu: write-local, giảm latency cho đa vùng.

    Nhược: xung đột (conflicts) phải giải quyết (last-write-wins, CRDT, application logic).
- Synchronous vs Asynchronous replication

    Synchronous: write được commit khi tất cả (hoặc quorum) replica confirm → consistency tốt, latency cao.

    Asynchronous: master returns success ngay, replica update sau → latency thấp, có window mất mát khi crash.
3. Quorum (W, R, N) — công thức và ví dụ
N = số replica (total)

W = số replica cần confirm khi write

R = số replica đọc từ đó để trả result

Bảo đảm strong consistency khi:

W + R > N

Ví dụ minh hoạ:

N = 3

Chọn W = 2, R = 2 → W + R = 4 > 3 ⇒ đảm bảo rằng mỗi read sẽ chạm ít nhất một node chứa ghi mới.

Nếu muốn ưu tiên availability/throughput: W = 1, R = 1 (fast) → không đảm bảo consistency.

Gợi ý:

Low-latency reads: chọn R nhỏ, tăng W (viết chậm hơn).

Low-latency writes: chọn W nhỏ, tăng R (reads phải kiểm tra nhiều replica).