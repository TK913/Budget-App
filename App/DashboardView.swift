import SwiftUI

struct DashboardView: View {
    var totalBalance: Double = 4076.56
    var allocatedToSavings: Double = 1000
    var allocatedToSubscriptions: Double = 1000

    var body: some View {
        VStack {
            Text("Welcome back, Niyati")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Rectangle()
                .fill(Color.blue)
                .frame(height: 100)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Text("Your Balance")
                            .font(.callout)
                            .foregroundColor(.white)
                        Text("$\(totalBalance, specifier: "%.2f")") // Display balance with 2 decimal places
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 20)
            
            
            NavigationLink(destination: SavingsView()) {
                DashboardButton(label: "Savings")
            }
            
            NavigationLink(destination: SubscriptionsView()) {
                DashboardButton(label: "Subscriptions")
            }
            
            NavigationLink(destination: ExpensesView()) {
                DashboardButton(label: "Expenses")
            }
            
            
            NavigationLink(destination: TipsView()) {
                DashboardButton(label: "Tips")
            }
            
            NavigationLink(destination: MyAccountView()) {
                DashboardButton(label: "My Account")
            }
            
            Spacer()
        }
    }
}

struct DashboardButton: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
    }
}


struct ExpensesView: View {
    var body: some View {
        Text("Expenses View")
    }
}


struct MyAccountView: View {
    var body: some View {
        Text("My Account View")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
