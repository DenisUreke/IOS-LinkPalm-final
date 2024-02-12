//
//  Dumper.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-11.
//

/*.conditionalTapGesture(apply: item.isWebLink , action: {
    GlobalSettings.shared.startSafari.toggle()
})
.fullScreenCover(isPresented: GlobalSettings.$shared.startSafari, content: {
    SFSafariViewWrapper(url: URL(string: "\(item.webAddress)")!)
})*/

/*struct DrawMenuChoicesFromEnum<Option: RawRepresentable & Hashable, Content: View>: View where Option.RawValue == String {
 
 let title: String
 let options: [Option]
 @Binding var selectedOption: Option
 let label: (Option) -> Content
    

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26, weight: .bold))
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }) {
                        VStack {
                            Image(systemName: option.rawValue)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        .frame(width: 50, height: 50)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                        .stroke(selectedOption == option ? Color.blue : Color.black, lineWidth: selectedOption == option ? 5 : 1)
                                )
                        )
                    }
                }
            }
        }
    }
}*/
