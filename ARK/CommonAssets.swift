//
//  CommonAssets.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/1/24.
//

import Foundation

import SwiftUI

import UIKit

// Circle Number Assets

// Circle 1 Asset

struct CircleOne: View {
    var body: some View {
        ZStack {
            Image("Ellipse 1")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("1") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}
        
        
// Circle 2 Asset

struct CircleTwo: View {
    var body: some View {
        ZStack {
            Image("Ellipse 2")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("2") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}



// Circle 3 Asset

struct CircleThree: View {
    var body: some View {
        ZStack {
            Image("Ellipse 3")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("3") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}



// Circle 4 Asset

struct CircleFour: View {
    var body: some View {
        ZStack {
            Image("Ellipse 4")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("4") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}


// Circle 5 Asset

struct CircleFive: View {
    var body: some View {
        ZStack {
            Image("Ellipse 5")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("5") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}


// Circle 6 Asset

struct CircleSix: View {
    var body: some View {
        ZStack {
            Image("Ellipse 6")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("6") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}


// Circle 7 Asset

struct CircleSeven: View {
    var body: some View {
        ZStack {
            Image("Ellipse 7")
                .resizable() // Make sure the image can be resized
                .aspectRatio(contentMode: .fill) // Keep the aspect ratio
                .frame(width: 48, height: 48)
                .background(Color.white) // Set background color to white
                .clipShape(Circle()) // Clip the Image to a Circle
                .overlay(
                    Circle() // Use Circle instead of Rectangle for the overlay to match the circle shape
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
            
            Text("7") // Place a "1" on top of the circle
                .font(.system(size: 24)) // Adjust font size as needed
                .foregroundColor(.black) // Set text color
        }
        
    }
}

//------------------------------------------------------------------------------

// Today's Date
        
struct CommonText{
        var FormattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter.string(from: Date())
            
        }
        
        
        
        
        
    }


// CheckBox Asset (MedHisB)
struct CheckBox: View {
    @Binding var isChecked: Bool
    var label: String = ""

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                Text(label)
            }
        }
    }
}

struct CustomCheckBox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}

struct DropdownMenu: View {
    var options: [String]
    @Binding var selectedOptions: [String]
    @State private var isMenuVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    isMenuVisible.toggle()
                }
            }) {
                HStack {
                    Text("Selected options: \(selectedOptions.joined(separator: ", "))")
                    Image(systemName: "chevron.down")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
            
            if isMenuVisible {
                ForEach(options.indices, id: \.self) { index in
                    Toggle(isOn: Binding(
                        get: {
                            self.selectedOptions.contains(self.options[index])
                        },
                        set: { newValue in
                            if newValue {
                                self.selectedOptions.append(self.options[index])
                            } else {
                                self.selectedOptions.removeAll { $0 == self.options[index] }
                            }
                        }
                    )) {
                        Text(options[index])
                    }
                    .padding(.vertical, 8)
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
        }
        
    }
}


// Image Picker Camera Button (MedHisB)
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.isPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }
}

// Acknowledgement Text (ConsentView)
struct AcknowledgementText: View{
    var body: some View {    // Body text
        Text("I acknowledge that my doctor has explained to me that I will have an operation, treatment or procedure. My doctor has explained the risks of the procedure, advised me of alternative treatments, and told me about the expected outcome and what could happen if my condition remains untreated. I also understand that anesthesia services are needed so that I would experience much less pain, discomfort or anxiety during my planned operation or procedure. It has been explained to me that all forms of anesthesia involve some risks and no guarantees or promises can be made concerning the results of my anesthesia, procedure or treatment. Although rare, severe and unexpected complications with anesthesia can occur and inclu de the remote possibility of infection, bleeding, drug reactions, blood clots, loss of sensation, loss of limb function, paralysis, stroke, brain damage, heart attack, cardiac arrest, or death. I understand that these risks apply to all forms of anesthesia and that additional or specific risks have been identified as they may apply to a specific type of anesthesia. I understand that the anesthetic technique to be used is determined by many factors including my physical condition, the type of procedure my doctor will do, his or her preference, as well as my own desire. It has been explained to me that sometimes an anesthetic technique which involves the use of local anesthetics may not succeed completely and therefore, another technique may have to be used, including general anesthesia. Furthermore, I understand that while I am receiving anesthesia, conditions may develop which require modifying or extending this consent. I therefore authorize modifications or extension of this consent that professional judgment indicates to be necessary under the circumstances.")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .background(.clear)
            .frame(width: 630, height: 330, alignment: .leading)

        
    }
    
    
}

// Exceptions Text (ConsentView)
struct ExceptionsText: View{
    var body: some View {    // Body text
        Text("I certify that I have, to the best of my ability, told the Anesthesiologist/CRNA obtaining consent of all major illnesses I have had, of all past anesthetics I have received and any complications of these anesthetics known to me, of any drug allergies I have, and of all medications I have recently taken, including aspirin, over-thecounter medications, pain medications, herbal supplements, and recreational street drugs. I have also responded truthfully to any additional questions asked by the Anesthesiologist/CRNA. I understand that my anesthesia care will be given to me by or under the supervision of an attending Anesthesiologist or by a CRNA. If I am pregnant I understand that elective surgery should be postponed until after the baby is born. Although fetal complications of anesthesia during pre gnancy are very rare, therisks to my baby include, but are not limited to, birth defects, premature labor, permanent brain damage and death of my newborn")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 630, height: 200, alignment: .leading)
            
        Text("I have listened to the Anesthesiologist/CRNA explain the type(s) of anesthesia/analgesia I may receive, it’s benefits, and common foreseeable risks and consequences, as well as those of its alternatives and now accept his or her recommendation with the EXCEPTION of")
            .frame(width: 630, height: 100, alignment: .leading)
        
    }
    
}

struct AdditionalNotesSymbol: View {
    @Binding var isAnimating: Bool
    @State private var ringColor = Color.white
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            // Red ring that flashes when isAnimating is true
            Circle()
                .strokeBorder(ringColor, lineWidth: 5)
                .frame(width: 60, height: 60)

            // Blue circle background
            Circle()
                .fill(Color(red: 0.54, green: 0.68, blue: 0.97))
                .frame(width: 50, height: 50)

            // Pencil icon
            Image(systemName: "pencil")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
        .onAppear {
            if isAnimating {
                startFlashing()
            }
        }
        .onDisappear {
            stopFlashing()
        }
        .onChange(of: isAnimating) { newValue in
            if newValue {
                startFlashing()
            } else {
                stopFlashing()
            }
        }
        .padding(.trailing)
        .offset(x: 40, y: 0)
    }

    // Starts the flashing animation
    func startFlashing() {
        ringColor = Color.red
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation {
                ringColor = (ringColor == Color.red) ? Color.white : Color.red
            }
        }
    }

    // Stops the flashing animation
    func stopFlashing() {
        timer?.invalidate()
        ringColor = Color.white
    }
}






