#

name "rake"

dependency "ruby"

build do
  "#{install_dir}/bin/gem install #{name} -n #{install_dir}/bin --no-rdoc --no-ri"
end
