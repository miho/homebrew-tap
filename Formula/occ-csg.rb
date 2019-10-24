class OccCsg < Formula
  desc "Simple but powerful CSG tool based on OpenCascade (OCE edition)"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.8.tar.gz"
  sha256 "d18203bb493ac9f0f3eb694eb606f327ec2d48428e9d48f4a87b8796b171cd10"
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
    sha256 "dbdbc066bbf9bc2e04ee3372cde7fab6330956906761b51759e74ad058a49ed1" => :mojave  
    
    cellar :any_skip_relocation
    rebuild 1
    sha256 "17b8f8765eaabb47af86f97d7be6be6e0fcab1041b12fcb61ec33aac39b2d44c" => :high_sierra
  end
  
  
end
