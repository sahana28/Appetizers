//
//  HomeView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextfield: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextfield, equals: .firstName)
                        .onSubmit { focusedTextfield = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextfield, equals: .lastName)
                        .onSubmit { focusedTextfield = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextfield, equals: .email)
                        .onSubmit { focusedTextfield = nil }
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()

                    DatePicker("Birth Date", selection: $viewModel.user.birthDate, in: Date().hundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .tint(.brandColor)
                    }

                    
                } header: {
                    Text("PERSONAL INFO")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.isOn)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                        
                } header: {
                    
                    Text("REQUESTS")
                }
                .tint(.brandColor)


            }
            
           .navigationTitle("👤 Account")
           .toolbar {
               ToolbarItem(placement: .keyboard) {
                   Button("Dismiss") {
                      focusedTextfield = nil
                   }

               }
           }
        }
        .onAppear {
            viewModel.retrieveChanges()
        }
        .alert(isPresented: $viewModel.showError, error: viewModel.error) { LocalizedError in
            Button("OK") {}
        } message: { error in
            if let err = error.errorDescription {
                Text(err)
             }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
