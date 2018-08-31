class OccDepForOccCsg < Formula
  desc "Open CASCADE library"
  homepage "https://www.opencascade.com/content/overview"
  url "https://github.com/miho/occ-for-occ-csg/archive/v7.3.0.2.tar.gz"
  sha256 "264350eec0cfd3c8490168b84ee7750ccdbc2c36601e0ffff86f0743b7d3bb29"
  depends_on "cmake" => :build

  keg_only :provided_by_macos

  def install
    mkdir "build-freetype" do 
      system "mkdir", "-p", "#{prefix}/dependencies/freetype"
      system "cmake", "../dependencies/freetype",
            "-DWITH_ZLIB=OFF",
            "-DWITH_HarfBuzz=OFF",
            "-DWITH_PNG=OFF",
            "-DWITH_BZip2=OFF",
            "-DBUILD_SHARED_LIBS=OFF",
            "-DCMAKE_INSTALL_PREFIX=#{prefix}/dependencies/freetype"
            #*std_cmake_args
      system "make", "install"
    end # "build-freetype"       
    
    mkdir "build-opencascade" do 
      system "cmake", "../opencascade",
            "-DBUILD_LIBRARY_TYPE:String=Static",
            "-DCMAKE_BUILD_TYPE=Release",
            "-DBUILD_MODULE_Draw:BOOL=false",
            "-D3RDPARTY_DIR=#{prefix}/dependencies/",
            "-DCMAKE_INSTALL_PREFIX=#{prefix}",
            "-DINSTALL_FREETYPE:BOOL=true",
            *std_cmake_args
      system "make", "-j"      
      system "make", "install"
      system "cp", "#{prefix}/lib/libfreetype.a.6",
             "#{prefix}/lib/libfreetype.a"
    end # "build-opencascade"       
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test oce`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
  
  bottle do
    root_url "https://dl.bintray.com/miho/Homebrew-Bottles/"
    #sha256 "e9c679292b803b2a664c0775e980f7fd17314854abf8607bbbb895fd98e16170" => :sierra
    rebuild 1
    sha256 "71f86c377e7716fc0cf2612b95a6cc5efa0d546a0d8ca6f5b7f3f2d3a1770b51" => :high_sierra
  end
  
end
