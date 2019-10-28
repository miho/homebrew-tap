class OccCsg < Formula
  desc "Simple but powerful CSG tool based on the OpenCascade CAD Kernel"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.9.1.tar.gz"
  sha256 "bb3bf25ceb6b1b28c362d531b90cce8810821524cf2329852535d5ec25536b9e"
  depends_on "cmake" => :build
  depends_on "miho/homebrew-tap/occ-dep-for-occ-csg" => :build
  #depends_on "freetype"

  def install

    system "cmake", ".",
     "-DOpenCASCADE_DIR=#{HOMEBREW_PREFIX}/Cellar/occ-dep-for-occ-csg/lib/cmake/opencascade/",
     *std_cmake_args

    system "make"

    system "mkdir", "-p", "#{prefix}"
    system "mkdir", "-p", "#{bin}"

    system "cp", "-r", "bin", "#{prefix}"
    system "cp",       "README.md", "#{prefix}"
    system "cp",       "LICENSE", "#{prefix}"


  end

  test do
    system "occ-csg", "--help"
  end
  
  bottle do
    root_url "https://dl.bintray.com/miho/Homebrew-Bottles/"
    
    cellar :any_skip_relocation
    rebuild 0
    sha256 "4dbf0c5e73756411e266a018039739d80faf2f6c11d155e895a986fa4ff9f9d7" => :mojave
  end
  
  
end
