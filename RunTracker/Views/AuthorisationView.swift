import SwiftUI

enum AutorisaionType {
    case login, register, none
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct AuthorisationView: View {
    
    @StateObject private var vm = AuthorisationViewVM()
    
    @State var authorisation: AutorisaionType = .none
    
    
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
                    
                    
                    //switch opisujacy, czy uzytkownik wybral jakikolwiek przycisk logowania
                    switch authorisation {
                    case .login:
                        VStack(alignment: .center, spacing: 8){
                            TextField("Username", text: $vm.userLogin)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appWhite)
                                .cornerRadius(10)
                            SecureField("Password", text: $vm.password)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appWhite)
                                .cornerRadius(10)
                            HStack{
                                Rectangle()
                                    .frame(width: 100, height: 2)
                                    .foregroundStyle(AppMaterials.colors.appWhite)
                                Text("or")
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Rectangle()
                                    .frame(width: 100, height: 2)
                                    .foregroundStyle(AppMaterials.colors.appWhite)
                            }
                            HStack{
                                Button(action: {
                                    print("google sign in button pressed")
                                }, label: {
                                    Text("Google")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(AppMaterials.colors.appBrown)
                                        .cornerRadius(10)
                                })
                                Button(action: {
                                    print("apple sign in button pressed")
                                }, label: {
                                    Text("Apple")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(AppMaterials.colors.appBrown)
                                        .cornerRadius(10)
                                })
                            }
                            Spacer()
                                .frame(height: 15)
                        }
                        .padding(.horizontal, 30)
                            


                    case .register:
                        VStack(alignment: .center, spacing: 8){
                            TextField("Username", text: $vm.userLogin)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appWhite)
                                .cornerRadius(10)
                            SecureField("Password", text: $vm.password)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppMaterials.colors.appWhite)
                                .cornerRadius(10)
                            HStack{
                                Rectangle()
                                    .frame(width: 100, height: 2)
                                    .foregroundStyle(AppMaterials.colors.appWhite)
                                Text("or")
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                Rectangle()
                                    .frame(width: 100, height: 2)
                                    .foregroundStyle(AppMaterials.colors.appWhite)
                            }
                            Button(action: {
                                print("google sign in button pressed")
                            }, label: {
                                Text("Google")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(AppMaterials.colors.appBrown)
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                print("apple sign in button pressed")
                            }, label: {
                                Text("Apple")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(AppMaterials.colors.appBrown)
                                    .cornerRadius(10)
                            })
                            Spacer()
                                .frame(height: 15)
                        }
                        .padding(.horizontal, 30)
                            

                    case .none:
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
                                Button {
                                    withAnimation(.ripple(index: 2)) {
                                        authorisation = .register
                                    }
                                    
                                } label: {
                                    Text("Run")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18))
                                }

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
                            Button(action: {
                                withAnimation(.ripple(index: 2)) {
                                    authorisation = .login
                                }
                            }, label: {
                                Text("Login")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(AppMaterials.colors.appBrown)
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                withAnimation(.ripple(index: 2)) {
                                    authorisation = .register
                                }
                            }, label: {
                                Text("Register")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(AppMaterials.colors.appOrange)
                                    .cornerRadius(10)
                            })

                            Spacer()
                                .frame(height: 15)
                        }
                        .padding(.horizontal, 30)

                    }
                    
                    
                    
                    
                }
                .frame(height: 300)
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
