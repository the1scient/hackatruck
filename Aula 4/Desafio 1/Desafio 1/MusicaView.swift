import SwiftUI

struct MusicaView: View {
    var name: String
    var artist: String
    var capa: String
    @State var tocando = false
    @State var shuffleAtivo = false
    @State var repeatAtivo = false
    
    var body: some View {
        ZStack {
            Rectangle().fill(
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea(.all)
            
            VStack {
                if let url = URL(string: capa), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                } else {
                    // Handle image loading error
                    Text("Image not available")
                        .foregroundColor(.white)
                }
                
                Text(name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(artist)
                    .foregroundColor(.white)
                    .font(.title3)
                
                HStack {
                    Image(systemName: shuffleAtivo ? "shuffle" : "shuffle.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(shuffleAtivo ? .green : .white)
                        .onTapGesture {
                            shuffleAtivo.toggle()
                        }
                    
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        // Play or pause logic
                        tocando.toggle()
                    }) {
                        Image(systemName: tocando ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                    }
                    
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                    
                    Image(systemName: repeatAtivo ? "repeat" : "repeat.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(repeatAtivo ? .green : .white)
                        .onTapGesture {
                            repeatAtivo.toggle()
                        }
                }
            }
        }
    }
}

struct MusicaView_Previews: PreviewProvider {
    static var previews: some View {
        MusicaView(name: "Test", artist: "Test2", capa: "https://i.scdn.co/image/ab67616d00001e02d5905ba1475fa3e7f068147b")
    }
}

