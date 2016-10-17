%w(helpers).each do |type|
  Dir["#{File.dirname(__FILE__)}/#{type}/**/*.rb"].each do |f|
    load File.expand_path(f)
  end
end
