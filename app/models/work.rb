class Work < ApplicationRecord

  belongs_to :user
  belongs_to :channel
  has_many :time_studies, dependent: :destroy
  accepts_nested_attributes_for :time_studies, allow_destroy: true

  with_options presence: true do
    validates :date
    validates :process_name
  end

end
