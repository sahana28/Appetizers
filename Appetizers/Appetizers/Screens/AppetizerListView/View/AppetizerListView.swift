//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizersViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(self.viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                       // .listRowSeparator(.hidden)
                       // .listRowSeparatorTint(Color.brandColor)
                        .onTapGesture {
                            self.viewModel.isShowingDetailView = true
                            self.viewModel.selectedAppetizer = appetizer
                        }
                    
                }
                .navigationTitle("🍕 Appetizers")
                .listStyle(.plain)
                .disabled(self.viewModel.isShowingDetailView)
            }
            
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: self.viewModel.isShowingDetailView ? 20 : 0)
            
            if self.viewModel.isShowingDetailView {
                AppetizerDetailView(isShowingDetailView: $viewModel.isShowingDetailView,
                                    appetizer: self.viewModel.selectedAppetizer!)
            }
            
            if(viewModel.isLoading) {
                LoadingView()
            }
        }
        
        .alert(isPresented: $viewModel.shouldShowErrorAlert, error:viewModel.alertError) { error in
            Button("OK") {}
        } message: { error in
            if let failureReason = error.errorDescription{
                Text(failureReason)
            }
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
