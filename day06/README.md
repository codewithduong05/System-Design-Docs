Day 06 — High Availability, Fault Tolerance & Observability
1. Mục tiêu Day 06

Hiểu cách thiết kế hệ thống không sập khi có lỗi, giảm thời gian gián đoạn và phát hiện sự cố sớm bằng monitoring/observability.

Hệ thống lớn không phải là hệ thống không bao giờ lỗi — mà là hệ thống chịu lỗi tốt.

2. High Availability (HA) vs Fault Tolerance (FT)
High Availability (HA)

Giảm downtime xuống mức tối thiểu.

Dùng nhiều instance, load balancer, replication.

Ví dụ:

2–3 app servers sau Load Balancer

Database có replica

Mục tiêu: 99.9% – 99.99% uptime.

Fault Tolerance (FT)

Hệ thống vẫn hoạt động ngay cả khi một thành phần chết.

Không gián đoạn dịch vụ.

Ví dụ:

RAID disk

Multi-region deployment

Consensus system (Raft/Paxos)

FT cao → chi phí rất cao.

3. Các kỹ thuật đảm bảo tính sẵn sàng
3.1 Redundancy (Dự phòng)

Nhiều instance cùng chức năng.

Không có single point of failure.

3.2 Failover

Khi primary chết → replica tự động thay thế.

Các kiểu:

Active–Passive

Active–Active

3.3 Health Check

LB kiểm tra server còn sống không.

Nếu fail → loại khỏi pool.

3.4 Graceful Degradation

Khi quá tải:

Tắt tính năng phụ

Giữ tính năng cốt lõi

Ví dụ:

Shopee có thể tắt recommendation nhưng vẫn cho checkout.

4. Circuit Breaker Pattern

Khi một service downstream lỗi:

Ngắt request tạm thời

Tránh cascade failure

Trạng thái:

Closed

Open

Half-open

👉 Bảo vệ toàn hệ thống khỏi “domino crash”.

5. Monitoring vs Observability
Monitoring

Thu thập metrics

Trigger alert

Ví dụ:

CPU > 80%

Error rate > 5%

Observability

Hiểu sâu hệ thống qua:

Logs

Metrics

Traces

Ba trụ cột quan trọng:

Logs (ELK)

Metrics (Prometheus)

Tracing (Jaeger, Zipkin)

6. Các chỉ số quan trọng trong vận hành

Error Rate

Latency (P50, P95, P99)

QPS

CPU / Memory usage

Replication lag

7. Ví dụ thực tế — E-commerce System

Khi flash sale:

Tăng autoscaling app servers

Cache hot products

Circuit breaker cho payment

Rate limiting

Monitoring real-time dashboard

👉 Mục tiêu: hệ thống chậm vẫn chấp nhận được, nhưng không được sập.

8. Multi-Region Deployment

Cách triển khai:

Active–Active nhiều region

DNS routing theo geo

Database replication cross-region

Trade-off:

Latency giảm

Consistency phức tạp hơn

9. Checklist khi thiết kế HA

Có single point of failure không?

Có backup DB không?

Có health check không?

Có circuit breaker không?

Có alert khi error spike không?

Có kế hoạch disaster recovery không?