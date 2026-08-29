# System Design Case Study: URL Shortener

Hôm nay bắt đầu bước vào thiết kế hệ thống thực tế.
URL Shortener là bài kinh điển vì đơn giản nhưng bao trùm nhiều khái niệm đã học từ Day 01–07.

1. Yêu cầu bài toán
Functional Requirements

Người dùng nhập URL dài → nhận URL ngắn

Truy cập URL ngắn → redirect về URL gốc

(Optional) Thống kê số lần click

Non-Functional Requirements

Latency rất thấp (< 100ms)

Availability cao (redirect phải luôn hoạt động)

Scale đến hàng trăm triệu URL

Hệ thống đơn giản, dễ mở rộng

2. Ước lượng quy mô (Estimation)

Giả sử:

100M URL được tạo mỗi năm

1B redirect mỗi năm

Trung bình 3.000 redirect/giây (peak có thể 10x)

Data size:

100M URLs × ~500 bytes ≈ 50GB/năm

👉 Đây là hệ thống read-heavy.

3. High-Level Architecture
Client
   ↓
Load Balancer
   ↓
App Servers
   ↓
Database
   ↓
Cache (Redis)

Flow:

User tạo short link → ghi DB

User truy cập short link → check cache → nếu miss → query DB → cache lại

4. Thiết kế Short URL
Cách tạo key
Option 1: Auto Increment ID + Base62 encode

Ví dụ:

ID: 125
Base62: cb

Ưu điểm:

Đơn giản

Không trùng

Nhược điểm:

Dễ đoán

Có thể lộ số lượng URL

Option 2: Hash (MD5/SHA) + truncate

Ưu điểm:

Khó đoán

Không phụ thuộc DB ID

Nhược điểm:

Có khả năng collision (cần xử lý)

👉 Thực tế thường dùng Base62 với distributed ID generator (Snowflake).

5. Database Design

Schema đơn giản:

short_urls
-----------
id
short_code (unique index)
original_url
created_at
expires_at

Index quan trọng:

UNIQUE(short_code)

6. Tối ưu hiệu năng
6.1 Cache (Redis)

Lưu short_code → original_url

TTL nếu link có hạn

6.2 CDN

Giảm latency redirect

6.3 Replication

Read replica để scale read