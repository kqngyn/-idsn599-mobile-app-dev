//
//  ContentView.swift
//  KN Exercise 5 - Sound, Feedback and Polish
//
//  Created by Khoi Nguyen on 9/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //splashScreen().ignoresSafeArea()
        homePage()
    }
}
struct walkThru: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color(hex: "#B64812").ignoresSafeArea()
            TabView{
                //page 1
                OBPage1().ignoresSafeArea()
                
                //page 2
                OBPage2().ignoresSafeArea()
                
                //page 3
                OBPage3()
            }.tabViewStyle(.page).ignoresSafeArea()
         }
        .toolbarBackground(.hidden, for: .navigationBar) //hides nav bar
        .navigationBarBackButtonHidden(true) //hides back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .bold))
                        Text("Back")
                            .font(.custom("HelveticaNeue-Roman", size: 22)).bold()
                    }
                    .foregroundColor(Color(hex: "#E5D1AF"))
                    .padding(.horizontal, 12).padding(.vertical, 8)
                }
            }
        } //ToolBar End
    }
}

struct splashScreen: View {
    var body: some View {
        //Splash Page
        NavigationStack {
          ZStack {
            Color(hex: "#E5D1AF").ignoresSafeArea()

            // background arch + cat
            Circle()
              .fill(Color(hex: "#CE793A"))
              .frame(width: 551.38, height: 525.96)
              .offset(x: 27, y: 400)
              .allowsHitTesting(false)

            Image("Cat listening to music")
              .resizable()
              .frame(width: 475, height: 545)
              .offset(x:-20, y: 240)
              .allowsHitTesting(false)
          }
            
          // titles
          .overlay(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: -25) {
            //name
                HStack {
                    Text("mello.")
                      .font(.custom("Transcity", size: 128))
                      .foregroundColor(Color(hex: "#B64812"))
                      .overlay(alignment: .topTrailing) {
                              Image("Sparkling")
                                  .resizable()
                                  .frame(width: 74, height: 74)
                                  .offset(x: 45, y: -15)
                    }
                }
              
            //tagline
              Text("a playlist for every mood.")
                .font(.custom("HelveticaNeue-Roman", size: 20))
                .kerning(-1)
                .foregroundColor(Color(hex: "#B64812"))
            }
            .padding(.leading, 80) //right
            .padding(.top, 250) //down
            .allowsHitTesting(false)
          }
            
          // button
          .safeAreaInset(edge: .bottom) {
            NavigationLink(destination: walkThru()) {
              Text("Get Started")
                .font(.custom("HelveticaNeue-Medium", size: 24))
                //.kerning(-1)
                .foregroundColor(Color(hex: "#E5D1A4"))
                .padding()
                .frame(width: 300, height: 50)
                .background(Color(hex: "#B64B12"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }.padding(.bottom, 3)
          }
        } //Splash Screen Page NavStack end
    }
}
struct OBPage1: View {
    var body: some View {
        ZStack {
            //background
            Color(hex: "#B64B12").ignoresSafeArea()
            Rectangle()
              .fill(Color(hex: "#E5D1AF"))
              .frame(width: 450, height: 573)
              .clipShape(RoundedCorner(radius: 204.5, corners: [.topLeft, .topRight]))
              .frame(maxHeight: .infinity, alignment: .bottom)
            
            //content
            VStack(spacing: 3) {
                Image("Cool cat making finger guns")
                    .resizable()
                    .frame(width: 334, height: 318.6)
                
                VStack(spacing: -14) {
                    Text("meet mello.")
                      .font(Font.custom("Transcity", size: 96))
                      .foregroundColor(Color(hex: "#B64812"))
                    
                    Text("Mello is your on-the-go feline DJ \nthat curates custom playlists just for you.")
                        .font(Font.custom("HelveticaNeue-Roman", size: 20))
                      .foregroundColor(Color(hex: "#CE793A"))
                }.padding(.horizontal, 15)
            }.multilineTextAlignment(.center).frame(maxWidth: .infinity)
        }.ignoresSafeArea()
    }
}

struct OBPage2: View {
    var body: some View {
        ZStack {
            //background
            Color(hex: "#B64B12").ignoresSafeArea()
            Rectangle()
              .fill(Color(hex: "#E5D1AF"))
              .frame(width: 450, height: 700)
              .clipShape(RoundedCorner(radius: 204.5, corners: [.topLeft, .topRight]))
              .frame(maxHeight: .infinity, alignment: .bottom)
            
            Image("heart eyes cat")
                .resizable()
                .scaledToFit()
                .frame(width: 382, height: 380)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .offset(x: -36, y: 60)
                .zIndex(0)
            //content
            VStack(spacing: 35) {
                VStack(spacing: -14) {
                    Text("mood dial.")
                      .font(Font.custom("Transcity", size: 96))
                      .foregroundColor(Color(hex: "#B64812"))
                    
                    Text("Whether your cozy or going on a night out, Mello will blend genres & tempos to fit the moment.")
                        .font(Font.custom("HelveticaNeue-Roman", size: 20))
                      .foregroundColor(Color(hex: "#CE793A"))
                }.padding(.horizontal, 17)
                Image("graphic-OB2")
                    .resizable()
                    .frame(width:245, height: 100)
            }.multilineTextAlignment(.center).frame(maxWidth: .infinity)
            /*
            Image("heart eyes cat")
                .resizable()
                .frame(width: 334, height: 318.6)
             */
        }.ignoresSafeArea()
    }
}

struct OBPage3: View {
    var body: some View {
        NavigationStack {
            ZStack {
                //background
                Color(hex: "#B64B12").ignoresSafeArea()
                Rectangle()
                  .fill(Color(hex: "#E5D1AF"))
                  .frame(width: 450, height: 573)
                  .clipShape(RoundedCorner(radius: 204.5, corners: [.topLeft, .topRight]))
                  .frame(maxHeight: .infinity, alignment: .bottom)
                
                //content
                VStack(spacing: 3) {
                    Image("party cat")
                        .resizable()
                        .frame(width: 334, height: 318.6)
                    
                    VStack(spacing: -14) {
                        Text("start vibin.")
                          .font(Font.custom("Transcity", size: 96))
                          .foregroundColor(Color(hex: "#B64812"))
                        
                        Text("Login or create an account and press play on your perfect vibe.")
                            .font(Font.custom("HelveticaNeue-Roman", size: 20))
                          .foregroundColor(Color(hex: "#CE793A"))
                    }.padding(.horizontal, 15)
                }.multilineTextAlignment(.center).frame(maxWidth: .infinity)
                
                Spacer()
                
                // button
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: -105) {
                        NavigationLink(destination: loginPage()) {
                          Text("Log in")
                            .font(.custom("HelveticaNeue-Medium", size: 24))
                            //.kerning(-1)
                            .foregroundColor(Color(hex: "#E5D1A4"))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(hex: "#B64B12"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }.padding(.bottom, 115)
                        
                        NavigationLink(destination: signupPage()) {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.custom("HelveticaNeue-Medium", size: 24))
                                    .foregroundColor(Color(hex: "CE793A"))
                                Text("Sign Up.")
                                    .font(.custom("HelveticaNeue-Medium", size: 24)).bold()
                                    .foregroundColor(Color(hex: "CE793A"))
                            }
                        }.padding(.bottom, 95)
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

//page to login
struct loginPage: View {
    @State private var name = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#E5D1AF").ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        Text("Login")
                            .font(.custom("Transcity", size: 50))
                            .foregroundColor(Color(hex: "#B64812"))
                            .padding(.top, 8)

                        LabeledField("Username") {
                            TextField("e.g. @johnsmith", text: $name)
                                .textContentType(.name)
                                .autocorrectionDisabled()
                        }

                        LabeledField("Password") {
                            SecureField("••••••••", text: $password)
                                .textContentType(.newPassword)
                        }

                        NavigationLink(destination: homePage()) {
                          Text("Log in")
                            .font(.custom("HelveticaNeue-Medium", size: 24))
                            //.kerning(-1)
                            .foregroundColor(Color(hex: "#E5D1A4"))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(hex: "#B64B12"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }.padding(.horizontal, 24)
                            .padding(.bottom, 24)
                    }.padding(.horizontal, 50)
                }
                
                Image("heart eyes cat")
                    .resizable()
                    .frame(width: 382, height: 380)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: 350)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar) //hides nav bar
            .navigationBarBackButtonHidden(true) //hides back button
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .bold))
                            Text("Back")
                                .font(.custom("HelveticaNeue-Roman", size: 22)).bold()
                        }
                        .foregroundColor(Color(hex: "#B64B12"))
                        .padding(.horizontal, 12).padding(.vertical, 8)
                    }
                }
            } //ToolBar End
        }
    }
}

