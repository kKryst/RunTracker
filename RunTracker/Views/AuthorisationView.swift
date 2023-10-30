import SwiftUI

struct AuthorisationView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                Spacer()

                Text("RunTracker")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                            
                Spacer()

                VStack(spacing: 20) {
                    HStack {
                        VStack {
                            Text("Prepare")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Text("Warm-up")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)

                        Divider()
                            .background(Color.gray)

                        VStack {
                            Text("Run")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            Text("Give it all")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)

                        Divider()
                            .background(Color.gray)

                        VStack {
                            Text("Rest")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Text("Repeat tomorrow")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 100)
                    VStack(alignment: .center, spacing: 8){
                        NavigationLink(destination: {
                            HomeView()
                                .navigationBarBackButtonHidden()
                        }, label: {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appBrown)
                                .cornerRadius(10)
                        })
                        NavigationLink(destination: {
                            HomeView()
                                .navigationBarBackButtonHidden()
                        }, label: {
                            Text("Register")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appOrange)
                                .cornerRadius(10)
                        })
                        NavigationLink(destination: {
                            HomeView()
                                .navigationBarBackButtonHidden()
                        }, label: {
                            Text("Continue without registration")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(BlurView(style: .dark))
                                .cornerRadius(10)
                        })
                        Spacer()
                            .frame(height: 15)
                    }

                    
                    .padding(.horizontal, 30)
                }
                .padding(.vertical, 20)
                .background(BlurView(style: .dark).opacity(0.8))
                
            }
            .ignoresSafeArea(edges: .bottom)
            .background(
                Image("loginBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct RunningWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            AuthorisationView()
        }
    }
}
