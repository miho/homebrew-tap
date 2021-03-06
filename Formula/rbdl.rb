class Rbdl < Formula
  desc "RBDL: an efficient rigid-body dynamics library using recursive algorithms"
  homepage "https://bitbucket.org/rbdl/rbdl/src/default/"
  url "https://bitbucket.org/rbdl/rbdl/get/v2.6.0.tar.gz"
  sha256 "a73bfe37b7a86d954fdb57cc88cdc8e08d35a6799745dad395da491daaad504f"
  depends_on "cmake" => :build
  depends_on "eigen"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "false" # how to test this library? sample code...
  end
end
