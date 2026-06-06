cask "videoloop" do
  version "1.1.0"
  sha256 "37aa2f1341fab0e9c41003120caec0acbe85a177b9dfd1ae4ec10de53df40c24"

  url "https://github.com/neias/video-loop-mac/releases/download/v#{version}/VideoLoop-#{version}.zip"
  name "VideoLoop"
  desc "Bir videoyu kusursuz donguye ceviren SwiftUI uygulamasi"
  homepage "https://github.com/neias/video-loop-mac"

  depends_on formula: "ffmpeg"
  depends_on macos: ">= :ventura"

  app "VideoLoop.app"

  # Ad-hoc imzali (notarize degil): kurulumdan sonra karantinayi kaldir.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/VideoLoop.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Saved Application State/com.emreacar.videoloop.savedState",
  ]
end
