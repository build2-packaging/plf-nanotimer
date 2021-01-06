intf_libs = # Interface dependencies.
impl_libs = # Implementation dependencies.
#import impl_libs += libhello%lib{hello}

./: lib{plf-nanotimer} doc{README.md} manifest

lib{plf-nanotimer}: {hxx ixx txx}{**} $impl_libs $intf_libs

# Build options.
#
cxx.poptions =+ "-I$out_root" "-I$src_root"

# Export options.
#
lib{plf-nanotimer}:
{
  cxx.export.poptions = "-I$out_root" "-I$src_root"
  cxx.export.libs = $intf_libs
}

# Install recreating subdirectories.
#
{hxx ixx txx}{*}:
{
  install         = include/
  install.subdirs = true
}
