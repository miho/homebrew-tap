class OccCsg < Formula
  desc "Simple but powerful CSG tool based on OpenCascade (OCE edition)"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.7.tar.gz"
  sha256 "52cc7369dc91da8a5d84576144f21e41795c1f29b7fefc909f84e989f7c036aa"
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
  end
  
  
end
