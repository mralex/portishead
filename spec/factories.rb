Factory.define :category do |f|
  f.name 'Category'
end

Factory.define :image do |f|
  f.title 'Awesome Image'
  f.image 'image.jpg'
  f.hero false
  f.hidden false
  f.project { |p| p.association(:project) }
end

Factory.define :project do |f|
  f.name 'Awesome Project'
  f.worked_on '2011-01-14'
  f.description 'This is an awesome project'
  f.association :category
end

Factory.define :page do |f|
  f.title 'Page Title'
  f.slug 'page-title'
  f.content 'This is a page'
end
