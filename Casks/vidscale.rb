cask "vidscale" do
  version "1.0.0"
  sha256 "3a5dbff926965a2f1ce0f7b3e9f0362ec3c63a6efdb2944dce8d302b036bffb3"

  url "https://github.com/neias/vidscale/releases/download/v#{version}/VidScale-#{version}.zip"
  name "VidScale"
  desc "Batch-converts videos to a standard resolution ladder (240p-1080p)"
  homepage "https://github.com/neias/vidscale"

  depends_on formula: "ffmpeg"
  depends_on macos: ">= :ventura"

  app "VidScale.app"

  # Ad-hoc signed (not notarized): drop the quarantine flag after install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/VidScale.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Saved Application State/com.emreacar.videoconvert.savedState",
  ]
end
