class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.3",
      revision: "8899f92ecc4ac40a7176385ce1ca9e9812caf95e"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "c0ea12d6c11a589397790f40a99e2eb36fa5825a34a46305224346886d28f314"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "10edd1ace4a465cebedecf30df182cb6baacf20358add35f72ffff7493797dbc"
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
