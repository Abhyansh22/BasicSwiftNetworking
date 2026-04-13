//
//  PhotoInfoView.swift
//  BasicSwiftNetworking
//
//  Created by GU on 10/04/26.
//

import SwiftUI

struct PhotoInfoView: View {
    @Environment(PhotoIbfoViewModel.self) var viewModel
    var body: some View {
        ScrollView{
            VStack{
                if viewModel.isLoading{ ProgressView()}
                else{
                    if let photoInfo = viewModel.photoInfo{
                        AsyncImage(url: URL(string: photoInfo.url)){phase
                            in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable().scaledToFit().frame(height: 300)
                            case .failure(let error):
                                ContentUnavailableView("Error: \(error.localizedDescription)", systemImage: "photo.badge.exclamationmark")
                            @unknown default:
                                ContentUnavailableView("Error", systemImage: "photo.badge.exclamationmark")
                            }
                        }
                        Text(photoInfo.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text(photoInfo.description)
                    }else if let errorMessage = viewModel.errorMessage {
                        ContentUnavailableView(errorMessage, systemImage: "photo.badge.exclamationmark")
                    }
                }
            }
            .padding()
            .refreshable {
                Task{
                    viewModel.photoInfo = try await viewModel.fetchPhotoInfo()
                }
            }
        }
    }
}

#Preview {
    PhotoInfoView()
        .environment(PhotoIbfoViewModel.previewModel)
}
