class Coach < Person
  default_scope order("last_name, first_name")
end
