# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :ordered_desc, -> { order(created_at: :desc) }
end
