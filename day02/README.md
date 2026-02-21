# Core Metrics & Scaling in System Design

1. Vì sao cần hiểu các chỉ số hệ thống

+ Trong System Design, mọi quyết định kiến trúc đều xoay quanh câu hỏi:

Hệ thống cần nhanh đến mức nào, chịu tải bao nhiêu, và ổn định ra sao?

Muốn trả lời, phải hiểu các chỉ số cốt lõi.

2. Các chỉ số quan trọng nhất
2.1 Latency (Độ trễ)

Thời gian hệ thống phản hồi một request.

Ví dụ:

API trả kết quả trong 50ms → latency thấp (tốt)

API trả kết quả trong 2s → latency cao (xấu)

👉 Mục tiêu: giảm latency cho người dùng cuối.

2.2 Throughput (Thông lượng)

Số lượng request hệ thống xử lý trong một giây.

Ví dụ:

1.000 requests/second (RPS)

10.000 messages/second

👉 Throughput cao ≠ latency thấp.

2.3 Scalability (Khả năng mở rộng)
Vertical Scaling (Scale Up)

Tăng cấu hình server (CPU, RAM).

Ưu điểm: đơn giản.

Nhược điểm: giới hạn phần cứng, chi phí cao.

Horizontal Scaling (Scale Out)

Thêm nhiều server.

Ưu điểm: mở rộng gần như vô hạn.

Nhược điểm: kiến trúc phức tạp hơn.

👉 Hệ thống lớn luôn ưu tiên horizontal scaling.

2.4 Availability (Tính sẵn sàng)

Công thức:

Availability = uptime / (uptime + downtime)


Ví dụ:

99% → downtime ~ 3.65 ngày/năm

99.9% → ~ 8.7 giờ/năm

99.99% → ~ 52 phút/năm

👉 Mỗi số 9 thêm vào → chi phí tăng rất mạnh.

2.5 Reliability (Độ tin cậy)

Hệ thống có hoạt động đúng khi gặp lỗi hay không.

Ví dụ:

Có retry khi service lỗi

Có backup khi DB hỏng

👉 Availability = hệ thống sống
👉 Reliability = hệ thống sống đúng

3. Mối quan hệ giữa các chỉ số (Trade-offs)

Không thể tối ưu tất cả cùng lúc.

Ví dụ:

Tăng consistency → tăng latency

Tăng availability → giảm consistency (theo CAP)

Tăng throughput → có thể tăng latency

👉 System Design là nghệ thuật chọn trade-off phù hợp.

4. Ví dụ thực tế (Tư duy System Design)
Case: Chat App (giống Messenger)

Yêu cầu:

Latency thấp → gửi tin nhắn gần real-time

Availability cao → không được sập

Scalability → hàng triệu user

Quyết định:

Dùng WebSocket thay vì HTTP polling

Dùng cache (Redis) để giảm latency

Dùng message queue để tăng throughput

👉 Đây là cách tư duy mà interviewer muốn thấy.

5. Checklist tư duy khi thiết kế hệ thống

Khi gặp bài toán, luôn tự hỏi:

Hệ thống cần bao nhiêu user?

QPS (Queries per second) là bao nhiêu?

Latency chấp nhận được là bao nhiêu?

Availability cần bao nhiêu số 9?

Ưu tiên scale theo chiều nào?