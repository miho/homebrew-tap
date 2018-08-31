class OccCsg < Formula
  desc "Simple but powerful CSG tool based on OpenCascade (OCE edition)"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.2.tar.gz"
  sha256 "84ffde6420326613c45d6740a7e7de7b0e80a9e2f3acce23e167b96dc30eacef"
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

    rebuild 1
    sha256 "f0b8e62c8ca29544ec862499cfe229cc595d8f80af5d6ef988ca4802e01e6a87" => :high_sierra
    
    rebuild 2
    sha256 "c473414e309fe692be625e9c1c72e80e72ffb7df58dd739bff1c83f3e1cb0ece" => :sierra
  end
  
  
end
