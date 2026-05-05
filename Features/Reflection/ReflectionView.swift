import SwiftUI

struct ReflectionView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Setelah sesi?")
            Button("Lebih Tenang") { appModel.openSummary() }
            Button("Masih Tegang") { appModel.openSummary() }
            Button("Lewati") { appModel.openSummary() }
        }
        .padding()
    }
}
