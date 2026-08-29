Day 07 — Security & API Design
1. Mục tiêu Day 07

Thiết kế hệ thống an toàn, rõ ràng, dễ mở rộng.
Bảo mật không phải tính năng phụ — đó là nền móng của hệ thống bền vững.

Một hệ thống scale tốt nhưng không an toàn thì vô nghĩa.

2. Authentication vs Authorization
2.1 Authentication (AuthN)

Xác thực người dùng là ai.

Ví dụ:

Username + Password

JWT

OAuth 2.0

Session Cookie

2.2 Authorization (AuthZ)

Người dùng được phép làm gì.

Ví dụ:

User thường không được xóa bài của người khác

Admin có quyền quản lý hệ thống

👉 AuthN xác định danh tính
👉 AuthZ xác định quyền hạn

3. HTTPS & TLS
Vì sao bắt buộc dùng HTTPS?

Mã hóa dữ liệu

Chống MITM attack

Bảo vệ cookie và token

Quy tắc:

Không bao giờ truyền password qua HTTP

Luôn bật HSTS

Redirect HTTP → HTTPS

4. Token-based Authentication
JWT (JSON Web Token)

Cấu trúc:

Header.Payload.Signature

Ưu điểm:

Stateless

Dễ scale horizontally

Nhược điểm:

Khó revoke token

Token dài

Best practice:

Access token ngắn hạn

Refresh token dài hạn

Lưu HttpOnly cookie nếu dùng web

5. API Design Best Practices
5.1 RESTful conventions

Ví dụ:

GET    /users
GET    /users/:id
POST   /users
PUT    /users/:id
DELETE /users/:id

Nguyên tắc:

Dùng HTTP method đúng nghĩa

Không đặt verb trong URL (ví dụ: /getUsers là sai)

5.2 Idempotency

GET, PUT, DELETE → idempotent

POST → không idempotent

Trong hệ thống payment:

Dùng idempotency key để tránh double charge

5.3 Versioning

Ví dụ:

/api/v1/users
/api/v2/users

Không thay đổi API cũ nếu đã public.

6. Rate Limiting

Mục đích:

Chống spam

Chống brute force

Bảo vệ hệ thống khỏi overload

Cách thực hiện:

Token bucket

Leaky bucket

Fixed window

7. Bảo mật phổ biến cần tránh

SQL Injection

XSS

CSRF

Broken Authentication

Exposed Secrets

Checklist:

Validate input

Escape output

Hash password (bcrypt/argon2)

Không hard-code secret

Dùng environment variables

8. Ví dụ thực tế — Thiết kế API cho E-commerce

Yêu cầu:

Đăng nhập

Thanh toán

Quản lý đơn hàng

Thiết kế:

JWT cho Auth

HTTPS bắt buộc

Rate limit login

Idempotency key cho payment

Role-based access control (RBAC)

9. Checklist khi thiết kế Security

Có HTTPS chưa?

Có phân quyền rõ ràng chưa?

Có rate limit không?

Token expire bao lâu?

Có logging bảo mật không?