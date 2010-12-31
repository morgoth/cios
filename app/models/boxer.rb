class Boxer < Person
  validates_numericality_of :weight, :only_integer => true, :allow_blank => true

  default_scope order("active DESC, last_name, first_name")
end
