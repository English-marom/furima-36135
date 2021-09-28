class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :region
  belongs_to :scheduledday
  belongs_to :shippingcharg
  belongs_to :state


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,           numericality: { other_than: 1 } 
  validates :state_id,              numericality: { other_than: 1 }
  validates :shipping_charge_id ,   numericality: { other_than: 1 }
  validates :region_id,             numericality: { other_than: 0 }
  validates :scheduled_day_id ,     numericality: { other_than: 1 }

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}


end


