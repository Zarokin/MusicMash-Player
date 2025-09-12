import Foundation

struct Track { var title: String; var artist: String }
class Player {
    var playlist: [Track] = []
    var currentIndex: Int = 0
    func addTrack(_ track: Track) { playlist.append(track) }
    func play() {
        if playlist.isEmpty { print("Playlist empty."); return }
        let t = playlist[currentIndex]
        print("Playing: \(t.title) by \(t.artist)")
    }
    func next() {
        if currentIndex + 1 < playlist.count { currentIndex += 1; play() }
        else { print("Reached end."); }
    }
    func previous() {
        if currentIndex > 0 { currentIndex -= 1; play() }
        else { print("At start."); }
    }
    func showPlaylist() {
        print("Playlist:")
        for (idx, t) in playlist.enumerated() {
            let marker = idx == currentIndex ? "->" : "  "
            print("\(marker) \(t.title) by \(t.artist)")
        }
    }
    func removeTrack(title: String) {
        playlist.removeAll { $0.title == title }
    }
}

let p = Player()
p.addTrack(Track(title: "Song A", artist: "Artist 1"))
p.addTrack(Track(title: "Song B", artist: "Artist 2"))
p.addTrack(Track(title: "Song C", artist: "Artist 3"))
p.play()
p.next()
p.previous()
p.showPlaylist()
p.removeTrack(title: "Song B")
p.showPlaylist()