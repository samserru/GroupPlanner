//
//  SettingsView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/6/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @State var showSheet: Bool = false

    var body: some View {
        VStack{
            Image(uiImage: userInfo.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())

            Spacer()
            Button{
                showSheet.toggle()
            }
        label: {
            Text("Change Image")
        }.padding()


            Button{
                try! Auth.auth().signOut()
                userInfo.loggedIn = false
                viewState = .authentication
            }
        label: {
            Text("Sign out")
        }.sheet(isPresented: $showSheet){
            guard let uid = Auth.auth().currentUser?.uid else {return}

            guard let imageData = userInfo.image.jpegData(compressionQuality: 0.25) else {return}

            let storage = Storage.storage().reference().child("users/\(uid)")

            storage.putData(imageData) { meta, error in
                storage.downloadURL(completion: { url, error in
                    if let url = url{
                        self.userInfo.imageURL = url.absoluteString

                        let database = Database.database().reference().child("users/\(uid)")
                    }
                })
            }
        } content: {
            ImagePicker(selectedImage: $userInfo.image)
        }
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.settings))
            .environmentObject(UserInfo())
    }
}
