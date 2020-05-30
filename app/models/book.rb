class Book < ApplicationRecord
#user複数形？
	belongs_to :user
	# エラ〜メッセージ
	 validates :title, presence: true
	 validates :body, presence: true, length: {maximum: 200}
end
