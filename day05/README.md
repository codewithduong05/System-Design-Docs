# Database Design, Sharding & Indexing

1. Mục tiêu Day 05

Hiểu cách chọn loại cơ sở dữ liệu, thiết kế schema hợp lý, dùng index đúng cách và biết khi nào cần sharding để hệ thống chịu tải lớn.

Database thường là điểm nghẽn (bottleneck) lớn nhất của hệ thống.

2. Chọn loại Database (SQL vs NoSQL)
2.1 SQL (Relational Database)

Ví dụ: MySQL, PostgreSQL

Ưu điểm:

ACID

Strong consistency

Query phức tạp (JOIN, transaction)

Phù hợp:

Banking

E-commerce

Hệ thống cần tính toàn vẹn dữ liệu cao

Nhược điểm:

Scale ngang khó

JOIN nhiều → chậm khi dữ liệu lớn

2.2 NoSQL

Ví dụ: MongoDB, Cassandra, Redis

Ưu điểm:

Dễ scale horizontally

Linh hoạt schema

Tối ưu cho big data

Phù hợp:

Social network

Logging system

Analytics

Nhược điểm:

Consistency yếu hơn (tùy hệ)

Không mạnh về transaction phức tạp

3. ACID vs BASE
ACID (SQL)

Atomicity

Consistency

Isolation

Durability

BASE (NoSQL)

Basically Available

Soft state

Eventually consistent

👉 Lựa chọn phụ thuộc vào yêu cầu consistency của hệ thống (liên kết với Day 04).

4. Indexing — Tăng tốc truy vấn
Index là gì?

Cấu trúc dữ liệu phụ (thường là B-Tree) giúp tìm kiếm nhanh hơn.

Ví dụ:

SELECT * FROM users WHERE email = 'abc@gmail.com';

Nếu không có index → full table scan
Nếu có index → tìm theo cây → nhanh hơn rất nhiều

Khi nào nên tạo index?

Cột dùng trong WHERE

Cột JOIN

Cột ORDER BY

Cột có độ phân tán cao (high cardinality)

Sai lầm phổ biến

Tạo quá nhiều index → chậm write

Index trên cột ít giá trị (boolean) → không hiệu quả

👉 Index là trade-off giữa read performance và write performance.

5. Sharding (Phân mảnh dữ liệu)

Khi nào cần?

Dữ liệu quá lớn cho một server

Write QPS quá cao

Storage vượt giới hạn máy

Các chiến lược sharding
5.1 Range-based

Chia theo khoảng (user_id 1–1M, 1M–2M)

Nhược điểm: dễ hotspot

5.2 Hash-based

hash(user_id) % N

Phân phối đều hơn

5.3 Geo-based

Chia theo vùng địa lý

Vấn đề của Sharding

Cross-shard query rất khó

Rebalancing phức tạp

Transaction multi-shard tốn chi phí

👉 Sharding chỉ làm khi thật sự cần.

6. Replication vs Sharding (So sánh nhanh)
Replication	Sharding
Tăng read performance	Tăng write & storage
Tăng availability	Tăng scalability
Không chia dữ liệu	Chia dữ liệu

Hệ thống lớn thường dùng cả hai.

7. Ví dụ thực tế — Thiết kế DB cho Social Network

Yêu cầu:

50M users

500M posts

Feed load rất thường xuyên

Giải pháp:

User table: sharding theo user_id

Post table: sharding theo user_id hoặc post_id

Redis cache feed

Replication để scale read

👉 Không dùng JOIN phức tạp → denormalization khi cần.
