import Combine
import SwiftUI

struct RecordButton: View {
    @Environment(\.buttonColor) private var buttonColor
    @Environment(\.progressColor) private var progressColor
    
    @Namespace private var animation
    
    @Binding var isRecording: Bool
    @Binding var duration: TimeInterval
    var maxDuration: TimeInterval = 10
    
    var body: some View {
        button
            .animation(.easeInOut)
            .frame(width: 55, height: 55)
            .padding(40)
            .onTapGesture {
                isRecording.toggle()
            }
    }

    @ViewBuilder private var button: some View {
        if isRecording {
            recordingButton
        } else {
            if duration == 0 {
                startRecordingButton
            } else {
                continueRecordingButton
            }
        }
    }
    
    private var startRecordingButton: some View {
        Circle()
            .fill(buttonColor)
            .padding(8)
            .matchedGeometryEffect(id: "Base", in: animation)
            .overlay(
                Circle()
                    .strokeBorder(buttonColor.opacity(0.6), lineWidth: 4)
            )
    }
    
    private var continueRecordingButton: some View {
        Circle()
            .fill(buttonColor)
            .padding(8)
            .matchedGeometryEffect(id: "Base", in: animation)
            .overlay(recordingProgress)
            .overlay(
                Image(systemName: "pause")
                    .font(Font.title2.weight(.heavy))
            )
    }
    
    private var recordingButton: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(buttonColor)
            .padding(15)
            .matchedGeometryEffect(id: "Base", in: animation)
            .overlay(recordingProgress)
    }
    
    private var recordingProgress: some View {
        let durationPercentage = CGFloat(duration / maxDuration)
        return Circle()
            .trim(from: 0, to: durationPercentage)
            .stroke(progressColor, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .rotationEffect(Angle(degrees: 270.0))
            .matchedGeometryEffect(id: "Progress", in: animation)
    }
}

struct RecordButton_Previews: PreviewProvider {
    struct RecordButtonContainer: View {
        @State private var isRecording = false
        
        var body: some View {
            RecordButton(isRecording: $isRecording, duration: .constant(0.5))
        }
    }
    
    static var previews: some View {
        RecordButtonContainer()
    }
}
