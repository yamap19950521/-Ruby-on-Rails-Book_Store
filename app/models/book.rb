class Book < ApplicationRecord
    validates :name,presence:true,uniqueness:true
    validates :date,presence:true
    validates :price,numericality:{only_integer:true,greater_than:0}
    validates :pages,numericality:{only_integer:true,greater_than:0}
    validates :ISBN,presence:true,uniqueness:true

end
