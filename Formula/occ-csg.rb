class OccCsg < Formula
  desc "Simple but powerful CSG tool based on OpenCascade (OCE edition)"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.3.tar.gz"
  sha256 "582528b363eef08f765520293713606a7173a70764e16f999b237b32fc971531"
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
    
    sha256 "b31d80801117e8d11fbb30594d8bc74ac52e04998a8659e77d6630d17fedfd22" => :high_sierra
    
    rebuild 1
    sha256 "fed3f775db8bb3a7393fd71bc88edb04f16f9a2857ecb83968d0fd36126d2630" => :sierra
    
  end
  
  
end
