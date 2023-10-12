// The Swift Programming Language
// https://docs.swift.org/swift-book
import WinSDK

struct Win32Error: Error {}

public struct Paths {
  public static func getKnownFolderPath(_ folderID: KNOWNFOLDERID) throws -> String {
    var mutableID = folderID
    var path: PWSTR?

    let result = WinSDK.SHGetKnownFolderPath(&mutableID, 0, nil, &path)
    defer { WinSDK.CoTaskMemFree(path) }
    guard let path, result == S_OK else {
      throw Win32Error()
    }
    return String(decodingCString: path, as: UTF16.self)
  }
}
