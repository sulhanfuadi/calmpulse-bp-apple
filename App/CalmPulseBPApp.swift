import SwiftUI

@main
struct CalmPulseBPApp: App {
    @StateObject private var appModel = AppStateModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appModel)
        }
    }
}
