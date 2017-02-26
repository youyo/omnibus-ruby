#

name "ruby"
maintainer "youyo"
homepage "https://github.com/youyo/omnibus-ruby"

install_dir "/opt/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

dependency "preparation"
dependency "ruby"
dependency "rake"
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
