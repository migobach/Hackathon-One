class Movie < ApplicationRecord
  has_many :comments
  has_many :users#, :through => :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
end
