# Introduction to System Design

1. System Design là gì

System Design là quá trình thiết kế kiến trúc tổng thể cho một hệ thống phần mềm nhằm đáp ứng:
+ Nhu cầu người dùng (Functional Requirements)
+ Yêu cầu vận hành lâu dài (Non-functional Requirements)

Trong phỏng vấn và thực tế, System Design không phải vẽ cho đẹp, mà là ra quyết định đúng trong điều kiện có ràng buộc.

2. Vì sao System Design quan trọng

Một hệ thống tốt không chỉ “chạy được”, mà phải:
+ Chịu tải khi người dùng tăng
+ Hoạt động ổn định khi có lỗi
+ Dễ mở rộng, dễ bảo trì theo thời gian

Nhà tuyển dụng dùng System Design để đánh giá:

+ Cách bạn suy nghĩ có hệ thống

+ Khả năng cân bằng trade-off

+ Tư duy kiến trúc chứ không phải code chi tiết

3. Hai loại yêu cầu cốt lõi
3.1 Functional Requirements (FR)

Hệ thống làm được gì

+ Ví dụ: đăng nhập, gửi tin nhắn, đăng bài, tìm kiếm

3.2 Non-Functional Requirements (NFR)

+ Hệ thống làm tốt đến mức nào

+ Scalability (mở rộng)

+ Availability (sẵn sàng)

+ Latency (độ trễ)

+ Reliability (độ tin cậy)

+ Security (bảo mật)

👉 Trong System Design Interview, NFR quan trọng hơn FR.

4. Sai lầm phổ biến của người mới

+ Lao vào vẽ chi tiết quá sớm

+ Chọn công nghệ trước khi hiểu bài toán

+ Không làm rõ giả định (assumptions)

+ Quên trade-off, nghĩ có “giải pháp hoàn hảo”

+ Cách tiếp cận truyền thống và đúng đắn luôn là:

+ Hiểu bài toán → Xác định yêu cầu1. System Design là gì

System Design là quá trình thiết kế kiến trúc tổng thể cho một hệ thống phần mềm nhằm đáp ứng:

Nhu cầu người dùng (Functional Requirements)

Yêu cầu vận hành lâu dài (Non-functional Requirements)

Trong phỏng vấn và thực tế, System Design không phải vẽ cho đẹp, mà là ra quyết định đúng trong điều kiện có ràng buộc.

2. Vì sao System Design quan trọng

Một hệ thống tốt không chỉ “chạy được”, mà phải:

Chịu tải khi người dùng tăng

Hoạt động ổn định khi có lỗi

Dễ mở rộng, dễ bảo trì theo thời gian

Nhà tuyển dụng dùng System Design để đánh giá:

Cách bạn suy nghĩ có hệ thống

Khả năng cân bằng trade-off

Tư duy kiến trúc chứ không phải code chi tiết

3. Hai loại yêu cầu cốt lõi
3.1 Functional Requirements (FR)

Hệ thống làm được gì

Ví dụ: đăng nhập, gửi tin nhắn, đăng bài, tìm kiếm

3.2 Non-Functional Requirements (NFR)

Hệ thống làm tốt đến mức nào

Scalability (mở rộng)

Availability (sẵn sàng)

Latency (độ trễ)

Reliability (độ tin cậy)

Security (bảo mật)

👉 Trong System Design Interview, NFR quan trọng hơn FR.

4. Sai lầm phổ biến của người mới

Lao vào vẽ chi tiết quá sớm

Chọn công nghệ trước khi hiểu bài toán

Không làm rõ giả định (assumptions)

Quên trade-off, nghĩ có “giải pháp hoàn hảo”

Cách tiếp cận truyền thống và đúng đắn luôn là:

Hiểu bài toán → Xác định yêu cầu → Thiết kế high-level → Sau đó mới chi tiết

5. Khung tư duy chuẩn (Framework nền tảng)

Clarify requirements

Estimate scale (users, QPS, data size)

Define high-level architecture

Deep dive vào thành phần quan trọng

Discuss trade-offs & bottlenecks

Đây là xương sống cho toàn bộ các ngày tiếp theo.

6. Mục tiêu của Day 1

Sau ngày này, bạn cần:

Hiểu rõ System Design không phải vẽ sơ đồ

Phân biệt rõ FR vs NFR

Nắm được khung tư duy chuẩn để không bị “lạc đề” → Thiết kế high-level → Sau đó mới chi tiết

5. Khung tư duy chuẩn (Framework nền tảng)

Clarify requirements

Estimate scale (users, QPS, data size)

Define high-level architecture

Deep dive vào thành phần quan trọng

Discuss trade-offs & bottlenecks

Đây là xương sống cho toàn bộ các ngày tiếp theo.

6. Mục tiêu của Day 1

Sau ngày này, bạn cần:

Hiểu rõ System Design không phải vẽ sơ đồ

Phân biệt rõ FR vs NFR

Nắm được khung tư duy chuẩn để không bị “lạc đề”