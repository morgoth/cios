class Coach < Person
  default_scope order("created_at ASC")
end
