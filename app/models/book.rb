class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent:  :destroy #bookが削除されるといいねも削除
	has_many :book_comments, dependent:  :destroy #bookが削除されるとコメントも削除
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence:true
	validates :body, presence:true, length:{maximum:200}
end