//page to home
struct homePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("coming soon.")
                  .font(Font.custom("Transcity", size: 96))
                
                NavigationLink(destination: splashScreen()) {
                  Text("Back to home")
                    .font(.custom("HelveticaNeue-Medium", size: 24))
                    //.kerning(-1)
                    .foregroundColor(Color(hex: "#E5D1A4"))
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color(hex: "#B64B12"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar) //hides nav bar
        .navigationBarBackButtonHidden(true) //hides back button
    }
}

//page to sign up
struct signupPage: View {
    @State private var name = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#E5D1AF").ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {

                        Text("Create Account")
                            .font(.custom("Transcity", size: 50))
                            .foregroundColor(Color(hex: "#B64812"))
                            .padding(.top, 8)

                        LabeledField("Name") {
                            TextField("e.g. John Smith", text: $name)
                                .textContentType(.name)
                                .autocorrectionDisabled()
                        }
                        
                        LabeledField("Username") {
                            TextField("e.g. @johnsmith", text: $username)
                                .textContentType(.username)
                                .autocorrectionDisabled()
                        }

                        LabeledField("Email") {
                            TextField("you@example.com", text: $email)
                                .keyboardType(.emailAddress)
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                        }

                        LabeledField("Create password") {
                            SecureField("••••••••", text: $password)
                                .textContentType(.newPassword)
                        }

