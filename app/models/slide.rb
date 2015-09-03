class Slide < ActiveRecord::Base
  belongs_to :slideable, polymorphic: true
end
