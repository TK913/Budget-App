import SwiftUI
import SwiftData



struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var approxAnnualIncome = 0
    @State private var username = ""
    @State private var password = ""
    @State private var newPassword = ""
    @State private var newPasswordConfirm = ""

    func newPasswordConfirmation(newPassword: String, newPasswordConfirm: String, oldPassword: String) -> Bool{
        //function should also check if oldPassword matches the password in the database
        return newPassword == newPasswordConfirm
    }

    func updateBasics(){
    //updates first name, last name, and income in database
    }

    func updateLoginInfo(){
    //updates username and password in database
        if(newPasswordConfirmation(newPassword, newPasswordConfirm, password)){

        }
        else{

        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("Account Information")
                        .font(.largeTitle)
                        .padding()
                    Text("Basic Information")
                        .font(.title)
                        .padding()
                    Text("First Name:")
                        .font(.body)
                        .padding()
                    TextField("First Name", text: $firstName)
                    Text("Last Name:")
                        .font(.body)
                        .padding()
                    TextField("Last Name", text: $lastName)
                    Text("Annual Income (approx)")
                        .font(.body)
                        .padding()
                    TextField("Income", text: $approxAnnualIncome)
                    Button("Update"){
                        updateBasics()
                    }
                    Text("Change Username/Password")
                        .font(.title)
                        .padding()
                    Text("Username")
                        .font(.body)
                        .padding()
                    TextField("Username", text: $username)
                    Text("New Password")
                        .font(.body)
                        .padding()
                    TextField("New Password", text: $newPassword)
                    Text("Confirm New Password")
                        .font(.body)
                        .padding()
                    TextField("Confirm Password", text: $newPasswordConfirm)
                    Text("Old Password")
                        .font(.body)
                        .padding()
                    TextField("Old Password", text: $password)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
