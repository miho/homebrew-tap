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
     "-DCMAKE_PREFIX_PATH=#{HOMEBREW_PREFIX}/Cellar/oce/0.18.3/OCE.framework/Versions/0.18/Resources/",
     *std_cmake_args

    system "make"

    system "mkdir", "-p", "#{prefix}"
    system "mkdir", "-p", "#{bin}"

    system "cp", "-r", "bin", "#{prefix}"
    system "cp",       "README.md", "#{prefix}"
    system "cp",       "LICENSE", "#{prefix}"


  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test OCC-CSG`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
