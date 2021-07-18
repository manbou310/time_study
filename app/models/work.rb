class Work < ApplicationRecord

  belongs_to :user
  belongs_to :channel
  has_many :add_forms, dependent: :destroy
  accepts_nested_attributes_for :add_forms, allow_destroy: true

  with_options presence: true do
    validates :date
    validates :process_name
  end

end
