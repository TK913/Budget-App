import SwiftUI



struct ContentView: View {
    @State private var firstName = "Niyati"
    @State private var lastName = "Sanghrajka"
    @State private var username = "niyatisan"
    @State private var password = "password1"
    @State private var newPassword = ""
    @State private var newPasswordConfirm = ""
    @State private var alert = false

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Username", text: $username)
            }

            Section(header: Text("Password")) {
                SecureField("Current Password", text: $password)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmNewPassword)
            }

            Section {
                Button(action: {
                    // Handle the button action
                    if newPassword == confirmNewPassword {
                        password = newPassword
                        print("Changes saved successfully!")
                    } else {
                        showingAlert = true
                    }
                }) {
                    Text("Save Changes")
                }
            }
        }
        .navigationTitle("Account Info")
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text("New password and Confirm Password do not match."), dismissButton: .default(Text("OK")))
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AccountInfoView()
        }
    }
}
