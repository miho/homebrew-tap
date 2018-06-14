class OceDepForOccCsg < Formula
  desc "Open CASCADE Community Edition: patches/improvements/experiments contributed by users over the official Open CASCADE library."
  homepage "http://groups.google.com/group/oce-dev"
  url "https://github.com/miho/oce/archive/OCE-0.18.3.tar.gz"
  sha256 "c553d6a7bf52f790abc3b6bb7a1e91a65947e92a426bb1a88a11960c31f0966c"
  depends_on "cmake" => :build
  depends_on "freetype"

  def install
    system "cmake", ".",
           "-DOCE_BUILD_SHARED_LIB=OFF",
           "-DOCE_USE_TCL_TEST_FRAMEWORK=OFF",
           "-DOCE_TESTING=OFF -DOCE_DRAW=OFF",
           "-DOCE_VISUALISATION=ON -DOCE_OCAF=ON",
           "-DOCE_DATAEXCHANGE=ON",
           "-DOCE_COPY_HEADERS_BUILD=ON",
           "-DOCE_MULTITHREAD_LIBRARY=OPENMP",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DOCE_INSTALL_PREFIX=#{prefix}",
            *std_cmake_args
    system "make", "install"
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
end
