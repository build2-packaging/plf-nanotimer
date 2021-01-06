intf_libs = # Interface dependencies.
impl_libs = # Implementation dependencies.

upstream = $src_root/upstream

./: doc{README.md} manifest

./: lib{nanotimer} exe{tests}

lib{nanotimer}: $upstream/{hxx}{**} $impl_libs $intf_libs

# Build options.
#
cxx.poptions =+ "-I$out_root/upstream" "-I$src_root/upstream"

# Export options.
#
lib{nanotimer}:
{
  cxx.export.poptions = "-I$out_root/upstream" "-I$src_root/upstream"
  cxx.export.libs = $intf_libs
}

# Install recreating subdirectories.
#
{hxx ixx txx}{*}:
{
  install         = include/
  install.subdirs = true
}


### Tests/Benchmark

exe{tests} : tests/cxx{**} lib{nanotimer}
exe{tests} : test = true


