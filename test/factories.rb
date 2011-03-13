Factory.define(:user) do |f|
  f.sequence(:login) { |n| "login#{n}" }
  f.email { |u| "#{u.login}@example.com" }
  f.password "secret"
  f.password_confirmation { |u| u.password }
end

Factory.define(:post) do |f|
  f.user { |a| a.association(:user) }
  f.title "Post title"
  f.content "Body of post"
end

Factory.define(:comment) do |f|
  f.post { |a| a.association(:post) }
  f.name "John Doe"
  f.content "Body of comment"
end

Factory.define(:partner) do |f|
  f.kind "sponsor"
  f.name "Company"
  f.link "http://company.com"
end
