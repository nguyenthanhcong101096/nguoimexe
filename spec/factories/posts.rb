# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                  :integer          not null, primary key
#  title               :string
#  describe            :string
#  user_id             :bigint(8)        not null
#  vehicle_kind_id     :bigint(8)        not null
#  status              :string           default("spending"), not null
#  featured_image_data :text
#  product_date        :string           default("Unknown")
#  brand               :string           default("Unknown"), not null
#  registration        :float            default(0.0), not null
#  price               :float            default(0.0), not null
#  slug_title          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#


describe = "
Chia sẻ với báo giới, HLV Park Hang-seo xác nhận: “Chúng tôi vốn dự định xem Đình Trọng là một trong những phương án thay thế cho Xuân Hưng. Chúng ta cần các cầu thủ có sự ăn ý trong thi đấu và phối hợp. Quyết định có thay thế và gọi lại Đình Trọng hay không sẽ dựa vào kết quả báo cáo cụ thể từ các bác sĩ”.

Lý do ông Park xem xét chuyện gọi lại Đình Trọng liên quan tới chấn thương của Lục Xuân Hưng và các hậu vệ khác. Nếu không gọi lại Trọng, ông Park sẽ buộc phải có một phương án mới cho vị trí trung vệ. Làm thế có thể dẫn tới sự sụp đổ của hệ thống ba trung vệ - vốn là nền tảng cho thành công của tuyển Việt Nam tại AFF Cup 2018.

Bản thân Đình Trọng bị rạn một mảnh xương rất nhỏ ở mu bàn chân. Chấn thương này được phát hiện trước AFF Cup 2018 nhưng không quá nghiêm trọng, nên ông Park quyết định giữ Đình Trọng ở lại đội tuyển. Thực tế cho thấy Đình Trọng đã chơi tốt, đá đủ cả 8 trận và là cái tên quan trọng trên hành trình đăng quang của đội bóng.
"

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.paragraph }
    describe { describe }
  end
end
