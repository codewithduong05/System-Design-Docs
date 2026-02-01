1. Tư duy nền tảng

Một hệ thống lớn không phải một server duy nhất.
Nó được tạo thành từ nhiều thành phần, mỗi thành phần giải quyết một vấn đề cụ thể.

System Design = ghép đúng các khối (building blocks) vào đúng vị trí.

2. Kiến trúc tổng quát (High-level Architecture)

Mô hình phổ biến:

Client → Load Balancer → Web/App Servers → Database
                          ↘ Cache / MQ / CDN


Ý nghĩa:

Client: trình duyệt, mobile app

Load Balancer: phân phối request

App Server: xử lý logic

Database: lưu dữ liệu

Cache / MQ / CDN: tối ưu hiệu năng & độ ổn định

3. Load Balancer (LB)
Vai trò

Phân phối traffic đến nhiều server

Tránh quá tải một node

Tăng availability

Các thuật toán phổ biến

Round Robin

Least Connections

IP Hash

L4 vs L7

L4: TCP/UDP (nhanh, ít logic)

L7: HTTP/HTTPS (linh hoạt, thông minh)

👉 Không có LB → không thể scale horizontally.

4. Application Server
Vai trò

Xử lý business logic

Nhận request từ LB

Gọi DB, cache, MQ

Nguyên tắc thiết kế

Stateless (không lưu state trong memory)

Có thể scale ngang dễ dàng

👉 Nếu server stateful → scale rất khó.

5. Database (DB)
Vai trò

Lưu dữ liệu lâu dài

Đảm bảo consistency

Phân loại

SQL: MySQL, PostgreSQL

NoSQL: MongoDB, Redis, Cassandra

Mô hình phổ biến

Primary-Replica (Master-Slave)

Read/Write separation

👉 DB là bottleneck lớn nhất của hệ thống.

6. Cache
Mục đích

Giảm latency

Giảm load DB

Vị trí cache

Client-side cache

CDN cache

Server-side cache (Redis/Memcached)

DB cache

Pattern phổ biến

Cache Aside (Lazy loading)

Write Through

Write Back

👉 Cache tốt = hệ thống nhanh gấp nhiều lần.

7. CDN (Content Delivery Network)
Vai trò

Phân phối nội dung tĩnh (image, video, JS, CSS)

Giảm latency theo vị trí địa lý

Ví dụ:

Cloudflare, Akamai, AWS CloudFront

👉 Không dùng CDN = server chính bị quá tải.

8. Message Queue (MQ)
Vai trò

Xử lý bất đồng bộ

Giảm coupling giữa services

Ví dụ:

RabbitMQ, Kafka, SQS

Use case:

gửi email

xử lý log

event-driven architecture

👉 MQ giúp hệ thống chịu tải lớn mà không bị sập.

9. Ví dụ thực tế (Chat System)

Nếu thiết kế Chat App:

LB: phân phối request chat

App Server: xử lý gửi/nhận tin nhắn

Redis: cache user online

MQ: xử lý message queue

DB: lưu lịch sử chat

CDN: load avatar, file

👉 Mỗi thành phần có vai trò rõ ràng.