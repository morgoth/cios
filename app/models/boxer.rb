class Boxer < Person
  validates :weight, numericality: {only_integer: true, allow_blank: true}

  default_scope order("active DESC, last_name, first_name")
end