                        NavigationLink(destination: setupPage1()) {
                          Text("Create Account")
                            .font(.custom("HelveticaNeue-Medium", size: 24))
                            //.kerning(-1)
                            .foregroundColor(Color(hex: "#E5D1A4"))
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(hex: "#B64B12"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }.padding(.horizontal, 24)
                            .padding(.bottom, 24)
                    }.padding(.horizontal, 50)
                }
                
                Image("heart eyes cat")
                    .resizable()
                    .frame(width: 382, height: 380)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: 350)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar) //hides nav bar
            .navigationBarBackButtonHidden(true) //hides back button
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .bold))
                            Text("Back")
                                .font(.custom("HelveticaNeue-Roman", size: 22)).bold()
                        }
                        .foregroundColor(Color(hex: "#B64B12"))
                        .padding(.horizontal, 12).padding(.vertical, 8)
                    }
                }
            } //ToolBar End
        }
    }
}

struct setupPage1: View {
    @Environment(\.dismiss) private var dismiss

    // Selection state
    @State private var selectedGenres: Set<String> = []

    // Your genres
    private let allGenres = [
        "Pop","Hyperpop","Indie Pop","Hip-Hop","Trap","Drill","RNB",
        "Lo-fi","Techno","Dub-Step","Classic Rock","Soul","Latin Pop",
        "Country","K-Pop","Afrobeats","Chill","Classical","Punk","Chillhop",
        "House","Disco","Jazz","Ambient","Funk","Reggae","Amapiano"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                // background
                Color(hex: "#B64B12").ignoresSafeArea()
                Rectangle()
                    .fill(Color(hex: "#E5D1AF"))
                    .frame(width: 450, height: 700)
                    .clipShape(RoundedCorner(radius: 204.5, corners: [.topLeft, .topRight]))
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea()

                Image("point cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 334, height: 330)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: -210)

                // content
                VStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Text("your genre.")
                            .font(.custom("Transcity", size: 96))
                            .foregroundColor(Color(hex: "#B64812"))

                        Text("Let’s start with telling Mello your favorite genres. Select as many as you want!")
                            .font(.custom("HelveticaNeue-Roman", size: 20))
                            .foregroundColor(Color(hex: "#CE793A"))
                            .padding(.horizontal, 17)
                            .multilineTextAlignment(.center)
                    }

                // select genre
                GenreGrid(allGenres: allGenres, selected: $selectedGenres)
                    .frame(height: 260)          // confines scrolling
                    .clipped()                   // prevents bleed into other elements
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 400)
                
                //button
                .overlay(alignment: .bottom) {
                    VStack(spacing: 8) {
                        NavigationLink(destination: setupPage2()) {
                            Text("Next")
                                .font(.custom("HelveticaNeue-Medium", size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color(hex: "#B64B12"))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal, 64)
                    .padding(.bottom, 32)
                }
            }//ZStack end
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .bold))
                        Text("Back")
                            .font(.custom("HelveticaNeue-Roman", size: 22)).bold()
                    }
                    .foregroundColor(Color(hex: "#E5D1AF"))
                    .padding(.horizontal, 12).padding(.vertical, 8)
                }
            }
        }
    }
}

