class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.8",
      revision: "eba459f5536408329e0b5eeadd253c84dcee99b7"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.8"
    sha256 cellar: :any_skip_relocation, monterey:     "40ec5b3beeb04d1007c7b9bc651055a6bf995b6bbfcf24564885e1ddd33e1ccf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1407b58c5c0affa76319a089edca98eb2a4958e8f2f90b66cd6608bbc68ae979"
  end

  depends_on "go@1.18" => :build
  depends_on "buildpacks/tap/pack" => :optional
  depends_on "docker" => :optional
  depends_on "helm" => :optional
  depends_on "kubernetes-cli" => :optional
  depends_on "operator-sdk" => :optional

  def install
    system "make", "build"
    bin.install "bin/move2kube"
  end

  test do
    # test the version
    want = "v" + version
    assert_equal want, shell_output("#{bin}/move2kube version").strip
  end
end
