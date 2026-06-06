cask "videoloop" do
  version "1.0.0"
  sha256 "90742a6725c81fa9f5f274a16589a0c063a1da6549c09c193378feffd1b36e48"

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