struct setupPage2: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedArtistIDs: Set<UUID> = []

    var body: some View {
        NavigationStack {
            ZStack {
                // background
                Color(hex: "#B64B12").ignoresSafeArea()
                Rectangle()
                    .fill(Color(hex: "#E5D1AF"))
                    .frame(width: 450, height: 700)
                    .clipShape(RoundedCorner(radius: 204.5, corners: [.topLeft, .topRight]))
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea()

                Image("happy cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 382, height: 380)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .offset(y: 105)
                    .zIndex(10)

                // content
                VStack(spacing: 24) {
                    VStack(spacing: 6) {
                        Text("fav artists.")
                            .font(.custom("Transcity", size: 96))
                            .foregroundColor(Color(hex: "#B64812"))

                        Text("Almost done! Lastly, tell Mello your favorite artists and let Mello do the rest!")
                            .font(.custom("HelveticaNeue-Roman", size: 20))
                            .foregroundColor(Color(hex: "#CE793A"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 17)
                    }

                    // grid
                    AvatarGrid(artists: demoArtists, selected: $selectedArtistIDs)
                        .frame(height: 230)
                        .clipped()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 210)
            }
            
            // button
            .overlay(alignment: .bottom) {
                NavigationLink(destination: homePage()) {
                    Text("Start listening")
                        .font(.custom("HelveticaNeue-Medium", size: 24))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color(hex: "#B64B12"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .ignoresSafeArea()
                .padding(.horizontal, 64)
                .padding(.bottom, 4)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left").font(.system(size: 16, weight: .bold))
                            Text("Back").font(.custom("HelveticaNeue-Roman", size: 22)).bold()
                        }
                        .foregroundColor(Color(hex: "#E5D1AF"))
                    }
                }
            }
        }
    }
}

// initialize for artists
struct Artist: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

let demoArtists: [Artist] = [
        .init(name: "Artist 1", imageName: "artist1"),
        .init(name: "Artist 2", imageName: "artist2"),
        .init(name: "Artist 3", imageName: "artist3"),
        .init(name: "Artist 4", imageName: "artist4"),
        .init(name: "Artist 5", imageName: "artist5"),
        .init(name: "Artist 6", imageName: "artist6"),
        .init(name: "Artist 7", imageName: "artist7"),
        .init(name: "Artist 8", imageName: "artist8"),
        .init(name: "Artist 9", imageName: "artist9"),
]
// artists grid
struct AvatarGrid: View {
    let artists: [Artist]
    @Binding var selected: Set<UUID>

    let size: CGFloat = 84
    let spacing: CGFloat = 16
    private var cols: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing, alignment: .center), count: 3)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: cols, alignment: .center, spacing: spacing) {
                ForEach(artists) { artist in
                    let isSelected = selected.contains(artist.id)

                    Button {
                        if isSelected { selected.remove(artist.id) }
                        else { selected.insert(artist.id) }
                    } label: {
                        AvatarCircle(
                            image: Image(artist.imageName),
                            size: size,
                            isSelected: isSelected
                        )
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
        }
    }
}


// styling for artist circles
struct AvatarCircle: View {
    var image: Image
    var size: CGFloat = 84
    var isSelected: Bool = false

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color(hex: "#B64812"),
                            lineWidth: isSelected ? 3 : 0)   // ← ring only when selected
            )
            .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
            .animation(.easeInOut(duration: 0.12), value: isSelected)
    }
}


// grid for genre selection
private struct GenreGrid: View {
    let allGenres: [String]
    @Binding var selected: Set<String>

    // auto-wrapping chip layout
    private let cols = [GridItem(.adaptive(minimum: 110), spacing: 12, alignment: .center)]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: cols, alignment: .leading, spacing: 12) {
                ForEach(allGenres, id: \.self) { g in
                    GenreChip(
                        title: g,
                        isSelected: selected.contains(g),
                        tap: {
                            if selected.contains(g) { selected.remove(g) }
                            else { selected.insert(g) }
                        }
                    )
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 6)
            .padding(.vertical, 8)
        }
    }
}

// selected inverse
private struct GenreChip: View {
    let title: String
    let isSelected: Bool
    let tap: () -> Void

    var body: some View {
        Button(action: tap) {
            Text(title)
                .font(.custom("HelveticaNeue-Medium", size: 18))
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .frame(minWidth: 88)
                // inverse style when selected
                .background(isSelected ? Color(hex: "#B64812") : .clear)
                .foregroundColor(isSelected ? Color(hex: "#E5D1AF") : Color(hex: "#B64812"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color(hex: "#B64812"), lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .buttonStyle(.plain)
        .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .animation(.easeInOut(duration: 0.12), value: isSelected)
    }
}

private struct LabeledField<Content: View>: View {
    let title: String
    @ViewBuilder var content: Content

    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.custom("HelveticaNeue-Medium", size: 18))
                .foregroundColor(Color(hex: "#B64812"))
            content
                .padding(14)
                .background(.white.opacity(0.22))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}


//background HEX
public extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

//rounded rect
struct RoundedCorner: Shape {
    var radius: CGFloat = 0
    var corners: UIRectCorner = []
    func path(in rect: CGRect) -> Path {
        let p = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(p.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

