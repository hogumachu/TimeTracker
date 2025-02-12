@preconcurrency import ProjectDescription

public extension TargetScript {
  static let swiftLint = TargetScript.pre(
    path: Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
    name: "SwiftLint"
  )
  
  static let needleGenerate = TargetScript.pre(
    script: """
    FILE_PATH="$SRCROOT/Sources/Bootstrap"
    export PATH="$PATH:/opt/homebrew/bin"
    export SOURCEKIT_LOGGING=0 && needle generate "${FILE_PATH}/NeedleGenerated.swift" \
    "$SRCROOT/../" \
    --exclude-suffixes Tests Mocks \
    --exclude-paths /Demo /Tests /Resources
    swiftformat ${FILE_PATH}/NeedleGenerated.swift
    """,
    name: "Needle"
  )
}
