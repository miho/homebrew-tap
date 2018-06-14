class OccCsg < Formula
  desc "Simple but powerful CSG tool based on OpenCascade (OCE edition)"
  homepage "https://github.com/miho/OCC-CSG"
  url "https://github.com/miho/OCC-CSG/archive/v0.9.1.tar.gz"
  sha256 "b4b7100f529ac33967a2b2c0f4a128c49319467edcd3e061ebcebcd8d438a245"
  depends_on "cmake" => :build
  depends_on "miho/homebrew-tap/oce-dep-for-occ-csg" => :build
  depends_on "freetype"

  def install

    system "cmake", ".",
     "-DCMAKE_PREFIX_PATH=#{HOMEBREW_PREFIX}/Cellar/oce-dep-for-occ-csg/0.18.3/OCE.framework/Versions/0.18/Resources/",
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
    sha256 "7b5189236948c4e6ec13e577ed60c054533c0921d75d624ebfbc5e9ba7d83c35" => :high_sierra
  end
  
  
end
